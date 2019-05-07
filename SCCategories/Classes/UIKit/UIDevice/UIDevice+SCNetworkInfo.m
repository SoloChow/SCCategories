//
//  UIDevice+SCNetworkInfo.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIDevice+SCNetworkInfo.h"
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <sys/socket.h>
#import <sys/sysctl.h>

@implementation UIDevice (SCNetworkInfo)

#pragma mark - Network Info
- (NSString *)_sc_ipAddressWithIfaName:(NSString *)name {
    if (name.length == 0) return nil;
    NSString *address = nil;
    struct ifaddrs *addrs = NULL;
    if (getifaddrs(&addrs) == 0) {
        struct ifaddrs *addr = addrs; // 结构体指针
        while (addr) {
            // -> 指向结构体中含有子数据的指针, 用来取子数据
            if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:name]) {
                sa_family_t family = addr->ifa_addr->sa_family;
                switch (family)
                {
                    case AF_INET: { // IPv4
                        char str[INET_ADDRSTRLEN] = {0};
                        inet_ntop(family, &(((struct sockaddr_in *)addr->ifa_addr)->sin_addr), str, sizeof(str)); // inet_ntoa():将网络地址转换成“.”点隔的字符串格式
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        break;
                    case AF_INET6:
                    { // IPv6
                        char str[INET6_ADDRSTRLEN] = {0};
                        inet_ntop(family, &(((struct sockaddr_in6 *)addr->ifa_addr)->sin6_addr), str, sizeof(str));
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        break;
                    default: break;
                }
                if (address) break;
            }
            addr = addr->ifa_next;
        }
    }
    freeifaddrs(addrs);
    return address;
}

- (NSString *)sc_ipAddressWIFI {
    return [self _sc_ipAddressWithIfaName:@"en0"]; // WiFi接入时网卡为en0
}

- (NSString *)sc_ipAddressCell {
    return [self _sc_ipAddressWithIfaName:@"pdp_ip0"]; // // 2G/3G/4G接入时网卡为pdp_ip0
}

- (NSString *)sc_macAddress {
    int                 _mib[6];
    size_t              _length;
    char                *buffer;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    _mib[0] = CTL_NET;
    _mib[1] = AF_ROUTE;
    _mib[2] = 0;
    _mib[3] = AF_LINK;
    _mib[4] = NET_RT_IFLIST;
    
    if((_mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if(sysctl(_mib, 6, NULL, &_length, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if((buffer = malloc(_length)) == NULL) {
        printf("Could not allocate memory. Rrror!\n");
        return NULL;
    }
    
    if(sysctl(_mib, 6, buffer, &_length, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buffer;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *address = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                         *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buffer);
    
    return address;
}

typedef struct {
    uint64_t en_in;     // WIFI
    uint64_t en_out;
    uint64_t pdp_ip_in; // WWAN
    uint64_t pdp_ip_out;
    uint64_t awdl_in;   // AWDL
    uint64_t awdl_out;
} sc_net_interface_counter;

static uint64_t sc_net_counter_add(uint64_t counter, uint64_t bytes) {
    // 进位转换 0xFFFFFFFF = -1
    if (bytes < (counter % 0xFFFFFFFF)) {
        counter += 0xFFFFFFFF - (counter % 0xFFFFFFFF);
        counter += bytes;
    } else {
        counter = bytes;
    }
    return counter;
}

static uint64_t sc_net_counter_get_by_type(sc_net_interface_counter *counter, SCUIDeviceNetworkTrafficType type) {
    uint64_t bytes = 0;
    if (type & SCUIDeviceNetworkTrafficTypeWWANSent) bytes += counter->pdp_ip_out;
    if (type & SCUIDeviceNetworkTrafficTypeWWANReceived) bytes += counter->pdp_ip_in;
    if (type & SCUIDeviceNetworkTrafficTypeWIFISent) bytes += counter->en_out;
    if (type & SCUIDeviceNetworkTrafficTypeWIFIReceived) bytes += counter->en_in;
    if (type & SCUIDeviceNetworkTrafficTypeAWDLSent) bytes += counter->awdl_out;
    if (type & SCUIDeviceNetworkTrafficTypeAWDLReceived) bytes += counter->awdl_in;
    return bytes;
}

static sc_net_interface_counter sc_get_net_interface_counter() {
    static dispatch_semaphore_t lock; // 信号量
    static NSMutableDictionary *sharedInCounters;
    static NSMutableDictionary *sharedOutCounters;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInCounters = [NSMutableDictionary new];
        sharedOutCounters = [NSMutableDictionary new];
        lock = dispatch_semaphore_create(1);
    });
    
    sc_net_interface_counter counter = {0};
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    // 获取本地网络接口信息
    if (getifaddrs(&addrs) == 0) {
        cursor = addrs;
        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER); // 等待
        while (cursor) {
            //  Link layer interface(连接层接口)
            if (cursor->ifa_addr->sa_family == AF_LINK) {
                const struct if_data *data = cursor->ifa_data; // ifa_data 存储该接口协议族的特殊信息
                NSString *name = cursor->ifa_name ? [NSString stringWithUTF8String:cursor->ifa_name] : nil; // fa_name 是接口名称，以0结尾的字符串，比如eth0，lo
                if (name) {
                    uint64_t counter_in = ((NSNumber *)sharedInCounters[name]).unsignedLongLongValue;
                    counter_in = sc_net_counter_add(counter_in, data->ifi_ibytes); // ifi_ibytes total number of octets received
                    sharedInCounters[name] = @(counter_in);
                    
                    uint64_t counter_out = ((NSNumber *)sharedOutCounters[name]).unsignedLongLongValue;
                    counter_out = sc_net_counter_add(counter_out, data->ifi_obytes);
                    sharedOutCounters[name] = @(counter_out);
                    
                    if ([name hasPrefix:@"en"]) { // WIFI
                        counter.en_in += counter_in;
                        counter.en_out += counter_out;
                    } else if ([name hasPrefix:@"awdl"]) { // AWDL
                        counter.awdl_in += counter_in;
                        counter.awdl_out += counter_out;
                    } else if ([name hasPrefix:@"pdp_ip"]) { // WWAN
                        counter.pdp_ip_in += counter_in;
                        counter.pdp_ip_out += counter_out;
                    }
                }
            }
            cursor = cursor->ifa_next;
        }
        dispatch_semaphore_signal(lock); // 释放
        freeifaddrs(addrs);
    }
    
    return counter;
}

- (uint64_t)sc_getNetworkTrafficBytes:(SCUIDeviceNetworkTrafficType)types {
    sc_net_interface_counter counter = sc_get_net_interface_counter();
    return sc_net_counter_get_by_type(&counter, types);
}

@end

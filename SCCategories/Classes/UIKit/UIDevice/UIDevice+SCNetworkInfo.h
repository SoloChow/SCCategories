//
//  UIDevice+SCNetworkInfo.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  设备网络信息

#import <UIKit/UIKit.h>

/**
 设备网络传输类型:
 
 WWAN: Wireless Wide Area Network. -> 2G/3G/4G.
 
 WIFI: Wi-Fi.
 
 AWDL: Apple Wireless Direct Link (peer-to-peer connection). -> AirDrop, AirPlay, GameKit
 */
typedef NS_OPTIONS(NSUInteger, SCUIDeviceNetworkTrafficType) {
    SCUIDeviceNetworkTrafficTypeWWANSent     = 1 << 0,
    SCUIDeviceNetworkTrafficTypeWWANReceived = 1 << 1,
    SCUIDeviceNetworkTrafficTypeWIFISent     = 1 << 2,
    SCUIDeviceNetworkTrafficTypeWIFIReceived = 1 << 3,
    SCUIDeviceNetworkTrafficTypeAWDLSent     = 1 << 4,
    SCUIDeviceNetworkTrafficTypeAWDLReceived = 1 << 5,
    
    SCUIDeviceNetworkTrafficTypeWWAN = SCUIDeviceNetworkTrafficTypeWWANSent | SCUIDeviceNetworkTrafficTypeWWANReceived,
    SCUIDeviceNetworkTrafficTypeWIFI = SCUIDeviceNetworkTrafficTypeWIFISent | SCUIDeviceNetworkTrafficTypeWIFIReceived,
    SCUIDeviceNetworkTrafficTypeAWDL = SCUIDeviceNetworkTrafficTypeAWDLSent | SCUIDeviceNetworkTrafficTypeAWDLReceived,
    
    SCUIDeviceNetworkTrafficTypeALL = SCUIDeviceNetworkTrafficTypeWWAN |
    SCUIDeviceNetworkTrafficTypeWIFI |
    SCUIDeviceNetworkTrafficTypeAWDL,
};

@interface UIDevice (SCNetworkInfo)

#pragma mark - Network Info
@property (nonatomic, readonly) NSString *sc_ipAddressWIFI; ///< 设备当前WIFI IP地址(或为nil, @"192.168.1.111");
@property (nonatomic, readonly) NSString *sc_ipAddressCell; ///< 设备当前Cell IP地址(可为nil, @"10.2.2.222");
@property (nonatomic, readonly) NSString *sc_macAddress;    ///< 设备的Mac地址(iOS 7以后，无法通过该接口获取有效Mac地址)

/**
 根据设备网络传输类型, 获取设备网络传输数据大小(单位字节, 从上次启动时间算起)
 Usage:
 
 uint64_t bytes = [[UIDevice currentDevice] getNetworkTrafficBytes:SCNetworkTrafficTypeALL];
 NSTimeInterval time = CACurrentMediaTime();
 
 uint64_t bytesPerSecond = (bytes - _lastBytes) / (time - _lastTime);
 
 _lastBytes = bytes;
 _lastTime = time;
 
 @param types 设备网络传输类型
 @return 设备网络传输数据大小
 */
- (uint64_t)sc_getNetworkTrafficBytes:(SCUIDeviceNetworkTrafficType)types;

@end

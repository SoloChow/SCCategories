//
//  UIDevice+SCMemoryInfo.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIDevice+SCMemoryInfo.h"
#import <mach/mach.h>

typedef NS_ENUM(NSUInteger, SCUIDeviceCurrentMemoryInfo) {
    SCUIDeviceCurrentMemoryInfoUsed = 1,
    SCUIDeviceCurrentMemoryInfoFree,
    SCUIDeviceCurrentMemoryInfoActive,
    SCUIDeviceCurrentMemoryInfoInactive,
    SCUIDeviceCurrentMemoryInfoWired,
    SCUIDeviceCurrentMemoryInfoPurgeable,
};

@implementation UIDevice (SCMemoryInfo)

#pragma mark - Memory Info
- (int64_t)sc_memoryTotal {
    int64_t mem = [[NSProcessInfo processInfo] physicalMemory];
    if (mem < -1) mem = -1;
    return mem;
}

static uint64_t sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfo type) {
    mach_port_t host_port = mach_host_self(); // returns send rights to the task's host self port. 获取进程权限
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t); // sizeof():字节数
    vm_size_t page_size; // 页面数
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size); // Provide the system's virtual page size.
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size); //  returns scheduling and virtual memory statistics concerning the host as specified by flavor.
    if (kern != KERN_SUCCESS) return -1;
    
    switch (type) {
        case SCUIDeviceCurrentMemoryInfoUsed:
            return page_size * (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count); // 乘以vm_page_size拿到字节数。free是空闲内存; active是已使用, 但可被分页的(在iOS中，只有在磁盘上静态存在的才能被分页，例如文件的内存映射，而动态分配的内存是不能被分页的); inactive是不活跃的, 实际上内存不足时, 你的应用就可以抢占这部分内存, 因此也可看作空闲内存; wire就是已使用, 且不可被分页的。
        case SCUIDeviceCurrentMemoryInfoFree:
            return vm_stat.free_count * page_size;
        case SCUIDeviceCurrentMemoryInfoActive:
            return vm_stat.active_count * page_size;
        case SCUIDeviceCurrentMemoryInfoInactive:
            return vm_stat.inactive_count * page_size;
        case SCUIDeviceCurrentMemoryInfoWired:
            return vm_stat.wire_count * page_size;
        case SCUIDeviceCurrentMemoryInfoPurgeable:
            return vm_stat.purgeable_count * page_size;
            
        default:
            break;
    }
}

- (int64_t)sc_memoryUsed {
    return sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfoUsed);
}

- (int64_t)sc_memoryFree {
    return sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfoFree);
}

- (int64_t)sc_memoryActive {
    return sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfoActive);
}

- (int64_t)sc_memoryInactive {
    return sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfoInactive);
}

- (int64_t)sc_memoryWired {
    return sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfoWired);
}

- (int64_t)sc_memoryPurgeable {
    return sc_current_memory_info_get_by_type(SCUIDeviceCurrentMemoryInfoPurgeable);
}

@end

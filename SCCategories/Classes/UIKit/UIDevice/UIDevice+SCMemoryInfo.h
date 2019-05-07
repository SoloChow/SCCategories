//
//  UIDevice+SCMemoryInfo.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  设备内存信息

#import <UIKit/UIKit.h>

@interface UIDevice (SCMemoryInfo)

@property (nonatomic, readonly) int64_t sc_memoryTotal;     ///< 当前内存物理总空间(单位字节, error -> -1)
@property (nonatomic, readonly) int64_t sc_memoryUsed;      ///< 当前内存已使用空间(单位字节, active + inactive + wired, error -> -1)
@property (nonatomic, readonly) int64_t sc_memoryFree;      ///< 当前内存空闲空间(单位字节, error -> -1)
@property (nonatomic, readonly) int64_t sc_memoryActive;    ///< 当前内存活动空间(单位字节, 已使用, 但可被分页. error -> -1)
@property (nonatomic, readonly) int64_t sc_memoryInactive;  ///< 当前内存不活跃空间(单位字节, 内存不足时, 应用可抢占这部分内存, 可看作空闲内存. error -> -1)
@property (nonatomic, readonly) int64_t sc_memoryWired;     ///< 当前内存系统核心占用空间(单位字节, 已使用, 且不可被分页. error -> -1)
@property (nonatomic, readonly) int64_t sc_memoryPurgeable; ///< 当前内存可回收内存空间(单位字节, error -> -1)

@end

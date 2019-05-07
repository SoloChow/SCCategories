//
//  UIDevice+SCCPUInfo.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  设备CPU信息

#import <UIKit/UIKit.h>

@interface UIDevice (SCCPUInfo)

@property (nonatomic, readonly) NSUInteger sc_cpuCount;                       ///< 获取运行该进程的系统的处于激活状态的CPU处理器(内核)数量
@property (nonatomic, readonly) float sc_cpuUsage;                            ///< 获取当前CPU的占用率(1.0 -> 100%. error -> -1)
@property (nonatomic, readonly) NSArray<NSNumber *> *sc_cpuUsagePerProcessor; ///< 获取当前CPU每个处理器(内核)的占用率(1.0 -> 100%. error -> nil)

@end

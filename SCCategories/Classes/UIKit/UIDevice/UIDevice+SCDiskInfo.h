//
//  UIDevice+SCDiskInfo.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  设备硬盘信息

#import <UIKit/UIKit.h>

@interface UIDevice (SCDiskInfo)

@property (nonatomic, readonly) int64_t sc_diskSpace;     ///< 当前硬盘总空间(单位字节, error -> -1)
@property (nonatomic, readonly) int64_t sc_diskSpaceFree; ///< 当前硬盘空闲空间(单位字节, error -> -1)
@property (nonatomic, readonly) int64_t sc_diskSpaceUsed; ///< 当前硬盘已使用空间(单位字节, error -> -1)

@end

//
//  NSTimer+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SCBase)

#pragma mark - Base
/**
 创建定时器(带执行Block), 并在当前runloop的默认模式内调度

 @param seconds 几秒后触发定时器(若时间不大于0.0, 将以0.1毫秒替代)
 @param block   定时器触发后执行的block
 @param repeats 是否重复(YES -> 定时器设为invalidated后才停止)
 @return NSTimer对象
 */
+ (NSTimer *)sc_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                         block:(void (^)(NSTimer *timer))block
                                       repeats:(BOOL)repeats;

/**
 创建定时器(带执行Block), 必须将定时器加入Runloop内(addTimer:forMode:), 若定时器设置repeats为YES, 其后无须再次将定时器加入Runloop

 @param seconds 几秒后触发定时器(若时间不大于0.0, 将以0.1毫秒替代)
 @param block   定时器触发后执行的block
 @param repeats 是否重复(YES -> 定时器设为invalidated后才停止)
 @return NSTimer对象
 */
+ (NSTimer *)sc_timerWithTimeInterval:(NSTimeInterval)seconds
                                block:(void (^)(NSTimer *timer))block
                              repeats:(BOOL)repeats;

@end

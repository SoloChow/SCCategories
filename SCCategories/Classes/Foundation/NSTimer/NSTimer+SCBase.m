//
//  NSTimer+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSTimer+SCBase.h"

@implementation NSTimer (SCBase)

#pragma mark - Base
+ (NSTimer *)sc_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(_sc_executeBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)sc_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(_sc_executeBlock:) userInfo:[block copy] repeats:repeats];
}

+ (void)_sc_executeBlock:(NSTimer *)timer {
    // [timer userInfo] == NSTimerExecutionWhileFiring block
    if ([timer userInfo])  {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

@end

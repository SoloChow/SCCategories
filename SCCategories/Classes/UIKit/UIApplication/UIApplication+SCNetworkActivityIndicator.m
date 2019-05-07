//
//  UIApplication+SCNetworkActivityIndicator.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIApplication+SCNetworkActivityIndicator.h"
#import "NSObject+SCAssociatedValue.h"

#define kNetworkIndicatorDelay (1/30.0)
@interface SCUIApplicationNetworkIndicatorInfo : NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SCUIApplicationNetworkIndicatorInfo
@end


@implementation UIApplication (SCNetworkActivityIndicator)

#pragma mark - Network Activity Indicator
- (void)_sc_setNetworkActivityInfo:(SCUIApplicationNetworkIndicatorInfo *)info {
    [self willChangeValueForKey:NSStringFromSelector(@selector(_sc_networkActivityInfo))];
    [self sc_setAssociatedValue:info withKey:_cmd];
    [self didChangeValueForKey:NSStringFromSelector(@selector(_sc_networkActivityInfo))];
}

- (SCUIApplicationNetworkIndicatorInfo *)_sc_networkActivityInfo {
    return [self sc_getAssociatedValueForKey:@selector(_sc_setNetworkActivityInfo:)];
}

- (void)_sc_delaySetActivity:(NSTimer *)timer {
    NSNumber *visiable = timer.userInfo;
    if (self.networkActivityIndicatorVisible != visiable.boolValue) {
        [self setNetworkActivityIndicatorVisible:visiable.boolValue];
    }
    [timer invalidate];
}

- (void)_sc_changeNetworkActivityCount:(NSInteger)delta {
    @synchronized(self) {
        dispatch_async(dispatch_get_main_queue(), ^{
            SCUIApplicationNetworkIndicatorInfo *info = [self _sc_networkActivityInfo];
            if (!info) {
                info = [SCUIApplicationNetworkIndicatorInfo new];
                [self _sc_setNetworkActivityInfo:info];
            }
            NSInteger count = info.count;
            count += delta;
            info.count = count;
            [info.timer invalidate];
            info.timer = [NSTimer timerWithTimeInterval:kNetworkIndicatorDelay target:self selector:@selector(_sc_delaySetActivity:) userInfo:@(info.count > 0) repeats:NO];
            [[NSRunLoop mainRunLoop] addTimer:info.timer forMode:NSRunLoopCommonModes];
        });
    }
}

- (void)sc_incrementNetworkActivityCount {
    [self _sc_changeNetworkActivityCount:1];
}

- (void)sc_decrementNetworkActivityCount {
    [self _sc_changeNetworkActivityCount:-1];
}


@end

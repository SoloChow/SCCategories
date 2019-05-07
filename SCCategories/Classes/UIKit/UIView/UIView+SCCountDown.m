//
//  UIView+SCCountDown.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "UIView+SCCountDown.h"

@implementation UIView (SCCountDown)

- (void)sc_changeWithCountDown:(NSInteger)seconds countDownHandler:(void (^)(id sender, NSInteger second, BOOL finished))countDownHandler {
    //倒计时时间
    __block NSInteger timeOut = seconds;
    __block BOOL finished = NO;
    __weak typeof(self) weakSelf = self;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        NSInteger second = timeOut % 60;
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                finished = YES;
                !countDownHandler?:countDownHandler(weakSelf, second, finished);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                !countDownHandler?:countDownHandler(weakSelf, second, finished);
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end

//
//  UIView+SCCountDown.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  倒计时处理

#import <UIKit/UIKit.h>

@interface UIView (SCCountDown)

/**
 根据倒计时间及倒计回调处理, 改变View
 
 @param seconds 倒计时间
 @param countDownHandler 倒计回调处理(每秒执行一次回调, 当且仅当倒计结束, finished为YES)
 */
- (void)sc_changeWithCountDown:(NSInteger)seconds countDownHandler:(void (^)(id sender, NSInteger second, BOOL finished))countDownHandler;

@end

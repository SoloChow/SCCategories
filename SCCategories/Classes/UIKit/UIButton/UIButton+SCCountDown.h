//
//  UIButton+SCCountDown.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  倒计时处理

#import <UIKit/UIKit.h>

@interface UIButton (SCCountDown)

#pragma mark - Count Down
/**
 根据倒计时间, 倒计标题, 倒计背景颜色, 结束标题及结束背景颜色, 修改Button(每秒修改)
 
 @param seconds                 倒计时间
 @param title                   倒计标题
 @param backgroundColor         倒计背景颜色
 @param finishedTitle           结束标题
 @param finishedBackgroundColor 结束背景颜色
 */
- (void)sc_changeWithCountDown:(NSInteger)seconds
                         title:(NSString *)title
               backgroundColor:(UIColor *)backgroundColor
                 finishedTitle:(NSString *)finishedTitle
       finishedBackgroundColor:(UIColor *)finishedBackgroundColor;

@end

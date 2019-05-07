//
//  CALayer+SCFadeAnimation.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  淡入淡出动画

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIView.h>

@interface CALayer (SCFadeAnimation)

/**
 为layer的内容添加Fade(淡入淡出)动画, 内容改变时触发
 
 @param duration 动画时长
 @param curve    动画变化曲线
 */
- (void)sc_addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;

/**
 移除Fade(淡入淡出)动画(通过addFadeAnimationWithDuration:curve:方法添加)
 */
- (void)sc_removePreviousFadeAnimation;

@end

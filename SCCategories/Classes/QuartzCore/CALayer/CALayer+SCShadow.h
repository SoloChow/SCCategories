//
//  CALayer+SCShadow.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  阴影

#import <QuartzCore/QuartzCore.h>


@class UIColor;

@interface CALayer (SCShadow)

/**
 设置layer阴影
 
 @param color  阴影颜色
 @param offset 阴影偏移量
 @param radius 阴影角度
 */
- (void)sc_setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;

@end

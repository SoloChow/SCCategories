//
//  UIView+SCShadow.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import <UIKit/UIKit.h>

@interface UIView (SCShadow)

/**
 设置View的阴影
 
 @param color  阴影颜色
 @param offset 阴影偏移量
 @param radius 阴影角度
 */
- (void)sc_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

@end

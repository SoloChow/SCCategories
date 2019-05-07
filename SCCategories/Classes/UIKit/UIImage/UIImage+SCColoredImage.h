//
//  UIImage+SCColoredImage.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片着色处理

#import <UIKit/UIKit.h>

@interface UIImage (SCColoredImage)

/**
 根据图片颜色, 创建一张1x1 point大小的图片(error -> nil)
 
 @param color 图片颜色
 @return 新图片(error -> nil)
 */
+ (UIImage *)sc_imageWithColor:(UIColor *)color;

/**
 根据图片颜色和尺寸, 创建图片(error -> nil)
 
 @param color 图片颜色
 @param size  图片尺寸
 @return 新图片(error -> nil)
 */
+ (UIImage *)sc_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 根据着色颜色, 填充图片的alpha通道(error -> nil)
 
 @param color 着色颜色
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByTintColor:(UIColor *)color;

@end

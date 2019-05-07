//
//  UIImage+SCRoundedImage.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片圆角处理

#import <UIKit/UIKit.h>

@interface UIImage (SCRoundedImage)

/**
 将矩形图片裁切为圆形图片(以中心点为圆心, 最短边长为直径进行裁切, 单位为像素<Pixel>, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByCropToRound;

/**
 根据角度值, 设置圆角图片(error -> nil)
 
 @param radius 角度值(若角度值大于图片宽度或高度的一半, 将根据图片宽度或高度的一半调整)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRoundCornerRadius:(CGFloat)radius;

/**
 根据角度值, 边框宽度和颜色,设置圆角图片(error -> nil)
 
 @param radius      角度值(若角度值大于图片宽度或高度的一半, 将根据图片宽度或高度的一半调整)
 @param borderWidth 边框宽度(若边框宽度大于图片宽度或高度的一半, 将根据图片宽度或高度的一半调整)
 @param borderColor 边框颜色(nil -> clearColor)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRoundCornerRadius:(CGFloat)radius
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(UIColor *)borderColor;

/**
 根据角度值, 边角, 边框宽度, 边框颜色和边框线连接样式, 设置圆角图片(error -> nil)
 
 @param radius         角度值(若角度值大于图片宽度或高度的一半, 将根据图片宽度或高度的一半调整)
 @param corners        边角(指定上下左右)
 @param borderWidth    边框宽度(若边框宽度大于图片宽度或高度的一半, 将根据图片宽度或高度的一半调整)
 @param borderColor    边框颜色(nil -> clearColor)
 @param borderLineJoin 边框线连接样式
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRoundCornerRadius:(CGFloat)radius
                                 corners:(UIRectCorner)corners
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(UIColor *)borderColor
                          borderLineJoin:(CGLineJoin)borderLineJoin;

@end

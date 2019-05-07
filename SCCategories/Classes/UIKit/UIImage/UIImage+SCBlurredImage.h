//
//  UIImage+SCBlurredImage.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片模糊滤镜处理

#import <UIKit/UIKit.h>

@interface UIImage (SCBlurredImage)

/**
 返回一张带灰度滤镜的图片(error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByGrayscale;

/**
 返回一张带模糊滤镜的图片(柔光, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByBlurSoft;

/**
 返回一张带模糊滤镜的图片(白亮, 类似iOS控制台, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByBlurLight;

/**
 返回一张带模糊滤镜的图片(特亮, 类似iOSNavigationBar白色, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByBlurExtraLight;

/**
 返回一张带模糊滤镜的图片(暗度, 类似iOS通知中心, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByBlurDark;

/**
 根据着色颜色, 返回一张带颜色的模糊滤镜的图片(error -> nil)
 
 @param tintColor 着色颜色
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByBlurWithTint:(UIColor *)tintColor;

/**
 根据图片模糊度, 着色颜色, 饱和度或遮罩图片, 为图片添加滤镜(内存不够/error -> nil)
 
 @param blurRadius    图片模糊度(0 -> 无模糊效果)
 @param tintColor     着色颜色(可选, 与模糊度和饱和度混合作用于图片。颜色的alpha通道决定着色强度。nil -> 无着色)
 @param tintBlendMode 混合模式(默认kCGBlendModeNormal<0>)
 @param saturation    饱和度(1.0 -> 不影响图片; <1.0 -> 图片变淡; >1.0 -> 图片加深)
 @param maskImage     遮罩图片(若指定, 仅在遮罩图片范围内有滤镜效果。图片必须为遮罩或满足CGContextClipToMask遮罩参数的要求)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByBlurRadius:(CGFloat)blurRadius
                        tintColor:(UIColor *)tintColor
                         tintMode:(CGBlendMode)tintBlendMode
                       saturation:(CGFloat)saturation
                        maskImage:(UIImage *)maskImage;

@end

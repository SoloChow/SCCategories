//
//  UIColor+SCHSBColor.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  HSB颜色

#import <UIKit/UIKit.h>

@interface UIColor (SCHSBColor)

#pragma mark - Info
@property (nonatomic, readonly) CGFloat sc_hueOfHSB;                  ///< 获取HSB(HSV)的色相(H)值[0,1]
@property (nonatomic, readonly) CGFloat sc_saturationOfHSB;           ///< 获取HSB(HSV)的饱和度(S)值[0,1]
@property (nonatomic, readonly) CGFloat sc_brightnessOfHSB;           ///< 获取HSB(HSV)的明度(B)值[0,1]

#pragma mark - Create
/**
 根据色相, 饱和度, 明度, 获取颜色(基于设备RGB颜色空间调配)
 
 @param hue         HSB的色相(H)值[0,1]
 @param saturation  HSB的饱和度(S)值[0,1]
 @param brightness  HSB的明度(B)值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                  brightness:(CGFloat)brightness;

#pragma mark - Modify
/**
 根据颜色HSB中色相的变化, 获取修改后的颜色
 
 @param hueDelta 色相(HSB<HSV>)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeHueOfHSB:(CGFloat)hueDelta;

/**
 根据颜色HSB中饱和度的变化, 获取修改后的颜色
 
 @param saturationDelta 饱和度(HSB<HSV>)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeSaturationOfHSB:(CGFloat)saturationDelta;

/**
 根据颜色HSB中明度的变化, 获取修改后的颜色
 
 @param brightnessDelta 明度(HSB<HSV>)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeBrightnessOfHSB:(CGFloat)brightnessDelta;

/**
 根据颜色HSB中色相, 饱和度, 明度和Alpha值的变化, 获取修改后的颜色
 
 @param hueDelta        色相(HSB<HSV>)的变化值[-1,1](0, 不变)
 @param saturationDelta 饱和度(HSB<HSV>)的变化值[-1,1](0, 不变)
 @param brightnessDelta 明度(HSB<HSV>)的变化值[-1,1](0, 不变)
 @param alphaDelta      Alpha的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeHue:(CGFloat)hueDelta
                      saturation:(CGFloat)saturationDelta
                      brightness:(CGFloat)brightnessDelta
                           alpha:(CGFloat)alphaDelta;

@end

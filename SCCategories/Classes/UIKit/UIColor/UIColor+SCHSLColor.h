//
//  UIColor+SCHSLColor.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  HSL颜色

#import <UIKit/UIKit.h>

@interface UIColor (SCHSLColor)

#pragma mark - Info
@property (nonatomic, readonly) CGFloat sc_hueOfHSL;                  ///< 获取HSL的色相(H)值[0,1]
@property (nonatomic, readonly) CGFloat sc_saturationOfHSL;           ///< 获取HSL的饱和度(S)值[0,1]
@property (nonatomic, readonly) CGFloat sc_lightnessOfHSL;            ///< 获取HSL的亮度(L)值[0,1]

/**
 获取根据HSL颜色空间调配的各颜色部分
 
 @param hue        HSL的色相(H)部分[0,1]
 @param saturation HSL的饱和度(S)部分[0,1]
 @param lightness  HSL的亮度(L)部分[0,1]
 @param alpha      Alpha部分[0,1]
 @return 颜色成功转化返回YES, 否则返回NO
 */
- (BOOL)sc_getHue:(CGFloat *)hue
       saturation:(CGFloat *)saturation
        lightness:(CGFloat *)lightness
            alpha:(CGFloat *)alpha;

#pragma mark - Create
/**
 根据色相, 饱和度, 亮度值, 获取颜色(基于设备RGB颜色空间调配)
 
 @param hue        HSL的色相(H)值[0,1]
 @param saturation HSL的饱和度(S)值[0,1]
 @param lightness  HSL的亮度(L)值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                   lightness:(CGFloat)lightness;

/**
 根据色相, 饱和度, 亮度和Alpha值, 获取颜色(基于设备RGB颜色空间调配)
 
 @param hue        HSL的色相(H)值[0,1]
 @param saturation HSL的饱和度(S)值[0,1]
 @param lightness  HSL的亮度(L)值[0,1]
 @param alpha      Alpha值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                   lightness:(CGFloat)lightness
                       alpha:(CGFloat)alpha;

#pragma mark - Modify
/**
 根据颜色HSL中色相的变化, 获取修改后的颜色
 
 @param hueDelta 色相(HSL)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeHueOfHSL:(CGFloat)hueDelta;

/**
 根据颜色HSL中饱和度的变化, 获取修改后的颜色
 
 @param saturationDelta 饱和度(HSL)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeSaturationOfHSL:(CGFloat)saturationDelta;

/**
 根据颜色HSL中亮度的变化, 获取修改后的颜色
 
 @param lightnessDelta 亮度(HSL)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeLightnessOfHSL:(CGFloat)lightnessDelta;

/**
 根据颜色HSL中色相, 饱和度, 亮度和Alpha值的变化, 获取修改后的颜色
 
 @param hueDelta        色相(HSL)的变化值[-1,1](0, 不变)
 @param saturationDelta 饱和度(HSL)的变化值[-1,1](0, 不变)
 @param lightnessDelta  亮度(HSL)的变化值[-1,1](0, 不变)
 @param alphaDelta      Alpha的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeHue:(CGFloat)hueDelta
                      saturation:(CGFloat)saturationDelta
                       lightness:(CGFloat)lightnessDelta
                           alpha:(CGFloat)alphaDelta;

@end

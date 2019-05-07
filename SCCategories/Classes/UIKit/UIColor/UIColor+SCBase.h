//
//  UIColor+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SCBase)

#pragma mark - Base
@property (nonatomic, readonly) CGFloat sc_alpha;                     ///< 获取颜色的Alpha值[0,1]

@property (nonatomic, readonly) CGFloat sc_redOfRGBA;                 ///< 获取RGB/RGBA中的R值[0,1]
@property (nonatomic, readonly) CGFloat sc_greenOfRGBA;               ///< 获取RGB/RGBA中的G值[0,1]
@property (nonatomic, readonly) CGFloat sc_blueOfRGBA;                ///< 获取RGB/RGBA中的B值[0,1]

@property (nonatomic, readonly) CGColorSpaceModel sc_colorSpaceModel; ///< 获取颜色的颜色空间
@property (nonatomic, readonly) NSString *sc_colorSpaceString;        ///< 获取颜色的颜色空间(字符串)

/**
 获取颜色的RGB值(以Hex表示:0x66ccff)

 @return 颜色的RGB值(以Hex表示:0x66ccff)
 */
- (uint32_t)sc_RGBValue;

/**
  获取颜色的RGBA值(以Hex表示:0x66ccffff)

 @return 颜色的RGBA值(以Hex表示:0x66ccffff)
 */
- (uint32_t)sc_RGBAValue;

/**
 获取表示RGB颜色的Hex值字符串(@"0066cc")

 @return RGB颜色的Hex值字符串(@"0066cc")
 */
- (NSString *)sc_hexString;

/**
 获取表示RGBA颜色的HEX值字符串(@"0066ccff")

 @return 表示RGBA颜色的HEX值字符串(@"0066ccff")
 */
- (NSString *)sc_hexStringWithAlpha;

#pragma mark - Check
/**
 判断两个颜色的RGBA值是否一致

 @param otherColor 其他颜色
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToColor:(UIColor *)otherColor;

#pragma mark - Create
/**
 获取RGB随机颜色
 
 @return RGB随机颜色
 */
+ (UIColor *)sc_randomColor;

/**
 获取RGB随机R值的颜色
 
 @return RGB随机R值的颜色
 */
+ (UIColor *)sc_colorWithRandomRed;

/**
 获取RGB随机G值的颜色
 
 @return RGB随机G值的颜色;
 */
+ (UIColor *)sc_colorWithRandomGreen;

/**
 获取RGB随机B值的颜色
 
 @return RGB随机B值的颜色
 */
+ (UIColor *)sc_colorWithRandomBlue;

/**
 根据颜色的RGB值(以Hex表示:0x66cc), 获取颜色

 @param RGBValue 颜色的RGB值(以Hex表示:0x66cc)
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithRGB:(uint32_t)RGBValue;

/**
 根据颜色的RGBA值(以Hex表示:0x66ccff), 获取颜色

 @param RGBAValue 颜色的RGBA值(以Hex表示:0x66ccff)
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithRGBA:(uint32_t)RGBAValue;

/**
 根据颜色的RGB值(以Hex表示:0x66cc)和Alpha值, 获取颜色

 @param RGBValue 颜色的RGB值(以Hex表示:0x66cc)
 @param alpha    Alpha值
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithRGB:(uint32_t)RGBValue alpha:(CGFloat)alpha;

/**
 根据Hex字符串(#000||#0000||#00000||#00000000||0X000||0X0000||0X00000||0X00000000), 获取颜色

 @param hexString Hex字符串
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithHexString:(NSString *)hexString;

/**
 根据Hex(#000||#0000||#00000||#00000000||0X000||0X0000||0X00000||0X00000000)和Alpha值, 获取颜色

 @param hexString Hex字符串
 @param alpha     Alpha值
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

#pragma mark - Modify
/**
 根据添加的颜色及混合模式, 获取修改后的颜色

 @param addColor  添加的颜色
 @param blendMode 混合模式
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByAddColor:(UIColor *)addColor blendMode:(CGBlendMode)blendMode;

/**
 根据颜色Alpha值的变化, 获取修改后的颜色

 @param alphaDelta  Alpha的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeAlpha:(CGFloat)alphaDelta;

/**
 根据颜色Red值的变化, 获取修改后的颜色

 @param redDelta Red(RGB/RGBA)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeRed:(CGFloat)redDelta;

/**
 根据颜色Green值的变化, 获取修改后的颜色

 @param greenDelta Green(RGB/RGBA)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeGreen:(CGFloat)greenDelta;

/**
 根据颜色Blue值的变化, 获取修改后的颜色

 @param blueDelta Blue(RGB/RGBA)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeBlue:(CGFloat)blueDelta;

/**
 根据颜色Red, Green, Blue和Alpha值的变化, 获取修改后的颜色

 @param redDelta   Red(RGB/RGBA)的变化值[-1,1](0, 不变)
 @param greenDelta Green(RGB/RGBA)的变化值[-1,1](0, 不变)
 @param blueDelta  Blue(RGB/RGBA)的变化值[-1,1](0, 不变)
 @param alphaDelta Alpha的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeRed:(CGFloat)redDelta
                           green:(CGFloat)greenDelta
                            blue:(CGFloat)blueDelta
                           alpha:(CGFloat)alphaDelta;

@end

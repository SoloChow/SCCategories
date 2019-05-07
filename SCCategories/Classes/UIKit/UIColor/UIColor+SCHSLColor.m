//
//  UIColor+SCHSLColor.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIColor+SCHSLColor.h"
#import "UIColor+SCColorConvert.h"

@implementation UIColor (SCHSLColor)

#pragma mark - Info
- (CGFloat)sc_hueOfHSL {
    CGFloat hue = 0, saturation, lightness, alpha;
    [self sc_getHue:&hue saturation:&saturation lightness:&lightness alpha:&alpha];
    return hue;
}

- (CGFloat)sc_saturationOfHSL {
    CGFloat hue, saturation = 0, lightness, alpha;
    [self sc_getHue:&hue saturation:&saturation lightness:&lightness alpha:&alpha];
    return saturation;
}

- (CGFloat)sc_lightnessOfHSL {
    CGFloat hue, saturation, lightness = 0, alpha;
    [self sc_getHue:&hue saturation:&saturation lightness:&lightness alpha:&alpha];
    return lightness;
}

- (BOOL)sc_getHue:(CGFloat *)hue saturation:(CGFloat *)saturation lightness:(CGFloat *)lightness alpha:(CGFloat *)alpha {
    CGFloat red, green, blue, aAlpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&aAlpha]) {
        return NO;
    }
    SCRGB2HSL(red, green, blue, hue, saturation, lightness); // 基于RGB颜色空间调配
    *alpha = aAlpha;
    return YES;
}

#pragma mark - Create
+ (UIColor *)sc_colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness {
    return [UIColor sc_colorWithHue:hue saturation:saturation lightness:lightness alpha:1];
}

+ (UIColor *)sc_colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha {
    CGFloat red, green, blue;
    SCHSL2RGB(hue, saturation, lightness, &red, &green, &blue);
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - Modify
- (UIColor *)sc_colorByChangeHueOfHSL:(CGFloat)hueDelta {
    return [self sc_colorByChangeHue:hueDelta saturation:0 lightness:0 alpha:0];
}

- (UIColor *)sc_colorByChangeSaturationOfHSL:(CGFloat)saturationDelta {
    return [self sc_colorByChangeHue:0 saturation:saturationDelta lightness:0 alpha:0];
}

- (UIColor *)sc_colorByChangeLightnessOfHSL:(CGFloat)lightnessDelta {
    return [self sc_colorByChangeHue:0 saturation:0 lightness:lightnessDelta alpha:0];
}

- (UIColor *)sc_colorByChangeHue:(CGFloat)hueDelta saturation:(CGFloat)saturationDelta lightness:(CGFloat)lightnessDelta alpha:(CGFloat)alphaDelta {
    CGFloat hue, saturation, lightness, alpha;
    if (![self sc_getHue:&hue saturation:&saturation lightness:&lightness alpha:&alpha]) {
        return nil;
    }
    
    hue += hueDelta;
    saturation += saturationDelta;
    lightness += lightnessDelta;
    alpha += alphaDelta;
    
    hue -= (int)hue; // 多减(hue:0.5, hueDelta:0.8 -> hue = 0.3) 色相以角度计算(1 -> 360°, +/- -> 顺/逆)
    hue = hue < 0 ? hue + 1 : hue; // 少补(hue:0.5, hueDelta:-0.8 -> hue = 0.7)
    saturation = saturation < 0 ? 0 : saturation > 1 ? 1 : saturation; // [0,1]
    lightness = lightness < 0 ? 0 : lightness > 1 ? 1 : lightness; // [0,1]
    alpha = alpha < 0 ? 0 : alpha > 1 ? 1 : alpha; // [0,1]
    
    return [UIColor sc_colorWithHue:hue saturation:saturation lightness:lightness alpha:alpha];
}

@end

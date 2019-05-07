//
//  UIColor+SCHSBColor.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIColor+SCHSBColor.h"
#import "UIColor+SCColorConvert.h"

@implementation UIColor (SCHSBColor)

#pragma mark - Info
- (CGFloat)sc_hueOfHSB {
    CGFloat hue = 0, saturation, brightness, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return hue;
}

- (CGFloat)sc_saturationOfHSB {
    CGFloat hue, saturation = 0, brightness, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return saturation;
}

- (CGFloat)sc_brightnessOfHSB {
    CGFloat hue, saturation, brightness = 0, alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return brightness;
}

#pragma mark - Create
+ (UIColor *)sc_colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness {
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#pragma mark - Modify
- (UIColor *)sc_colorByChangeHueOfHSB:(CGFloat)hueDelta {
    return [self sc_colorByChangeHue:hueDelta saturation:0 brightness:0 alpha:0];
}

- (UIColor *)sc_colorByChangeSaturationOfHSB:(CGFloat)saturationDelta {
    return [self sc_colorByChangeHue:0 saturation:saturationDelta brightness:0 alpha:0];
}

- (UIColor *)sc_colorByChangeBrightnessOfHSB:(CGFloat)brightnessDelta {
    return [self sc_colorByChangeHue:0 saturation:0 brightness:brightnessDelta alpha:0];
}

- (UIColor *)sc_colorByChangeHue:(CGFloat)hueDelta saturation:(CGFloat)saturationDelta brightness:(CGFloat)brightnessDelta alpha:(CGFloat)alphaDelta {
    CGFloat hue, saturation, brightness, alpha;
    if (![self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        return self;
    }
    
    hue += hueDelta;
    saturation += saturationDelta;
    brightness += brightnessDelta;
    alpha += alphaDelta;
    
    hue -= (int)hue; // 多减(hue:0.5, hueDelta:0.8 -> hue = 0.3) 色相以角度计算(1 -> 360°, +/- -> 顺/逆)
    hue = hue < 0 ? hue + 1 : hue; // 少补(hue:0.5, hueDelta:-0.8 -> hue = 0.7)
    saturation = saturation < 0 ? 0 : saturation > 1 ? 1 : saturation; // [0,1]
    brightness = brightness < 0 ? 0 : brightness > 1 ? 1 : brightness; // [0,1]
    alpha = alpha < 0 ? 0 : alpha > 1 ? 1 : alpha; // [0,1]
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

@end

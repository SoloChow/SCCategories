//
//  UIColor+SCCMYKColor.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  

#import "UIColor+SCCMYKColor.h"
#import "UIColor+SCColorConvert.h"

@implementation UIColor (SCCMYKColor)

#pragma mark - Info
- (CGFloat)sc_cyanOfCMYK {
    CGFloat cyan = 0, magenta, yellow, key, alpha;
    [self sc_getCyan:&cyan magenta:&magenta yellow:&yellow key:&key alpha:&alpha];
    return cyan;
}

- (CGFloat)sc_magentaOfCMYK
{
    CGFloat cyan, magenta = 0, yellow, key, alpha;
    [self sc_getCyan:&cyan magenta:&magenta yellow:&yellow key:&key alpha:&alpha];
    return magenta;
}

- (CGFloat)sc_yellowOfCMYK
{
    CGFloat cyan, magenta, yellow = 0, key, alpha;
    [self sc_getCyan:&cyan magenta:&magenta yellow:&yellow key:&key alpha:&alpha];
    return yellow;
}

- (CGFloat)sc_keyOfCMYK
{
    CGFloat cyan, magenta, yellow, key = 0, alpha;
    [self sc_getCyan:&cyan magenta:&magenta yellow:&yellow key:&key alpha:&alpha];
    return key;
}

- (BOOL)sc_getCyan:(CGFloat *)cyan magenta:(CGFloat *)magenta yellow:(CGFloat *)yellow alpha:(CGFloat *)alpha {
    CGFloat red, green, blue, aAlpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&aAlpha]) {
        return NO;
    }
    SCRGB2CMY(red, green, blue, cyan, magenta, yellow);
    *alpha = aAlpha;
    return YES;
}

- (BOOL)sc_getCyan:(CGFloat *)cyan magenta:(CGFloat *)magenta yellow:(CGFloat *)yellow key:(CGFloat *)key alpha:(CGFloat *)alpha {
    CGFloat red, green, blue, aAlpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&aAlpha]) {
        return NO;
    }
    SCRGB2CMYK(red, green, blue, cyan, magenta, yellow, key);
    *alpha = aAlpha;
    return YES;
}

#pragma mark - Create
+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow {
    return [UIColor sc_colorWithCyan:cyan magenta:magenta yellow:yellow alpha:1];
}

+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow alpha:(CGFloat)alpha {
    CGFloat red, green, blue;
    SCCMY2RGB(cyan, magenta, yellow, &red, &green, &blue);
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow key:(CGFloat)key {
    return [UIColor sc_colorWithCyan:cyan magenta:magenta yellow:yellow key:key alpha:1];
}

+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow key:(CGFloat)key alpha:(CGFloat)alpha {
    CGFloat red, green, blue;
    SCCMYK2RGB(cyan, magenta, yellow, key, &red, &green, &blue);
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - Modify
- (UIColor *)sc_colorByChangeCyanOfCMYK:(CGFloat)CyanDelta {
    return [self sc_colorByChangeCyan:CyanDelta magenta:0 yellow:0 key:0 alpha:0];
}

- (UIColor *)sc_colorByChangeMagentaOfCMYK:(CGFloat)magentaDelta {
    return [self sc_colorByChangeCyan:0 magenta:magentaDelta yellow:0 key:0 alpha:0];
}

- (UIColor *)sc_colorByChangeYellowOfCMYK:(CGFloat)yellowDelta {
    return [self sc_colorByChangeCyan:0 magenta:0 yellow:yellowDelta key:0 alpha:0];
}

- (UIColor *)sc_colorByChangeKeyOfCMYK:(CGFloat)keyDelta {
    return [self sc_colorByChangeCyan:0 magenta:0 yellow:0 key:keyDelta alpha:0];
}

- (UIColor *)sc_colorByChangeCyan:(CGFloat)cyanDelta magenta:(CGFloat)magentaDelta yellow:(CGFloat)yellowDelta alpha:(CGFloat)alphaDelta {
    CGFloat cyan, magenta, yellow, alpha;
    if (![self sc_getCyan:&cyan magenta:&magenta yellow:&yellow alpha:&alpha]) {
        return nil;
    }
    
    cyan += cyanDelta;
    magenta += magentaDelta;
    yellow += yellowDelta;
    alpha += alphaDelta;
    
    cyan = cyan < 0 ? 0 : cyan > 1 ? 1 : cyan; // [0,1]
    magenta = magenta < 0 ? 0 : magenta > 1 ? 1 : magenta; // [0,1]
    yellow = yellow < 0 ? 0 : yellow > 1 ? 1 : yellow; // [0,1]
    alpha = alpha < 0 ? 0 : alpha > 1 ? 1 : alpha; // [0,1]
    
    return [UIColor sc_colorWithCyan:cyan magenta:magenta yellow:yellow alpha:alpha];
}

- (UIColor *)sc_colorByChangeCyan:(CGFloat)cyanDelta magenta:(CGFloat)magentaDelta yellow:(CGFloat)yellowDelta key:(CGFloat)keyDelta alpha:(CGFloat)alphaDelta {
    CGFloat cyan, magenta, yellow, key, alpha;
    if (![self sc_getCyan:&cyan magenta:&magenta yellow:&yellow key:&key alpha:&alpha]) {
        return nil;
    }
    
    cyan += cyanDelta;
    magenta += magentaDelta;
    yellow += yellowDelta;
    key += keyDelta;
    alpha += alphaDelta;
    
    cyan = cyan < 0 ? 0 : cyan > 1 ? 1 : cyan; // [0,1]
    magenta = magenta < 0 ? 0 : magenta > 1 ? 1 : magenta; // [0,1]
    yellow = yellow < 0 ? 0 : yellow > 1 ? 1 : yellow; // [0,1]
    key = key < 0 ? 0 : key > 1 ? 1 : key; // [0,1]
    alpha = alpha < 0 ? 0 : alpha > 1 ? 1 : alpha; // [0,1]
    
    return [UIColor sc_colorWithCyan:cyan magenta:magenta yellow:yellow key:key alpha:alpha];
}

@end

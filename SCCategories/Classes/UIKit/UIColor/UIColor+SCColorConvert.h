//
//  UIColor+SCColorConvert.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  颜色转换处理

#import <UIKit/UIKit.h>

@interface UIColor (SCColorConvert)
/**
 RGB颜色转换为HSL颜色
 */
UIKIT_EXTERN void SCRGB2HSL(CGFloat red, CGFloat green, CGFloat blue,
               CGFloat *hue, CGFloat *saturation, CGFloat *lightness);

/**
 HSL颜色转换为RGB颜色
 */
UIKIT_EXTERN void SCHSL2RGB(CGFloat hue, CGFloat saturation, CGFloat lightness,
               CGFloat *red, CGFloat *green, CGFloat *blue);

/**
 RGB颜色转换为HSB颜色
 */
UIKIT_EXTERN void SCRGB2HSB(CGFloat red, CGFloat green, CGFloat blue,
               CGFloat *hue, CGFloat *saturation, CGFloat *value);

/**
 HSB颜色转换为RGB颜色
 */
UIKIT_EXTERN void SCHSB2RGB(CGFloat hue, CGFloat saturation, CGFloat value,
               CGFloat *red, CGFloat *green, CGFloat *blue);

/**
 RGB颜色转换为CMYK颜色
 */
UIKIT_EXTERN void SCRGB2CMYK(CGFloat red, CGFloat green, CGFloat blue,
                CGFloat *cyan, CGFloat *magenta, CGFloat *yellow, CGFloat *key);

/**
 CMYK颜色转换为RGB颜色
 */
UIKIT_EXTERN void SCCMYK2RGB(CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat key,
                CGFloat *red, CGFloat *green, CGFloat *blue);

/**
 RGB颜色转换为CMY颜色
 */
UIKIT_EXTERN void SCRGB2CMY(CGFloat red, CGFloat green, CGFloat blue,
               CGFloat *cyan, CGFloat *magenta, CGFloat *yellow);

/**
 CMY颜色转换为RGB颜色
 */
UIKIT_EXTERN void SCCMY2RGB(CGFloat cyan, CGFloat magenta, CGFloat yellow,
               CGFloat *red, CGFloat *green, CGFloat *blue);

/**
 CMY颜色转换为CMYK颜色
 */
UIKIT_EXTERN void SCCMY2CMYK(CGFloat cyan, CGFloat magenta, CGFloat yellow,
                CGFloat *cCyan, CGFloat *mMagenta, CGFloat *yYellow, CGFloat *kKey);

/**
 CMYK颜色转换为CMY颜色
 */
UIKIT_EXTERN void SCCMYK2CMY(CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat key,
                CGFloat *cCyan, CGFloat *mMagenta, CGFloat *yYellow);

/**
 HSB颜色转换为HSL颜色
 */
UIKIT_EXTERN void SCHSB2HSL(CGFloat hue, CGFloat saturation, CGFloat brightness,
                            CGFloat *hHue, CGFloat *sSaturation, CGFloat *lLightness);

/**
 HSL颜色转换为HSB颜色
 */
UIKIT_EXTERN void SCHSL2HSB(CGFloat hue, CGFloat saturation, CGFloat lightness,
               CGFloat *hHue, CGFloat *sSaturation, CGFloat *bBrightness);

@end

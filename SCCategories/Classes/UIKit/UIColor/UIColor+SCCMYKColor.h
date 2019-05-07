//
//  UIColor+SCCMYKColor.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  CMYK颜色

#import <UIKit/UIKit.h>

@interface UIColor (SCCMYKColor)

#pragma mark - Info
@property (nonatomic, readonly) CGFloat sc_cyanOfCMYK;                ///< 获取CMYK/CMY的Cyan值[0,1]
@property (nonatomic, readonly) CGFloat sc_magentaOfCMYK;             ///< 获取CMYK/CMY的Magenta值[0,1]
@property (nonatomic, readonly) CGFloat sc_yellowOfCMYK;              ///< 获取CMYK/CMY的Yellow值[0,1]
@property (nonatomic, readonly) CGFloat sc_keyOfCMYK;                 ///< 获取CMYK的Key(Black)值[0,1]

/**
 获取根据CMY颜色空间调配的各颜色部分
 
 @param cyan    CMYK的Cyan部分[0,1]
 @param magenta CMYK的Magenta部分[0,1]
 @param yellow  CMYK的Yellow部分[0,1]
 @param alpha   Alpha部分[0,1]
 @return 颜色成功转化返回YES, 否则返回NO
 */
- (BOOL)sc_getCyan:(CGFloat *)cyan
           magenta:(CGFloat *)magenta
            yellow:(CGFloat *)yellow
             alpha:(CGFloat *)alpha;

/**
 获取根据CMYK颜色空间调配的各颜色部分
 
 @param cyan    CMYK的Cyan部分[0,1]
 @param magenta CMYK的Magenta部分[0,1]
 @param yellow  CMYK的Yellow部分[0,1]
 @param key     CMYK的Key(Black)部分[0,1]
 @param alpha   Alpha部分[0,1]
 @return 颜色成功转化返回YES, 否则返回NO
 */
- (BOOL)sc_getCyan:(CGFloat *)cyan
           magenta:(CGFloat *)magenta
            yellow:(CGFloat *)yellow
               key:(CGFloat *)key
             alpha:(CGFloat *)alpha;

#pragma mark - Create
/**
 根据Cyan, Magenta, Yellow值, 获取颜色(基于设备RGB颜色空间调配)
 
 @param cyan    CMY的Cyan值[0,1]
 @param magenta CMY的Magenta值[0,1]
 @param yellow  CMY的Yellow值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow;

/**
 根据Cyan, Magenta, Yellow和Alpha值, 获取颜色(基于设备RGB颜色空间调配)
 
 @param cyan    CMY的Cyan值[0,1]
 @param magenta CMY的Magenta值[0,1]
 @param yellow  CMY的Yellow值[0,1]
 @param alpha   Alpha值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                        alpha:(CGFloat)alpha;

/**
 根据Cyan, Magenta, Yellow, Key(Black)值, 获取颜色(基于设备RGB颜色空间调配)
 
 @param cyan    CMYK的Cyan值[0,1]
 @param magenta CMYK的Magenta值[0,1]
 @param yellow  CMYK的Yellow值[0,1]
 @param key     CMYK的Key(Balck)值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                          key:(CGFloat)key;

/**
 根据Cyan, Magenta, Yellow, Key(Black)和Alpha值, 获取颜色(基于设备RGB颜色空间调配)
 
 @param cyan CMYK的Cyan值[0,1]
 @param magenta CMYK的Magenta值[0,1]
 @param yellow CMYK的Yellow值[0,1]
 @param key CMYK的Key(Balck)值[0,1]
 @param alpha Alpha值[0,1]
 @return 对应的颜色
 */
+ (UIColor *)sc_colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                          key:(CGFloat)key
                        alpha:(CGFloat)alpha;

#pragma mark - Modify
/**
 根据CMYK/CMY颜色Cyan值的变化, 获取修改后的颜色
 
 @param CyanDelta Cyan(CMYK/CMY)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeCyanOfCMYK:(CGFloat)CyanDelta;

/**
 根据CMYK/CMY颜色Magenta值的变化, 获取修改后的颜色
 
 @param magentaDelta Magenta(CMYK/CMY)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeMagentaOfCMYK:(CGFloat)magentaDelta;

/**
 根据CMYK/CMY颜色Yellow值的变化, 获取修改后的颜色
 
 @param yellowDelta Yellow(CMYK/CMY)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeYellowOfCMYK:(CGFloat)yellowDelta;

/**
 根据CMYK颜色Key(Black)值的变化, 获取修改后的颜色
 
 @param keyDelta keyDelta Key<Black>(CMYK)的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeKeyOfCMYK:(CGFloat)keyDelta;

/**
 根据CMYK/CMY颜色Cyan, Magenta, Yellow和Alpha值的变化, 获取修改后的颜色
 
 @param cyanDelta    Cyan(CMYK/CMY)的变化值[-1,1](0, 不变)
 @param magentaDelta Magenta(CMYK/CMY)的变化值[-1,1](0, 不变)
 @param yellowDelta  Yellow(CMYK/CMY)的变化值[-1,1](0, 不变)
 @param alphaDelta   Alpha的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeCyan:(CGFloat)cyanDelta
                          magenta:(CGFloat)magentaDelta
                           yellow:(CGFloat)yellowDelta
                            alpha:(CGFloat)alphaDelta;

/**
 根据CMYK颜色Cyan, Magenta, Yellow, Key(Black)和Alpha值的变化, 获取修改后的颜色
 
 @param cyanDelta    Cyan(CMYK)的变化值[-1,1](0, 不变)
 @param magentaDelta Magenta(CMYK)的变化值[-1,1](0, 不变)
 @param yellowDelta  Yellow(CMYK)的变化值[-1,1](0, 不变)
 @param keyDelta     Key<Black>(CMYK)的变化值[-1,1](0, 不变)
 @param alphaDelta   Alpha的变化值[-1,1](0, 不变)
 @return 修改后的颜色
 */
- (UIColor *)sc_colorByChangeCyan:(CGFloat)cyanDelta
                          magenta:(CGFloat)magentaDelta
                           yellow:(CGFloat)yellowDelta
                              key:(CGFloat)keyDelta
                            alpha:(CGFloat)alphaDelta;

@end

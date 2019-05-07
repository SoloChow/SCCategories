//
//  UIFont+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CTFont.h> 
#import <CoreGraphics/CGGeometry.h>

@interface UIFont (SCBase)

#pragma mark - Base
@property (nonatomic, readonly) CGFloat sc_fontWeight NS_AVAILABLE_IOS(7_0); ///< 字体宽度(-1.0~1.0, Regular字体宽度为0.0)

/**
 根据当前字体, 创建带粗体的字体

 @return 带粗体的字体
 */
- (UIFont *)sc_fontWithBold NS_AVAILABLE_IOS(7_0);

/**
 根据当前字体, 创建带斜体的字体

 @return 带斜体的字体
 */
- (UIFont *)sc_fontWithItalic NS_AVAILABLE_IOS(7_0);

/**
 根据当前字体, 创建带粗体和斜体的字体

 @return 带粗体和斜体的字体
 */
- (UIFont *)sc_fontWithBoldItalic NS_AVAILABLE_IOS(7_0);

/**
 根据当前字体, 创建普通字体(无粗体/斜体...)

 @return 普通字体(无粗体/斜体...)
 */
- (UIFont *)sc_fontWithNormal NS_AVAILABLE_IOS(7_0);

/**
 根据CTFont, 创建字体

 @param CTFont CTFont
 @return 字体
 */
+ (UIFont *)sc_fontWithCTFont:(CTFontRef)CTFont;

/**
 根据CGFont, 创建字体

 @param CGFont CGFont
 @param size 字体大小
 @return 字体
 */
+ (UIFont *)sc_fontWithCGFont:(CGFontRef)CGFont size:(CGFloat)size;

/**
 根据字体, 创建CTFontRef(需调用CFRelease()方法释放)

 @return CTFontRef
 */
- (CTFontRef)sc_CTFontRef CF_RETURNS_RETAINED;

/**
 根据字体, 创建CGFontRef(需调用CFRelease()方法释放)

 @return CGFontRef
 */
- (CGFontRef)sc_CGFontRef CF_RETURNS_RETAINED;

#pragma mark - Check
@property (nonatomic, readonly) BOOL sc_isBold NS_AVAILABLE_IOS(7_0);        ///< 字体是否粗体
@property (nonatomic, readonly) BOOL sc_isItalic NS_AVAILABLE_IOS(7_0);      ///< 字体是否斜体
@property (nonatomic, readonly) BOOL sc_isMonoSpace NS_AVAILABLE_IOS(7_0);   ///< 字体是否等宽
@property (nonatomic, readonly) BOOL sc_isColorGlyphs NS_AVAILABLE_IOS(7_0); ///< 字体是否颜色雕纹(类似Emoji)

#pragma mark - Load & Unload
/**
 根据字体文件路径, 加载字体(支持格式:TTF,OTF)

 @param path 字体文件路径
 @return 加载成功返回YES, 否则返回NO
 */
+ (BOOL)sc_loadFontFromPath:(NSString *)path;

/**
 根据字体文件路径, 卸载字体

 @param path 字体文件路径
 */
+ (void)sc_unloadFontFromPath:(NSString *)path;

/**
 根据字体data, 加载字体(支持格式:TTF,OTF)

 @param data 字体data
 @return  字体
 */
+ (UIFont *)sc_loadFontFromData:(NSData *)data;

/**
 根据字体(通过loadFontFromData:方法加载), 卸载字体

 @param font 字体(通过loadFontFromData:方法加载)
 @return 卸载成功返回YES, 否则返回NO
 */
+ (BOOL)sc_unloadFontFromData:(UIFont *)font;

#pragma mark - Font Data
/**
 解析并返回字体的data(TTF, error -> nil)

 @param font 字体
 @return 字体data
 */
+ (NSData *)sc_dataFromFont:(UIFont *)font;

/**
 解析并返回CGFont字体的data(TTF, error -> nil)

 @param cgFont CGFontRef
 @return CGFont字体data
 */
+ (NSData *)sc_dataFromCGFont:(CGFontRef)cgFont;

@end

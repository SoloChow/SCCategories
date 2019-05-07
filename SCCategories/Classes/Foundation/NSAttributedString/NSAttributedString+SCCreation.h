//
//  NSAttributedString+SCCreation.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  AttributedString便捷创建方法

#import <Foundation/Foundation.h>


@class UIFont;
@class UIColor;
@class NSParagraphStyle;

@interface NSAttributedString (SCCreation)

/**
 根据字符串及文字颜色, 创建NSAttributedString
 
 @param string    字符串
 @param textColor 文字颜色
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string textColor:(UIColor *)textColor;

/**
 根据字符串及背景颜色, 创建NSAttributedString
 
 @param string          字符串
 @param backgroundColor 背景颜色
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string backgroundColor:(UIColor *)backgroundColor;

/**
 根据字符串及Font, 创建NSAttributedString
 
 @param string 字符串
 @param font   字体
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string font:(UIFont *)font;

/**
 根据字符串及ParagraphStyle, 创建NSAttributedString
 
 @param string         字符串
 @param paragraphStyle ParagraphStyle
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string paragraphStyle:(NSParagraphStyle *)paragraphStyle;

/**
 根据字符串, 文字颜色, 背景颜色, Font及ParagraphStyle, 创建NSAttributedString
 
 @param string          字符串
 @param textColor       文字颜色
 @param backgroundColor 背景颜色
 @param font            字体
 @param paragraphStyle  ParagraphStyle
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string
                                            textColor:(UIColor *)textColor
                                      backgroundColor:(UIColor *)backgroundColor
                                                 font:(UIFont *)font
                                       paragraphStyle:(NSParagraphStyle *)paragraphStyle;

@end

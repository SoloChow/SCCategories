//
//  NSAttributedString+SCMask.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  AttributedString遮盖处理

#import <Foundation/Foundation.h>


@class UIColor;
@class UIFont;

@interface NSAttributedString (SCMask)

/**
 根据字符串, 文字颜色, Font及遮盖范围, 创建NSAttributedString并遮盖部分文字(遮盖颜色:透明)
 
 @param string    字符串
 @param color     文字颜色
 @param font      Font
 @param maskRange 遮盖范围
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string
                                            textColor:(UIColor *)color
                                                 font:(UIFont *)font
                                            maskRange:(NSRange)maskRange;

/**
 根据字符串, 字符属性集, 遮盖范围及遮盖属性集, 创建NSAttributedString并遮盖部分文字
 
 @param string    字符串
 @param attrs     字符属性集
 @param maskRange 遮盖范围
 @param maskAttrs 遮盖属性集
 @return NSAttributedString对象
 */
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string
                                           attributes:(NSDictionary<NSString *, id> *)attrs
                                            maskRange:(NSRange)maskRange
                                       maskAttributes:(NSDictionary<NSString *, id> *)maskAttrs;

@end

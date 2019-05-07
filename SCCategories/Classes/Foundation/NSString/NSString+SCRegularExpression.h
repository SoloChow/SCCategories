//
//  NSString+SCRegularExpression.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串正则处理

#import <Foundation/Foundation.h>

@interface NSString (SCRegularExpression)

/**
 字符串是否匹配正则表达式
 
 @param regex   正则表达式
 @param options 设置匹配方式
 @return 匹配返回YES, 否则返回NO
 */
- (BOOL)sc_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

/**
 遍历字符串是否匹配正则表达式
 
 @param regex   正则表达式
 @param options 设置匹配方式
 @param block   处理回调(每个字符元素是否匹配正则表达式, match:匹配的字符串, matchRange:匹配的字符串范围, *stop:是否停止遍历)
 */
- (void)sc_enumerateRegexMatches:(NSString *)regex
                         options:(NSRegularExpressionOptions)options
                      usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;

/**
 将字符串中满足正则表达式的字符替换为指定字符
 
 @param regex       正则表达式
 @param options     设置匹配方式
 @param replacement 替换字符
 @return 新字符串
 */
- (NSString *)sc_stringByReplacingRegex:(NSString *)regex
                                options:(NSRegularExpressionOptions)options
                             withString:(NSString *)replacement;

@end

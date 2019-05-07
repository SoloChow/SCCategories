//
//  NSString+SCURLString.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串URL处理

#import <Foundation/Foundation.h>

@interface NSString (SCURLString)

/**
 获取URL编码后(UTF-8)的string
 
 @return URL编码后(UTF-8)的string
 */
- (NSString *)sc_stringByURLEncode;

/**
 获取URL解码后(UTF-8)的string
 
 @return 解码后(UTF-8)的string
 */
- (NSString *)sc_stringByURLDecode;

/**
 获取一般HTML转义后的string ("a>b" -> "a&gt;b")
 
 @return HTML转义后的string
 */
- (NSString *)sc_stringByEscapingHTML;

@end

//
//  NSString+SCBase64String.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  Base64编码字符串

#import <Foundation/Foundation.h>

@interface NSString (SCBase64String)

/**
 获取string对应的Base64编码的字符串
 
 @return string对应的Base64编码的字符串
 */
- (NSString *)sc_base64EncodedString;

/**
 根据Base64字符串, 获取字符串解码后对应的string
 
 @param base64EncodedString Base64字符串
 @return 解码后对应的string
 */
+ (NSString *)sc_stringWithBase64EncodedString:(NSString *)base64EncodedString;

@end

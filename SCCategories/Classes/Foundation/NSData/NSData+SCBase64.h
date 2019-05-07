//
//  NSData+SCBase64.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  Base64编码和解码

#import <Foundation/Foundation.h>

@interface NSData (SCBase64)

/**
 获取data对应的Base64编码的data字符串
 
 @return data对应的Base64编码的data字符串
 */
- (NSString *)sc_base64EncodedString;

/**
 根据Base64字符串, 获取字符串解码后对应的data
 
 @param base64EncodedString Base64字符串
 @return 字符串解码后对应的data
 */
+ (NSData *)sc_dataWithBase64EncodedString:(NSString *)base64EncodedString;

@end

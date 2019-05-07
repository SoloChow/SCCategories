//
//  NSString+SCSecurityString.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串安全处理(111 -> ***)

#import <Foundation/Foundation.h>

@interface NSString (SCSecurityString)

/**
 将字符串的所有合成字符序列替换为*
 
 @return 新字符串
 */
- (NSString *)sc_securityString;

/**
 根据替换范围, 将替换范围内的字符串替换为*(混合字符串<@"1😀🇺🇸">或有问题)
 
 @param range 替换范围
 @return 新字符串
 */
- (NSString *)sc_stingByReplacingWithAsteriskInRange:(NSRange)range;

/**
 根据替换范围, 将替换范围内的字符串替换为指定字符(混合字符串<@"1😀🇺🇸">或有问题)
 
 @param replacement 指定替换字符
 @param range       替换范围
 @return 新字符串
 */
- (NSString *)sc_stingByReplacingWithSecurityString:(NSString *)replacement range:(NSRange)range;

@end

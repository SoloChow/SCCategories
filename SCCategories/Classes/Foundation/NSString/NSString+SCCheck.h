//
//  NSString+SCCheck.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串检测处理

#import <Foundation/Foundation.h>

@interface NSString (SCCheck)

/**
 字符串是否为十进制数字字符(0-9)

 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isDecimalNumber;

/**
 字符串是否为英文字符

 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isLetter;

/**
 字符串是否为小写英文字符

 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isLowercaseLetter;

/**
 字符串是否为大写英文字符

 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isUppercaseLetter;

/**
 字符串是否为邮箱
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isEmail;

/**
 字符串是否为手机号码
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isMobilePhone;

/**
 字符串是否为固话号码
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isTelNumber;

/**
 字符串是否为中华人民共和国居民身份证
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isValidCardIDOfPRC;

/**
 字符串是否为中华人民共和国香港特别行政区居民身份证
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isValidCardIDOfHK;

@end

//
//  NSString+SCTrimming.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串筛除处理

#import <Foundation/Foundation.h>

@interface NSString (SCTrimming)

/**
 去除字符串所有的十进制数字字符(0-9)
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingDecimalNumbers;

/**
 去除字符串所有的英文字符(大小写)
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingLetters;

/**
 去除字符串所有的大写英文字符
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingUppercaseLetters;

/**
 去除字符串所有的小写英文字符
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingLowercaseLetters;

/**
 去除字符串所有的英文(大小写)及十进制数字(0-9)字符
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingAlphanumericCharacters;

/**
 去除字符串所有的英文标点符号
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingPunctuation;

/**
 去除字符串所有的指定字符
 
 @param character 指定字符
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingCharacter:(unichar)character;

/**
 去除字符串所有的空格
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingAllWhitespace;

/**
 去除字符串的多余空格(首尾空格及中间空格，@" A  is     Ok. " -> @"A is Ok."), 仅用于以空格分隔的语言
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingExtraWhitespace;

/**
 去除字符串首尾的空格
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingWhitespace;

/**
 去除字符串首尾的空格和换行
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingWhitespaceAndNewline;

@end

//
//  NSString+SCBase.h
//  SCCategories
//
//  Created by Solo on 16/12/31.
//  Copyright © 2016年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SCBase)

#pragma mark - Base
/**
 获取字符串的全范围(NSMakeRange(0, string.length))
 
 @return 字符串的全范围
 */
- (NSRange)sc_rangeOfAll;

/**
 根据MainBundle内的文件名, 获取路径下文本包含的字符串(a.txt, 或为nil)
 
 @param name 文件名
 @return 文本包含的字符串(或为nil)
 */
+ (NSString *)sc_stringNamed:(NSString *)name;

#pragma mark - Composed Character Sequences
/**
 获取字符串的合成字符序列的长度(@"A一1️⃣".length -> 5, "A一1️⃣".lengthOfComposedCharacterSequences -> 3)
 */
@property (nonatomic, readonly) NSUInteger sc_lengthOfComposedCharacterSequences;

/**
 获取字符串的首个合成字符序列(或为nil)

 @return 合成字符序列
 */
- (NSString *)sc_firstComposedCharacterSequences;

/**
 获取字符串的最末的合成字符序列(或为nil)

 @return 合成字符序列
 */
- (NSString *)sc_lastComposedCharacterSequences;

/**
 根据索引, 获取索引指向位置的合成字符序列(或为nil, 索引范围在[0, string.length-1]内)

 @param index 索引
 @return 合成字符序列
 */
- (NSString *)sc_composedCharacterSequencesAtIndex:(NSUInteger)index;

/**
 获取字符串的合成字符序列数组

 @return 字符串的合成字符序列数组
 */
- (NSArray<NSString *> *)sc_composedCharacterSequences;

/**
 将字符串的合成字符序列(A/一/1️⃣)替换为指定字符串

 @param replacement 指定字符串
 @return 新字符串
 */
- (NSString *)sc_stringByReplacingComposedCharacterSequencesWithString:(NSString *)replacement;

#pragma mark - Check
/**
 字符串是否不为空(nil, @"", @"  ", @"\n")

 @return 不为空返回YES, 否则返回NO
 */
- (BOOL)sc_isNotBlank;

/**
 字符串数值是否为int类型

 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isPureInt;

/**
 字符串数值是否为float类型

 @return 是返回YES, 否则返回NOå
 */
- (BOOL)sc_isPureFloat;

/**
 是否包含指定字符串

 @param string 指定字符串
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsString:(NSString *)string;

/**
 是否包含指定Character字符集内字符

 @param set 指定Character字符集
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsCharacterSet:(NSCharacterSet *)set;

#pragma mark - Hex String
/**
 获取字符串的十六进制字符串

 @return 十六进制字符串
 */
- (NSString *)sc_hexString;

/**
 根据十六进制字符串, 获取新字符串

 @param hexString 十六进制字符串
 @return 新字符串
 */
+ (NSString *)sc_stringWithHexString:(NSString *)hexString;

#pragma mark - Data Value
/**
 根据字符串, 获取UTF-8编码的NSData对象(NSString -> NSData)
 
 @return NSData对象
 */
- (NSData *)sc_dataValue;

@end

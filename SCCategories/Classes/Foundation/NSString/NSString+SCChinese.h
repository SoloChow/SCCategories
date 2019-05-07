//
//  NSString+SCChinese.h
//  Pods
//
//  Created by Solo on 17/6/15.
//
//  字符串中文处理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, SCNSStringChineseType) {   // 中文字符类型
    SCNSStringChineseTypeCharacter              = 1 << 0, // 中文文字
    SCNSStringChineseTypePunctuation            = 1 << 1, // 中文标点
    SCNSStringChineseTypeRadical                = 1 << 2, // 中文部首
    SCNSStringChineseTypeStroke                 = 1 << 3, // 中文笔划
    SCNSStringChineseTypeIdeographicDescription = 1 << 4, // 中文构字描述符
    SCNSStringChineseTypeAll = SCNSStringChineseTypeCharacter | SCNSStringChineseTypePunctuation | SCNSStringChineseTypeRadical | SCNSStringChineseTypeStroke | SCNSStringChineseTypeIdeographicDescription
};

@interface NSString (SCChinese)

/**
 字符串是否为中文字符

 @param type 中文字符类型
 @return 仅当字符串是单个中文字符返回YES, 否则返回NO
 */
- (BOOL)sc_isChinese:(SCNSStringChineseType)type;

/**
 字符串是否包含中文字符

 @param type 中文字符类型
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsChinese:(SCNSStringChineseType)type;

/**
 获取指定范围内, 字符串中的所有中文字符

 @param range 指定范围
 @param type  中文字符类型
 @return 新字符串
 */
- (NSString *)sc_substringWithChinese:(SCNSStringChineseType)type inRange:(NSRange)range;

/**
 根据遍历范围, 遍历字符串中的所有中文字符
 
 @param range 遍历范围
 @param type  中文字符类型
 @param block 处理回调
 */
- (void)sc_enumerateChinese:(SCNSStringChineseType)type
                    inRange:(NSRange)range
                 usingBlock:(void (^)(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop))block;

/**
 将字符串中的所有中文字符替换为指定字符

 @param type        中文字符类型
 @param replacement 指定字符
 @return 新字符串
 */
- (NSString *)sc_stringByReplacingChinese:(SCNSStringChineseType)type withString:(NSString *)replacement;

/**
 去除字符串中所有的中文字符

 @param type 中文字符类型
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingChinese:(SCNSStringChineseType)type;

@end

NS_ASSUME_NONNULL_END

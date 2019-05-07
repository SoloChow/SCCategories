//
//  NSData+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSData (SCBase)

#pragma mark - Base
/**
 根据MainBundle内的文件名, 获取路径下data

 @param name 文件名
 @return data(无法找到返回nil)
 */
+ (NSData *)sc_dataNamed:(NSString *)name;

/**
 获取data对应的UTF-8解码字符串

 @return data对应的UTF-8解码字符串
 */
- (NSString *)sc_utf8String;

/**
 获取data对应的Hex字符串(大写)

 @return data对应的Hex字符串(大写)
 */
- (NSString *)sc_hexString;

/**
 根据Hex字符串, 创建data

 @param hexStr Hex字符串
 @return NSData对象
 */
+ (NSData *)sc_dataWithHexString:(NSString *)hexStr;

@end

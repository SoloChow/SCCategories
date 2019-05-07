//
//  NSString+SCUTF32String.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串UTF32处理

#import <Foundation/Foundation.h>

@interface NSString (SCUTF32String)

/**
 根据UTF32字符, 获取新字符串
 
 @param char32 UTF32字符
 @return 新字符串
 */
+ (NSString *)sc_stringWithUTF32Char:(UTF32Char)char32;

/**
 根据UTF32字符组, 获取新字符串
 
 @param char32 UTF32字符组,
 @param length 需获取的字符组长度
 @return 新字符串
 */
+ (NSString *)sc_stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length;

/**
 根据范围, 遍历UTF32字符
 
 @param range 遍历范围
 @param block 处理遍历回调(char32:字符, range:当前遍历范围, *stop:是否停止遍历)
 */
- (void)sc_enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block;

@end

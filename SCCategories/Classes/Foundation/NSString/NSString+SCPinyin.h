//
//  NSString+SCPinyin.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  拼音字符串

#import <Foundation/Foundation.h>

@interface NSString (SCPinyin)

/**
 获取字符串的拼音字符(罗马音)
 
 @return 新字符串
 */
- (NSString *)sc_pinyin;

@end

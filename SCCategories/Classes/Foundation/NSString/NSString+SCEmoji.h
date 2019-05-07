//
//  NSString+SCEmoji.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  字符串Emoji处理

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SCEmoji)

/**
 字符串是否Emoji
 
 @return 仅当字符串是单个Emoji返回YES, 否则返回NO
 */
- (BOOL)sc_isEmoji;

/**
 是否包含Emoji
 
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsEmoji;

/**
 去除字符串所有的Emoji
 
 @return 新字符串
 */
- (NSString *)sc_stringByTrimmingEmoji;

@end

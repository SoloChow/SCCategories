//
//  NSDictionary+SCPropertyList.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  Property List

#import <Foundation/Foundation.h>

@interface NSDictionary (SCPropertyList)

/**
 根据属性列表data(Property List), 创建字典
 
 @param plist root元素为Dictionary的属性列表data(Property List)
 @return 包含属性列表元素的字典
 */
+ (NSDictionary *)sc_dictionaryWithPlistData:(NSData *)plist;

/**
 根据属性列表XML字符(Property List), 创建可变字典
 
 @param plist root元素为Dictionary的属性列表XML字符(Property List)
 @return 包含属性列表元素的字典
 */
+ (NSDictionary *)sc_dictionaryWithPlistString:(NSString *)plist;

/**
 将字典序列化为属性列表data(Property List)
 
 @return 属性列表data
 */
- (NSData *)sc_plistData;

/**
 将字典序列化为属性列表XML字符(XML Property List)
 
 @return 属性列表XML字符
 */
- (NSString *)sc_plistString;

@end


@interface NSMutableDictionary (SCPropertyList)
/**
 根据属性列表data(Property List), 创建可变字典
 
 @param plist root元素为Dictionary的属性列表data(Property List)
 @return 包含属性列表元素的可变字典
 */
+ (NSMutableDictionary *)sc_dictionaryWithPlistData:(NSData *)plist;

/**
 根据属性列表XML字符(Property List), 创建可变字典
 
 @param plist root元素为Dictionary的属性列表XML字符(Property List)
 @return 包含属性列表元素的可变字典
 */
+ (NSMutableDictionary *)sc_dictionaryWithPlistString:(NSString *)plist;

@end

//
//  NSArray+SCPropertyList.h
//  Pods
//
//  Created by Solo on 17/2/9.
//
//  Property List

#import <Foundation/Foundation.h>

@interface NSArray (SCPropertyList)

/**
 根据属性列表data(Property List), 创建数组
 
 @param plist root元素为Array的属性列表data(Property List)
 @return 包含属性列表元素的数组
 */
+ (NSArray *)sc_arrayWithPlistData:(NSData *)plist;

/**
 根据属性列表XML字符(XML Property List), 创建数组
 
 @param plist root元素为Array的属性列表XML字符(XML Property List)
 @return 包含属性列表元素的数组
 */
+ (NSArray *)sc_arrayWithPlistString:(NSString *)plist;

/**
 将数组序列化为属性列表data(Property List)
 
 @return 属性列表data
 */
- (NSData *)sc_plistData;

/**
 将数组序列化为属性列表XML字符(XML Property List)
 
 @return 属性列表XML字符
 */
- (NSString *)sc_plistString;

@end


@interface NSMutableArray (SCPropertyList)

/**
 根据属性列表data(Property List), 创建可变数组
 
 @param plist root元素为Array的属性列表data(Property List)
 @return 包含属性列表元素的可变数组
 */
+ (NSMutableArray *)sc_arrayWithPlistData:(NSData *)plist;

/**
 根据属性列表XML字符(XML Property List), 创建可变数组
 
 @param plist root元素为Array的属性列表XML字符(XML Property List)
 @return  包含属性列表元素的可变数组
 */
+ (NSMutableArray *)sc_arrayWithPlistString:(NSString *)plist;

@end

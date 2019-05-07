//
//  NSArray+SCJSONArray.h
//  Pods
//
//  Created by Solo on 17/2/9.
//
//  JSON数组

#import <Foundation/Foundation.h>

@interface NSArray (SCJSONArray)

/**
 将数组元素编码为JSON可用string(NSString/NSNumber/NSDictionary/NSArray)
 
 @return Json string
 */
- (NSString *)sc_JSONStringEncoded;

/**
 将数组元素格式化编码为JSON可用string(带空格)
 
 @return Json string
 */
- (NSString *)sc_JSONPrettyStringEncoded;

@end

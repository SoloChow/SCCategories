//
//  NSJSONSerialization+SCBase.h
//  Pods
//
//  Created by Solo on 17/2/4.
//
//  Base

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (SCBase)

#pragma mark - Base
/**
 根据JSON字符串, 获取JSONObject(NSDictionary/NSArray, 无法获取返回nil)

 @param string JSON字符串
 @param error Error
 @return NSDictionary/NSArray, 无法获取返回nil
 */
+ (id)sc_JSONObjectWithString:(NSString *)string error:(NSError **)error;

@end

//
//  NSDictionary+SCJSONDictionary.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  JSON字典

#import <Foundation/Foundation.h>

@interface NSDictionary (SCJSONDictionary)

#pragma mark - JSON Dictionary
/**
 将字典编码为JSON可用string
 
 @return Json string
 */
- (NSString *)sc_JSONStringEncode;

/**
 将字典编码为JSON可用string(带空格)
 
 @return Json string
 */
- (NSString *)sc_JSONPrettyStringEncoded;

@end

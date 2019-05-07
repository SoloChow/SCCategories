//
//  NSData+SCJSONValue.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  JSON Data

#import <Foundation/Foundation.h>

@interface NSData (SCJSONValue)

/**
 获取JSON解析后, data对应的数据(NSDictionary, NSArray, NSData...)
 
 @return data对应的数据(NSDictionary, NSArray, NSData...)
 */
- (id)sc_JSONValueDecoded;

@end

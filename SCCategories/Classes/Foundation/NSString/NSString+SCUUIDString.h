//
//  NSString+SCUUIDString.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  UUID字符串

#import <Foundation/Foundation.h>

@interface NSString (SCUUIDString)

/**
 获取新的UUID字符串
 
 @return 新的UUID字符串
 */
+ (NSString *)sc_stringWithUUID;

@end

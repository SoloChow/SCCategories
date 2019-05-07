//
//  NSURLComponents+SCBase.h
//  Pods
//
//  Created by Solo on 17/8/8.
//
//

#import <Foundation/Foundation.h>

@interface NSURLComponents (SCBase)

#pragma mark - Base
/**
 为URLComponentst添加指定的URLQueryItem

 @param queryItem 指定的URLQueryItem
 */
- (void)sc_addQueryItem:(NSURLQueryItem *)queryItem NS_AVAILABLE(10_10, 8_0);

@end

//
//  NSURLComponents+SCBase.m
//  Pods
//
//  Created by Solo on 17/8/8.
//
//

#import "NSURLComponents+SCBase.h"

@implementation NSURLComponents (SCBase)

#pragma mark - Base
- (void)sc_addQueryItem:(NSURLQueryItem *)queryItem
{
    NSMutableArray *buffer = self.queryItems ? self.queryItems.mutableCopy : @[].mutableCopy;
    [buffer addObject:queryItem];
    self.queryItems = buffer.copy;
}

@end

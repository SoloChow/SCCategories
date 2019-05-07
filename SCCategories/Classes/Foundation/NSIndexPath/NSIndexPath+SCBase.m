//
//  NSIndexPath+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSIndexPath+SCBase.h"

@implementation NSIndexPath (SCBase)

#pragma mark - Base
- (BOOL)sc_isEqualToIndexPath:(NSIndexPath *)other {
    if (!other) return NO;
    if (![other isKindOfClass:[NSIndexPath class]]) return NO;
    if (self == other) return YES;
    
    return [self compare:other] == NSOrderedSame;
}

@end

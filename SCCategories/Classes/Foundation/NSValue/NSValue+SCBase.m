//
//  NSValue+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSValue+SCBase.h"
#import <CoreGraphics/CoreGraphics.h>

const NSRange SCNSRangeZero = {0, 0};

@implementation NSValue (SCBase)

#pragma mark - Base
+ (NSValue *)sc_valueWithCGColor:(CGColorRef)color {
    return [NSValue valueWithBytes:&color objCType:@encode(CGColorRef)];
}

- (CGColorRef)sc_CGColorValue {
    CGColorRef color;
    [self getValue:&color];
    return color;
}

@end

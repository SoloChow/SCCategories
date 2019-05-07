//
//  NSValue+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

/**
 获取location及length为0的NSRange。等同于NSMakeRange(0, 0)
 */
FOUNDATION_EXTERN const NSRange SCNSRangeZero;

/**
 range1是否包含于range2内

 @param range1 Range1
 @param range2 Range2
 @return 包含返回YES, 否则返回NO
 */
NS_INLINE BOOL SCNSRangeInRange(NSRange range1, NSRange range2) {
    return (NSLocationInRange(range1.location, range2) && range1.length <= (range2.length - range1.location)) ? YES : NO;
}

@interface NSValue (SCBase)

#pragma mark - Base
/**
 根据CGColorRef, 创建NSValue对象(通过sc_CGColorValue获取)

 @param color CGColorRef
 @return NSValue对象
 */
+ (NSValue *)sc_valueWithCGColor:(CGColorRef)color;

/**
 获取NSValue对象内的CGColorRef

 @return CGColorRef
 */
- (CGColorRef)sc_CGColorValue;

@end

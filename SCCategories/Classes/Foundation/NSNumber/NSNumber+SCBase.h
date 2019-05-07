//
//  NSNumber+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSNumber (SCBase)

#pragma mark - Base
/**
 获取NSNumber对象对应的字符串(@1 -> @"1");
 */
@property (nonatomic, readonly) NSString *sc_stringNumber;

/**
 根据数字字符串(@"12", @"12.345", @" -0xFF", @" .23e99 ")创建NSNumber对象(字符对象为nil/null返回nil)

 @param string 数字字符串
 @return NSNumber对象(字符对象为nil/null返回nil)
 */
+ (NSNumber *)sc_numberWithString:(NSString *)string;

- (CGFloat)sc_CGFloatValue;

@end

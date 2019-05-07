//
//  NSDecimalNumber+SCRoundNumber.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  十进制数字舍入处理

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (SCRoundNumber)

#pragma mark - Create
/**
 根据float数值和四舍五入位数, 创建decimalNumber
 
 @param value float数值
 @param scale 四舍五入位数(正数为小数位, 负数为整数位)
 @return NSDecimalNumber对象
 */
+ (NSDecimalNumber *)sc_decimalNumberWithFloat:(float)value roundingScale:(short)scale;

/**
 根据float数值、舍入位数和舍入模式, 创建decimalNumber
 
 @param value float数值
 @param scale 舍入位数(正数为小数位, 负数为整数位)
 @param mode  舍入模式
 @return NSDecimalNumber对象
 */
+ (NSDecimalNumber *)sc_decimalNumberWithFloat:(float)value
                                 roundingScale:(short)scale
                                  roundingMode:(NSRoundingMode)mode;

/**
 根据double数值和四舍五入位数, 创建decimalNumber
 
 @param value double数值
 @param scale 四舍五入位数(正数为小数位, 负数为整数位)
 @return NSDecimalNumber对象
 */
+ (NSDecimalNumber *)sc_decimalNumberWithDouble:(double)value roundingScale:(short)scale;

/**
 根据double数值、舍入位数和舍入模式, 创建decimalNumber
 
 @param value double数值
 @param scale 舍入位数(正数为小数位, 负数为整数位)
 @param mode  舍入模式
 @return NSDecimalNumber对象
 */
+ (NSDecimalNumber *)sc_decimalNumberWithDouble:(double)value
                                  roundingScale:(short)scale
                                   roundingMode:(NSRoundingMode)mode;

#pragma mark - Round
/**
 四舍五入到指定位数
 
 @param scale 指定位数(正数为小数位, 负数为整数位)
 @return NSDecimalNumber对象
 */
- (NSDecimalNumber *)sc_roundToScale:(short)scale;

/**
 舍入到指定位数
 
 @param scale        指定位数(正数为小数位, 负数为整数位)
 @param roundingMode 舍入模式
 @return NSDecimalNumber对象
 */
- (NSDecimalNumber *)sc_roundToScale:(short)scale mode:(NSRoundingMode)roundingMode;

@end

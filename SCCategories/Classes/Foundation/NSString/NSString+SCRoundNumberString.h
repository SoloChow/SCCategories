//
//  NSString+SCRoundNumberString.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  舍入十进制数字字符串

#import <Foundation/Foundation.h>

@interface NSString (SCRoundNumberString)

/**
 根据文件大小(单位字节), 获取文件大小显示字符串(GB/MB/KB/Byte, 默认最大保留一位小数)
 
 @param byte 文件大小
 @return 文件大小显示字符串
 */
+ (NSString *)sc_stringFromFileSize:(int64_t)byte;

#pragma mark - Number String
/**
 根据float数值和保留显示小数位数, 获取对应的字符串
 
 @param value          float数值
 @param fractionDigits 保留显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromFloat:(float)value fractionDigits:(NSUInteger)fractionDigits;

/**
 根据double数值和保留显示小数位数, 获取对应的字符串
 
 @param value          double数值
 @param fractionDigits 保留显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromDouble:(double)value fractionDigits:(NSUInteger)fractionDigits;

/**
 根据number和保留显示小数位数, 获取对应的字符串
 
 @param number         number
 @param fractionDigits 保留显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromNumber:(NSNumber *)number fractionDigits:(NSUInteger)fractionDigits;

/**
 根据float数值、舍入位数、舍入模式和保留显示小数位数, 获取对应的字符串
 
 @param value          float数值
 @param scale          舍入位数
 @param mode           舍入模式
 @param fractionDigits 保留显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromFloat:(float)value
                   roundingScale:(short)scale
                    roundingMode:(NSRoundingMode)mode
                  fractionDigits:(NSUInteger)fractionDigits;

/**
 根据float数值、舍入位数、舍入模式和是否补齐显示小数位数(不足补0, 补齐位数与四舍五入位数一致), 获取对应的字符串
 
 @param value    float数值
 @param scale    舍入位数
 @param mode     舍入模式
 @param isPadded 是否补齐显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromFloat:(float)value
                   roundingScale:(short)scale
                    roundingMode:(NSRoundingMode)mode
            fractionDigitsPadded:(BOOL)isPadded;

/**
 根据float数值、四舍五入位数和是否补齐显示小数位数(不足补0, 补齐位数与四舍五入位数一致), 获取对应的字符串
 
 @param value    float数值
 @param scale    四舍五入位数
 @param isPadded 是否补齐显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromFloat:(float)value
                   roundingScale:(short)scale
            fractionDigitsPadded:(BOOL)isPadded;

/**
 根据float数值和四舍五入位数, 获取对应的字符串
 
 @param value float数值
 @param scale 四舍五入位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromFloat:(float)value roundingScale:(short)scale;

/**
 根据double数值、舍入位数、舍入模式和保留显示小数位数, 获取对应的字符串
 
 @param value          double数值
 @param scale          舍入位数
 @param mode           舍入模式
 @param fractionDigits 保留显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromDouble:(double)value
                    roundingScale:(short)scale
                     roundingMode:(NSRoundingMode)mode
                   fractionDigits:(NSUInteger)fractionDigits;

/**
 根据double数值、舍入位数、舍入模式和是否补齐显示小数位数(不足补0, 补齐位数与四舍五入位数一致), 获取对应的字符串
 
 @param value    double数值
 @param scale    舍入位数
 @param mode     舍入模式
 @param isPadded 是否补齐显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromDouble:(double)value
                    roundingScale:(short)scale
                     roundingMode:(NSRoundingMode)mode
             fractionDigitsPadded:(BOOL)isPadded;

/**
 根据double数值、四舍五入位数和是否补齐显示小数位数(不足补0, 补齐位数与四舍五入位数一致), 获取对应的字符串
 
 @param value    double数值
 @param scale    四舍五入位数
 @param isPadded 是否补齐显示小数位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromDouble:(double)value
                    roundingScale:(short)scale
             fractionDigitsPadded:(BOOL)isPadded;

/**
 根据double数值和四舍五入位数, 获取对应的字符串
 
 @param value double数值
 @param scale 四舍五入位数
 @return 数值字符串
 */
+ (NSString *)sc_stringFromDouble:(double)value roundingScale:(short)scale;

@end

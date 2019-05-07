//
//  NSDate+SCDateFormat.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  日期格式

#import <Foundation/Foundation.h>

@interface NSDate (SCDateFormat)

/**
 根据日期格式字符串, 获取日期字符串
 
 @param format 日期格式字符串(@"yyyy-MM-dd HH:mm:ss"...)
 @return 日期字符串
 */
- (NSString *)sc_stringWithFormat:(NSString *)format;

/**
 根据日期格式字符串、目标时区和目标local, 获取日期字符串
 
 @param format 日期格式字符串(@"yyyy-MM-dd HH:mm:ss"...)
 @param timeZone 目标时区
 @param locale 目标local
 @return 日期字符串
 */
- (NSString *)sc_stringWithFormat:(NSString *)format
                         timeZone:(NSTimeZone *)timeZone
                           locale:(NSLocale *)locale;

/**
 根据ISO8601日期格式("2010-07-09T16:13:30+12:00"), 获取日期字符串
 
 @return 日期字符串
 */
- (NSString *)sc_stringWithISOFormat;

/**
 根据日期字符串和日期格式字符串, 获取日期
 
 @param dateString 日期字符串
 @param format     日期格式字符串(@"yyyy-MM-dd HH:mm:ss"...)
 @return 日期
 */
+ (NSDate *)sc_dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 根据日期字符串、日期格式字符串、目标时区和目标local, 获取日期
 
 @param dateString 日期字符串
 @param format     日期格式字符串(@"yyyy-MM-dd HH:mm:ss"...)
 @param timeZone   目标时区
 @param locale     目标local
 @return 日期
 */
+ (NSDate *)sc_dateWithString:(NSString *)dateString
                       format:(NSString *)format
                     timeZone:(NSTimeZone *)timeZone
                       locale:(NSLocale *)locale;

/**
 根据ISO8601日期格式的日期字符串(@"2010-07-09T16:13:30+08:00"), 获取日期
 
 @param dateString ISO8601日期格式的日期字符串(@"2010-07-09T16:13:30+08:00")
 @return 日期
 */
+ (NSDate *)sc_dateWithISOFormatString:(NSString *)dateString;

@end

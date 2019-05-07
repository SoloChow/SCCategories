//
//  NSDate+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSDate (SCBase)

#pragma mark- Base
@property (nonatomic, readonly) NSInteger sc_year;              ///< 年
@property (nonatomic, readonly) NSInteger sc_month;             ///< 月(1~12)
@property (nonatomic, readonly) NSInteger sc_day;               ///< 日(1~31)
@property (nonatomic, readonly) NSInteger sc_hour;              ///< 时(0~23)
@property (nonatomic, readonly) NSInteger sc_minute;            ///< 分(0~59)
@property (nonatomic, readonly) NSInteger sc_second;            ///< 秒(0~59)
@property (nonatomic, readonly) NSInteger sc_nanosecond;        ///< 毫微秒
@property (nonatomic, readonly) NSInteger sc_weekdayOrdinal;    ///< 日期是本月的第几个星期几
@property (nonatomic, readonly) NSInteger sc_weekOfMonth;       ///< 日期是本月的第几周(一般周日为星期首日)
@property (nonatomic, readonly) NSInteger sc_weekOfYear;        ///< 日期是本年的第几周(1~53)
@property (nonatomic, readonly) NSInteger sc_yearForWeekOfYear; ///< 日期的weekOfYear中所属的年(ISO Week)
@property (nonatomic, readonly) NSInteger sc_quarter;           ///< 季度

#pragma mark - Time Interval
@property (nonatomic, readonly) NSInteger sc_timeIntervalSince1970; ///< 获取时间戳(单位为毫秒)

#pragma mark - Comparison
@property (nonatomic, readonly) BOOL sc_isLeapYear;              ///< 日期是否为闰年
@property (nonatomic, readonly) BOOL sc_isLastYearLeapYear;      ///< 日期上一年是否为闰年
@property (nonatomic, readonly) BOOL sc_isNextYearLeapYear;      ///< 日期下一年是否为闰年

@property (nonatomic, readonly) BOOL sc_isLeapMonth;             ///< 日期是否为闰月
@property (nonatomic, readonly) BOOL sc_isLastMonthLeapMonth;    ///< 日期上个月否为闰月
@property (nonatomic, readonly) BOOL sc_isNextMonthLeapMonth;    ///< 日期下个月否为闰月

@property (nonatomic, readonly) BOOL sc_isThisYear;              ///< 日期是否今年
@property (nonatomic, readonly) BOOL sc_isLastYear;              ///< 日期是否去年
@property (nonatomic, readonly) BOOL sc_isNextYear;              ///< 日期是否明年

@property (nonatomic, readonly) BOOL sc_isThisMonth;             ///< 日期是否本月
@property (nonatomic, readonly) BOOL sc_isLastMonth;             ///< 日期是否上个月
@property (nonatomic, readonly) BOOL sc_isNextMonth;             ///< 日期是否下个月

@property (nonatomic, readonly) BOOL sc_isToday;                 ///< 日期是否今天(由日期使用locale决定)
@property (nonatomic, readonly) BOOL sc_isYesterday;             ///< 日期是否昨天(由日期使用locale决定)
@property (nonatomic, readonly) BOOL sc_isTomorrow;              ///< 日期是否明天(由日期使用locale决定)
@property (nonatomic, readonly) BOOL sc_isTheDayBeforeYesterday; ///< 日期是否前天(由日期使用locale决定)
@property (nonatomic, readonly) BOOL sc_isTheDayAfterTomorrow;   ///< 日期是否后天(由日期使用locale决定)

@property (nonatomic, readonly) BOOL sc_isThisHour;              ///< 日期是否当前小时内
@property (nonatomic, readonly) BOOL sc_isLastHour;              ///< 日期是否上个小时内
@property (nonatomic, readonly) BOOL sc_isNextHour;              ///< 日期是否下个小时内

@property (nonatomic, readonly) BOOL sc_isThisMinute;            ///< 日期是否当前分钟内
@property (nonatomic, readonly) BOOL sc_isLastMinute;            ///< 日期是否上个分钟内
@property (nonatomic, readonly) BOOL sc_isNextMinute;            ///< 日期是否下个分钟内

@property (nonatomic, readonly) BOOL sc_isThisSecond;            ///< 日期是否当前秒内
@property (nonatomic, readonly) BOOL sc_isLastSecond;            ///< 日期是否上个秒内
@property (nonatomic, readonly) BOOL sc_isNextSecond;            ///< 日期是否下个秒内

/**
 日期是否在指定日期前
 
 @param date 指定日期
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isEarlierThanDate:(NSDate *)date;

/**
 日期是否在指定日期后
 
 @param date 指定日期
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isLaterThanDate:(NSDate *)date;

/**
 日期是否在两个日期之间
 
 @param startDate 开始日期
 @param endDate 结束日期
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isDateBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

/**
 日期是否在当前日期前
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isInPast;

/**
 日期是否在当前日期后
 
 @return 是返回YES, 否则返回NO
 */
- (BOOL)sc_isInFuture;

#pragma mark - Equal
/**
 日期是否与指定日期相等, 忽略时间(时、分、秒等)

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToDateIgnoringTime:(NSDate *)other;

/**
 日期的季度是否与指定日期相等
 
 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isQuarterEqualToDate:(NSDate *)other;

/**
 日期的年是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isYearEqualToDate:(NSDate *)other;

/**
 日期的月是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isMonthEqualToDate:(NSDate *)other;

/**
 日期的星期是否与指定日期相等
 
 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isWeekdayEqualToDate:(NSDate *)other;

/**
 日期的日是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isDayEqualToDate:(NSDate *)other;

/**
 日期的时是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isHourEqualToDate:(NSDate *)other;

/**
 日期的分是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isMinuteEqualToDate:(NSDate *)other;

/**
 日期的秒是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isSecondEqualToDate:(NSDate *)other;

/**
 日期的毫微秒是否与指定日期相等

 @param other 指定日期
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isNanosecondEqualToDate:(NSDate *)other;

#pragma mark - Creation
/**
 根据当前日期, 创建昨天的日期

 @return 昨天的日期
 */
+ (NSDate *)sc_dateYesterday;

/**
 根据当前日期, 创建明天的日期

 @return 明天的日期
 */
+ (NSDate *)sc_dateTomorrow;

#pragma mark - Modify
/**
 获取日期增加指定季度数后的新日期

 @param quarters 指定季度数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingQuarter:(NSInteger)quarters;

/**
 获取日期增加指定年数后的新日期

 @param years 指定年数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingYears:(NSInteger)years;

/**
 获取日期增加指定月数后的新日期

 @param months 指定月数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingMonths:(NSInteger)months;

/**
 获取日期增加指定周数后的新日期

 @param weeks 指定周数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingWeeks:(NSInteger)weeks;

/**
 获取日期增加指定天数后的新日期

 @param days 指定天数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingDays:(NSInteger)days;

/**
 获取日期增加指定小时数后的新日期

 @param hours 指定小时数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingHours:(NSInteger)hours;

/**
 获取日期增加指定分钟数后的新日期

 @param minutes 指定分钟数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingMinutes:(NSInteger)minutes;

/**
 获取日期增加指定秒数后的新日期

 @param seconds 指定秒数
 @return 新日期
 */
- (NSDate *)sc_dateByAddingSeconds:(NSInteger)seconds;

@end

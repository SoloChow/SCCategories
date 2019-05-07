//
//  NSDate+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSDate+SCBase.h"

@implementation NSDate (SCBase)

#pragma mark - Base
- (NSInteger)sc_year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)sc_month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)sc_day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)sc_hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)sc_minute
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)sc_second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)sc_nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)sc_weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)sc_weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)sc_weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)sc_weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)sc_yearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)sc_quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

#pragma mark - Time Interval
- (NSInteger)sc_timeIntervalSince1970 {
    return self.timeIntervalSince1970 * 1000;
}

#pragma mark - Comparison
- (BOOL)sc_isLeapYear {
    NSUInteger year = self.sc_year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)sc_isLastYearLeapYear {
    NSDate *added = [self sc_dateByAddingYears:-1];
    return [added sc_isLeapYear];
}

- (BOOL)sc_isNextYearLeapYear {
    NSDate *added = [self sc_dateByAddingYears:1];
    return [added sc_isLeapYear];
}

- (BOOL)sc_isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)sc_isLastMonthLeapMonth {
    NSDate *added = [self sc_dateByAddingMonths:-1];
    return [added sc_isLeapMonth];
}

- (BOOL)sc_isNextMonthLeapMonth {
    NSDate *added = [self sc_dateByAddingMonths:1];
    return [added sc_isLeapMonth];
}

- (BOOL)sc_isThisYear {
    return [self sc_isYearEqualToDate:[NSDate date]];
}

- (BOOL)sc_isLastYear {
    NSDate *added = [self sc_dateByAddingYears:1];
    return [added sc_isThisYear];
}

- (BOOL)sc_isNextYear {
    NSDate *added = [self sc_dateByAddingYears:-1];
    return [added sc_isThisYear];
}

- (BOOL)sc_isThisMonth {
    if (!self.sc_isThisYear) return NO;
    
    return [self sc_isMonthEqualToDate:[NSDate date]]; 
}

- (BOOL)sc_isLastMonth {
    NSDate *added = [self sc_dateByAddingMonths:1];
    return [added sc_isThisMonth];
}

- (BOOL)sc_isNextMonth {
    NSDate *added = [self sc_dateByAddingMonths:-1];
    return [added sc_isThisMonth];
}

- (BOOL)sc_isToday
{
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO; // 日期与当前日期的时间差距
    return [self sc_isDayEqualToDate:[NSDate new]];
}

- (BOOL)sc_isYesterday {
    NSDate *added = [self sc_dateByAddingDays:1];
    return [added sc_isToday]; // 昨天 + 1 = 今天
}

- (BOOL)sc_isTomorrow {
    NSDate *added = [self sc_dateByAddingDays:-1];
    return [added sc_isToday]; // 明天 - 1 = 今天
}

- (BOOL)sc_isTheDayBeforeYesterday {
    NSDate *added = [self sc_dateByAddingDays:2];
    return [added sc_isToday]; // 前天 + 2 = 今天
}

- (BOOL)sc_isTheDayAfterTomorrow {
    NSDate *added = [self sc_dateByAddingDays:-2];
    return [added sc_isToday]; // 后天 - 2 = 今天
}

- (BOOL)sc_isThisHour {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60) return NO;
    
    return [self sc_isHourEqualToDate:[NSDate new]];
}

- (BOOL)sc_isLastHour {
    NSDate *added = [self sc_dateByAddingHours:1];
    return [added sc_isThisHour];
}

- (BOOL)sc_isNextHour {
    NSDate *added = [self sc_dateByAddingHours:-1];
    return [added sc_isThisHour];
}

- (BOOL)sc_isThisMinute {
    if (fabs(self.timeIntervalSinceNow) >= 60) return NO;
    
    return [self sc_isMinuteEqualToDate:[NSDate new]];
}

- (BOOL)sc_isLastMinute {
    NSDate *added = [self sc_dateByAddingMinutes:1];
    return [added sc_isThisMinute];
}

- (BOOL)sc_isNextMinute {
    NSDate *added = [self sc_dateByAddingMinutes:-1];
    return [added sc_isThisMinute];
}

- (BOOL)sc_isThisSecond {
    if (fabs(self.timeIntervalSinceNow) >= 1) return NO;
    
    return [self sc_isSecondEqualToDate:[NSDate new]];
}

- (BOOL)sc_isLastSecond {
    NSDate *added = [self sc_dateByAddingSeconds:1];
    return [added sc_isThisSecond];
}

- (BOOL)sc_isNextSecond {
    NSDate *added = [self sc_dateByAddingSeconds:-1];
    return [added sc_isThisSecond];
}

- (BOOL)sc_isEarlierThanDate:(NSDate *)date {
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)sc_isLaterThanDate:(NSDate *)date {
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)sc_isDateBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    if ([self sc_isEarlierThanDate:startDate]) return NO;
    if ([self sc_isLaterThanDate:endDate]) return NO;
    
    return YES;
}

- (BOOL)sc_isInPast {
    return [self sc_isEarlierThanDate:[NSDate date]];
}

- (BOOL)sc_isInFuture {
    return [self sc_isLaterThanDate:[NSDate date]];
}

#pragma mark - Equal
- (BOOL)sc_isEqualToDateIgnoringTime:(NSDate *)other {
    if (!other) return NO;
    if (![other isKindOfClass:[NSDate class]]) return NO;
    if (![self sc_isYearEqualToDate:other]) return NO;
    if (![self sc_isMonthEqualToDate:other]) return NO;
    if (![self sc_isDayEqualToDate:other]) return NO;

    return YES;
}

- (BOOL)sc_isQuarterEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_quarter == other.sc_quarter;
}

- (BOOL)sc_isYearEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_year == other.sc_year;
}

- (BOOL)sc_isMonthEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_month == other.sc_month;
}

- (BOOL)sc_isWeekdayEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_weekday == other.sc_weekday;
}

- (BOOL)sc_isDayEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_day == other.sc_day;
}

- (BOOL)sc_isHourEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_minute == other.sc_minute;
}

- (BOOL)sc_isMinuteEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_minute == other.sc_minute;
}

- (BOOL)sc_isSecondEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_second == other.sc_second;
}

- (BOOL)sc_isNanosecondEqualToDate:(NSDate *)other {
    if (!other) return NO;
    
    return self.sc_nanosecond == other.sc_nanosecond;
}

#pragma mark - Creation
+ (NSDate *)sc_dateYesterday {
    return [[NSDate date] sc_dateByAddingDays:-1];
}

+ (NSDate *)sc_dateTomorrow {
    return [[NSDate date] sc_dateByAddingDays:1];
}

#pragma mark - Modify
- (NSDate *)sc_dateByAddingQuarter:(NSInteger)quarters {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setQuarter:quarters];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)sc_dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)sc_dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)sc_dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)sc_dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days; // 86400 = 60 * 60 * 24, timeIntervalSinceReferenceDate -> 以2001/01/01 00:00:00 UTC为基准时间, 返回实例保存的时间与2001/01/01 00:00:00 UTC的时间间隔
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)sc_dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)sc_dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)sc_dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

@end

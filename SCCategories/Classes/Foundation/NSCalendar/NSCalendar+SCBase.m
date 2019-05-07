//
//  NSCalendar+SCBase.m
//  Pods
//
//  Created by Solo on 17/8/4.
//
//

#import "NSCalendar+SCBase.h"

@implementation NSCalendar (SCBase)

#pragma mark - Base

- (nullable NSDate *)sc_firstDayOfMonth:(NSDate *)month {
    if (!month) return nil;
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:month];
    components.day = 1;
    return [self dateFromComponents:components];
}

- (nullable NSDate *)sc_lastDayOfMonth:(NSDate *)month {
    if (!month) return nil;
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:month];
    components.month++;
    components.day = 0;
    return [self dateFromComponents:components];
}

- (NSInteger)sc_numberOfDaysInMonth:(NSDate *)month {
    if (!month) return 0;
    NSRange days = [self rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:month];
    return days.length;
}

@end

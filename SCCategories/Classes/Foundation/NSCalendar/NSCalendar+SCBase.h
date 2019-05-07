//
//  NSCalendar+SCBase.h
//  Pods
//
//  Created by Solo on 17/8/4.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (SCBase)

#pragma mak - Base
/**
 获取指定月份的首日期
 
 @param month 指定月份
 @return 首日期
 */
- (nullable NSDate *)sc_firstDayOfMonth:(NSDate *)month;

/**
 获取指定月份的尾日期
 
 @param month 指定月份
 @return 尾日期
 */
- (nullable NSDate *)sc_lastDayOfMonth:(NSDate *)month;

/**
 获取指定月份的天数
 
 @param month 月份
 @return 天数
 */
- (NSInteger)sc_numberOfDaysInMonth:(NSDate *)month;

@end

NS_ASSUME_NONNULL_END

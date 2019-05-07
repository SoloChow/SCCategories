//
//  NSArray+SCSort.h
//  Pods
//
//  Created by Solo on 17/2/9.
//
//  排序

#import <Foundation/Foundation.h>

@interface NSArray (SCSort)

/**
 指定元素个数，获取随机排序的新数组(保持元素单一性, 指定个数大于数组个数则为nil)
 
 @param count 指定个数
 @return 元素随机排序的新数组
 */
- (NSArray *)sc_sortedArrayAtRandomInCount:(NSUInteger)count;

/**
 获取随机排序的新数组
 
 @return 元素随机排序的新数组
 */
- (NSArray *)sc_sortedArrayAtRandom;

/**
 获取反转排序后的新数组
 
 @return 元素反转排序后的新数组
 */
- (NSArray *)sc_sortedArrayByReversed;

/**
 获取升序排序的新数组(基本元素数组<int, NSString*, NSIndexPath...>, 元素保持一致性)
 
 @return 元素升序排序的新数组
 */
- (NSArray *)sc_sortedArrayInAscending;

/**
 获取降序排序的新数组(基本元素数组<int, NSString*, NSIndexPath...>, 元素保持一致性)
 
 @return 元素降序排序的新数组
 */
- (NSArray *)sc_sortedArrayInDescending;

/**
 根据Keys数组, 获取升序排序的新数组(排序优先级与Keys一致, Keys指向的Values须为基本元素<int, NSString, NSIndexPath...>, 元素保持一致性)
 
 @param keys Keys数组, 指向的Values须为基本元素<int, NSString, NSIndexPath...>
 @return 元素升序排序的新数组
 */
- (NSArray *)sc_sortedArrayInAscendingWithKeys:(NSArray<NSString *> *)keys;

/**
 根据Keys数组, 获取降序排序的新数组(排序优先级与Keys一致, Keys指向的Values须为基本元素<int, NSString, NSIndexPath...>, 元素保持一致性)
 
 @param keys Keys数组, 指向的Values须为基本元素<int, NSString, NSIndexPath...>
 @return 元素降序排序的新数组
 */
- (NSArray *)sc_sortedArrayInDescendingWithKeys:(NSArray<NSString *> *)keys;

@end


@interface NSMutableArray (SCSort)

/**
 反转数组内元素(@[ @1, @2, @3 ] -> @[ @3, @2, @1 ])
 */
- (void)sc_reverse;

/**
 随机排列数组内元素(@[ @1, @2, @3 ] -> @[ @2, @3, @1 ])
 */
- (void)sc_shuffle;

/**
 数组元素升序排序(基本元素数组<int, NSString, NSIndexPath...>, 元素保持一致性)
 */
- (void)sc_sortInAscending;

/**
 数组元素降序排序(基本元素数组<int, NSString, NSIndexPath...>, 元素保持一致性)
 */
- (void)sc_sortInDescending;

/**
 根据Keys数组, 数组元素升序排序(排序优先级与Keys一致, Keys指向的Values须为基本元素<int, NSString, NSIndexPath...>, 元素保持一致性)
 
 @param keys Keys数组, 指向的Values须为基本元素<int, NSString, NSIndexPath...>
 */
- (void)sc_sortInAscendingWithKeys:(NSArray<NSString *> *)keys;

/**
 根据Keys数组, 数组元素降序排序(排序优先级与Keys一致, Keys指向的Values须为基本元素<int, NSString, NSIndexPath...>, 元素保持一致性)
 
 @param keys Keys数组, 指向的Values须为基本元素<int, NSString, NSIndexPath...>
 */
- (void)sc_sortInDescendingWithKeys:(NSArray<NSString *> *)keys;

@end

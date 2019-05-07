//
//  NSArray+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSArray (SCBase)

#pragma mark - Base
/**
 通过索引, 获取数组内的一个元素(索引越界, 返回nil)

 @param index 索引
 @return 数组内一个元素(索引越界, 返回nil)
 */
- (id)sc_objectOrNilAtIndex:(NSUInteger)index;

/**
 随机获取数组内的一个元素(数组为空则为nil)

 @return 数组内一个元素(数组为空则为nil)
 */
- (id)sc_randomObject;

/**
 随机获取数组内的指定个数的元素(元素或为重复, 指定个数大于数组个数则为nil)

 @param count 指定个数
 @return 包含随机元素的新数组(指定个数大于数组个数则为nil)
 */
- (NSArray *)sc_randomObjectsInCount:(NSUInteger)count;

/**
 判断数组内是否包含等于指定字符的字符元素

 @param string 指定字符
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsString:(NSString *)string;

@end


@interface NSMutableArray (SCBase)

/**
 移除数组内首元素, 数组为空不执行
 */
- (void)sc_removeFirstObject;

/**
 移除数组内末元素, 数组为空不执行
 */
- (void)sc_removeLastObject;

/**
 返回数组内首元素, 同时将其移除出数组(数组为空返回nil)
 
 @return 数组内首元素(数组为空返回nil)
 */
- (id)sc_popFirstObject;

/**
 返回数组内末元素, 同时将其移除出数组(数组为空返回nil)
 
 @return 数组内末元素(数组为空返回nil)
 */
- (id)sc_popLastObject;

/**
 将单个元素拼接插入到数组末尾(元素不能为nil)
 
 @param anObject 单个元素
 */
- (void)sc_appendObject:(id)anObject;

/**
 将单个元素拼接插入到数组首部(元素不能为nil)
 
 @param anObject 单个元素
 */
- (void)sc_prependObject:(id)anObject;

/**
 将一组元素拼接插入到数组末尾(元素组为空不执行)
 
 @param objects 一组元素
 */
- (void)sc_appendObjects:(NSArray *)objects;

/**
 将一组元素拼接插入到数组首部(元素组为空不执行)
 
 @param objects 一组元素
 */
- (void)sc_prependObjects:(NSArray *)objects;

/**
 将一组元素插入当前数组索引指定的位置(元素组为空不执行)
 
 @param objects 一组元素
 @param index 当前数组指定的插入索引位置(索引大于当前数组元素个数, 抛出越界异常)
 */
- (void)sc_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;

@end

//
//  NSKeyedArchiver+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSKeyedArchiver (SCBase)

#pragma mark - Base
/**
 根据data解档对象(类同unarchiveObjectWithData:方法, 区别于可传入异常对象)

 @param data      解档data
 @param exception return前调用, 若exception存在且指针非NULL, 存在异常
 @return 解档对象
 */
+ (id)sc_unarchiveObjectWithData:(NSData *)data exception:(__autoreleasing NSException **)exception;

/**
 根据归档对象文件路径, 解档对象(类同unarchiveObjectWithFile:方法, 区别于可传入异常对象)

 @param path 归档对象文件路径
 @param exception return前调用, 若exception存在且指针非NULL, 存在异常
 @return 解档对象
 */
+ (id)sc_unarchiveObjectWithFile:(NSString *)path exception:(__autoreleasing NSException **)exception;

@end

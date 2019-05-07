//
//  NSObject+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SCBase)

#pragma mark - Base
/**
 获取类名

 @return 类名字符串
 */
+ (NSString *)sc_className;

/**
 获取类名

 @return 类名字符串
 */
- (NSString *)sc_className;

/**
 ARC下，获取对象的引用计数(参考, 或与实际有偏差)

 @return 对象的引用计数
 */
- (NSUInteger)sc_retainCountInARC;

/**
 延迟指点时间, 在当前线程执行指点方法

 @param sel   方法SEL
 @param delay 延迟时间
 */
- (void)sc_performSelector:(SEL)sel afterDelay:(NSTimeInterval)delay;

#pragma mark - Check
/**
 判断两个类别是否相同(不考虑父类别)

 @param aClass 另一个类别
 @return 相同返回YES, 否则返回NO
 */
+ (BOOL)sc_isEqualToClass:(Class)aClass;

/**
 判断两个对象当前类别是否相同(不考虑父类别)

 @param object 另一个对象
 @return 相同返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToClass:(id)object;

#pragma mark - Deep Copy
/**
 通过NSKeyedArchiver和NSKeyedUnarchiver, 深复制对象(error -> nil)

 @return 深复制后的对象
 */
- (id)sc_deepCopy;

/**
 通过NSKeyedArchiver(子类)和NSKeyedUnarchiver(子类), 深复制对象(error -> nil)

 @param archiver   指定的NSKeyedArchiver类或子类
 @param unarchiver 指定的NSKeyedUnarchiver类或子类
 @return 深复制后的对象
 */
- (id)sc_deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver;

@end

//
//  NSObject+SCSwizzleMethod.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  方法替换

#import <Foundation/Foundation.h>

@interface NSObject (SCSwizzleMethod)

/**
 替换实例方法(对象方法)
 
 @param originalSel 原方法SEL
 @param newSel      新方法SEL
 @return 替换成功返回YES, 否则返回NO
 */
+ (BOOL)sc_swizzleInstanceMethod:(SEL)originalSel withNewMethod:(SEL)newSel;

/**
 替换静态方法(类方法)
 
 @param originalSel 原方法SEL
 @param newSel      新方法SEL
 @return 替换成功返回YES, 否则返回NO
 */
+ (BOOL)sc_swizzleClassMethod:(SEL)originalSel withNewMethod:(SEL)newSel;

@end

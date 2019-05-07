//
//  NSObject+SCAssociatedValue.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (SCAssociatedValue)

#pragma mark - Associate Value
/**
 根据Key和Value, 关联对象(retain, strong, nonatomic)
 
 @param value Value
 @param key   Key
 */
- (void)sc_setAssociatedValue:(id)value withKey:(const void *)key;

/**
 根据Key和Value, 关联对象(weak)
 
 @param value Value
 @param key   Key
 */
- (void)sc_setAssociatedWeakValue:(id)value withKey:(const void *)key;

/**
 根据Key和Value, 关联对象(copy, nonatomic)
 
 @param value Value
 @param key   Key
 */
- (void)sc_setAssociatedCopyValue:(id)value withKey:(const void *)key;

/**
 根据Key, 获取关联对象的Value
 
 @param key Key
 @return Key对应关联对象的Value
 */
- (id)sc_getAssociatedValueForKey:(const void *)key;

/**
 移除所有关联对象
 */
- (void)sc_removeAssociatedValues;

@end

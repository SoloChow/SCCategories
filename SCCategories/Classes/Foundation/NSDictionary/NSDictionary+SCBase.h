//
//  NSDictionary+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSDictionary (SCBase)

#pragma mark - Base
/**
 返回包含字典所有Keys的排序数组(升序排序)

 @return 包含字典所有Keys的排序数组(升序排序)
 */
- (NSArray *)sc_allKeysSorted;

/**
 返回包含字典所有Values的排序数组(根据字典Key升序排序)

 @return 包含字典所有Values的排序数组(根据字典Key升序排序)
 */
- (NSArray *)sc_allValuesSortedByKeys;

/**
 根据指定Keys, 返回包含Keys及与之对应的实体的新字典

 @param keys 指定Keys
 @return 含Keys及与之对应的实体的新字典
 */
- (NSDictionary *)sc_entriesForKeys:(NSArray *)keys;

#pragma mark - Check
/**
 判断字典是否含有Key键

 @param key key
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsKey:(id)key;

/**
 判断字典是否含有Key键对应的值(nil返回NO)

 @param key key
 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_containsObjectForKey:(id)key;

#pragma mark - Store
/**
 获取key对应的bool值(若无返回默认值)

 @param key          key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (BOOL)sc_boolValueForKey:(NSString *)key default:(BOOL)defaultValue;

/**
 获取key对应的char值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (char)sc_charValueForKey:(NSString *)key default:(char)defaultValue;

/**
 获取key对应的unsignedChar值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (unsigned char)sc_unsignedCharValueForKey:(NSString *)key default:(unsigned char)defaultValue;

/**
 获取key对应的short值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (short)sc_shortValueForKey:(NSString *)key default:(short)defaultValue;

/**
 获取key对应的unsignedShort值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (unsigned short)sc_unsignedShortValueForKey:(NSString *)key default:(unsigned short)defaultValue;

/**
 获取key对应的int值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (int)sc_intValueForKey:(NSString *)key default:(int)defaultValue;

/**
 获取key对应的unsignedInt值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (unsigned int)sc_unsignedIntValueForKey:(NSString *)key default:(unsigned int)defaultValue;

/**
 获取key对应的long值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (long)sc_longValueForKey:(NSString *)key default:(long)defaultValue;

/**
 获取key对应的unsignedLong值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (unsigned long)sc_unsignedLongValueForKey:(NSString *)key default:(unsigned long)defaultValue;

/**
 获取key对应的longLongValue值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (long long)sc_longLongValueForKey:(NSString *)key default:(long long)defaultValue;

/**
 获取key对应的unsignedLongLong值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (unsigned long long)sc_unsignedLongLongValueForKey:(NSString *)key default:(unsigned long long)defaultValue ;

/**
 获取key对应的float值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (float)sc_floatValueForKey:(NSString *)key default:(float)defaultValue;

/**
 获取key对应的double值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (double)sc_doubleValueForKey:(NSString *)key default:(double)defaultValue;

/**
 获取key对应的integer值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (NSInteger)sc_integerValueForKey:(NSString *)key default:(NSInteger)defaultValue;

/**
 获取key对应的unsignedInteger值(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (NSUInteger)sc_unsignedIntegerValueForKey:(NSString *)key default:(NSUInteger)defaultValue;

/**
 获取key对应的NSNumber对象(若无返回默认值)

 @param key key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (NSNumber *)sc_numberValueForKey:(NSString *)key default:(NSNumber *)defaultValue;

/**
 获取key对应的string(若无返回默认值)

 @param key          key
 @param defaultValue 默认值
 @return key对应的值(若无返回默认值)
 */
- (NSString *)sc_stringValueForKey:(NSString *)key default:(NSString *)defaultValue;

@end


@interface NSMutableDictionary (SCBase)

/**
 返回字典内key对应的value, 同时将其移除出字典(value为空返回nil)
 
 @param aKey Key
 @return key对应的value(value为空返回nil)
 */
- (id)sc_popObjectForKey:(id)aKey;

/**
 返回字典内一组keys对应的value, 同时将其移除出字典(keys为空返回空字典)
 
 @param keys keys 一组keys
 @return 包含指定keys对应的values的新字典(keys为空返回空字典)
 */
- (NSDictionary *)sc_popEntriesForKeys:(NSArray *)keys;

@end

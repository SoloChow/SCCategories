//
//  NSDictionary+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSDictionary+SCBase.h"

@implementation NSDictionary (SCBase)

#pragma mark - Base
- (NSArray *)sc_allKeysSorted {
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)]; // caseInsensitiveCompare:比较两个字符串大小, 忽略大小写
}

- (NSArray *)sc_allValuesSortedByKeys {
    NSArray *sortedKeys = [self sc_allKeysSorted];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (id key in sortedKeys) {
        [array addObject:self[key]];
    }
    return [array copy];
}

- (NSDictionary *)sc_entriesForKeys:(NSArray *)keys {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    for (id key in keys) {
        id value = self[key];
        if (value) dictionary[key] = value;
    }
    return [dictionary copy];
}

#pragma mark - Check
- (BOOL)sc_containsKey:(id)key {
    if (!key) return NO;
    return [[self allKeys] containsObject:key];
}

- (BOOL)sc_containsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}

#pragma mark - Store
NSNumber *SCNumberFromID(id value) {
    static NSCharacterSet *dot;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dot = [NSCharacterSet characterSetWithRange:NSMakeRange('.', 1)]; // dot字集
    });
    if (!value || value == [NSNull null]) return nil;
    if ([value isKindOfClass:[NSNumber class]]) return value;
    if ([value isKindOfClass:[NSString class]]) {
        NSString *lower = ((NSString *)value).lowercaseString;
        if ([lower isEqualToString:@"true"] || [lower isEqualToString:@"yes"]) return @(YES);
        if ([lower isEqualToString:@"false"] || [lower isEqualToString:@"no"]) return @(NO);
        if ([lower isEqualToString:@"nil"] || [lower isEqualToString:@"null"]) return nil;
        if ([(NSString *)value rangeOfCharacterFromSet:dot].location != NSNotFound) {
            return @(((NSString *)value).doubleValue);
        } else {
            return @(((NSString *)value).longLongValue); // No dot
        }
    }
    return nil;
}

// ARC下, 不允许基本数据类型(bool, int...)转为id类型
#define SCRETURN_VALUE(_type_)                                                   \
if (!key) return defaultValue;                                                   \
id value = self[key];                                                            \
if (!value || value == [NSNull null]) return defaultValue;                       \
if ([value isKindOfClass:[NSNumber class]]) return ((NSNumber *)value)._type_;   \
if ([value isKindOfClass:[NSString class]]) return SCNumberFromID(value)._type_; \
return defaultValue;

- (BOOL)sc_boolValueForKey:(NSString *)key default:(BOOL)defaultValue {
    SCRETURN_VALUE(boolValue);
}

- (char)sc_charValueForKey:(NSString *)key default:(char)defaultValue {
    SCRETURN_VALUE(charValue);
}

- (unsigned char)sc_unsignedCharValueForKey:(NSString *)key default:(unsigned char)defaultValue {
    SCRETURN_VALUE(unsignedCharValue);
}

- (short)sc_shortValueForKey:(NSString *)key default:(short)defaultValue {
    SCRETURN_VALUE(shortValue);
}

- (unsigned short)sc_unsignedShortValueForKey:(NSString *)key default:(unsigned short)defaultValue {
    SCRETURN_VALUE(unsignedShortValue);
}

- (int)sc_intValueForKey:(NSString *)key default:(int)defaultValue {
    SCRETURN_VALUE(intValue);
}

- (unsigned int)sc_unsignedIntValueForKey:(NSString *)key default:(unsigned int)defaultValue {
    SCRETURN_VALUE(unsignedIntValue);
}

- (long)sc_longValueForKey:(NSString *)key default:(long)defaultValue {
    SCRETURN_VALUE(longValue);
}

- (unsigned long)sc_unsignedLongValueForKey:(NSString *)key default:(unsigned long)defaultValue {
    SCRETURN_VALUE(unsignedLongValue);
}

- (long long)sc_longLongValueForKey:(NSString *)key default:(long long)defaultValue {
    SCRETURN_VALUE(longLongValue);
}

- (unsigned long long)sc_unsignedLongLongValueForKey:(NSString *)key default:(unsigned long long)defaultValue {
    SCRETURN_VALUE(unsignedLongLongValue);
}

- (float)sc_floatValueForKey:(NSString *)key default:(float)defaultValue {
    SCRETURN_VALUE(floatValue);
}

- (double)sc_doubleValueForKey:(NSString *)key default:(double)defaultValue {
    SCRETURN_VALUE(doubleValue);
}

- (NSInteger)sc_integerValueForKey:(NSString *)key default:(NSInteger)defaultValue {
    SCRETURN_VALUE(integerValue);
}

- (NSUInteger)sc_unsignedIntegerValueForKey:(NSString *)key default:(NSUInteger)defaultValue {
    SCRETURN_VALUE(unsignedIntegerValue);
}

- (NSNumber *)sc_numberValueForKey:(NSString *)key default:(NSNumber *)defaultValue {
    if (!key) return defaultValue;
    id value = self[key];
    if (!value || value == [NSNull null]) return defaultValue;
    if ([value isKindOfClass:[NSNumber class]]) return value;
    if ([value isKindOfClass:[NSString class]]) return SCNumberFromID(value);
    return defaultValue;
}

- (NSString *)sc_stringValueForKey:(NSString *)key default:(NSString *)defaultValue {
    if (!key) return defaultValue;
    id value = self[key];
    if (!value || value == [NSNull null]) return defaultValue;
    if ([value isKindOfClass:[NSString class]]) return value;
    if ([value isKindOfClass:[NSNumber class]]) return ((NSNumber *)value).description;
    return defaultValue;
}

@end


@implementation NSMutableDictionary (SCBase)

- (id)sc_popObjectForKey:(id)aKey {
    if (!aKey) return nil;
    id value = self[aKey];
    [self removeObjectForKey:aKey];
    return value;
}

- (NSDictionary *)sc_popEntriesForKeys:(NSArray *)keys {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    for (id key in keys) {
        id value = self[key];
        if (value) {
            [self removeObjectForKey:key];
            dictionary[key] = value;
        }
    }
    return [dictionary copy];
}

@end

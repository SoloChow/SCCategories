//
//  NSObject+SCKeyValueCoding.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSObject+SCKeyValueCoding.h"

@implementation NSObject (SCKeyValueCoding)

- (void)sc_setBoolValue:(BOOL)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithBool:value] forKey:key];  // @() may be undefine value
}

- (BOOL)sc_boolValueForKey:(NSString *)key {
    return [[self valueForKey:key] boolValue];
}

- (void)sc_setBoolValue:(BOOL)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithBool:value] forKeyPath:keyPath];
}

- (BOOL)sc_boolValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] boolValue];
}

- (void)sc_setCharValue:(char)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithChar:value] forKey:key];
}

- (char)sc_charValueForKey:(NSString *)key {
    return [[self valueForKey:key] charValue];
}

- (void)sc_setCharValue:(char)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithChar:value] forKeyPath:keyPath];
}

- (char)sc_charValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] charValue];
}

- (void)sc_setUnsignedCharValue:(unsigned char)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithUnsignedChar:value] forKey:key];
}

- (unsigned char)sc_unsignedCharValueForKey:(NSString *)key {
    return [[self valueForKey:key] unsignedCharValue];
}

- (void)sc_setUnsignedCharValue:(unsigned char)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithUnsignedChar:value] forKeyPath:keyPath];
}

- (unsigned char)sc_unsignedCharValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] unsignedCharValue];
}

- (void)sc_setShortValue:(short)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithShort:value] forKey:key];
}

- (short)sc_shortValueForKey:(NSString *)key {
    return [[self valueForKey:key] shortValue];
}

- (void)sc_setShortValue:(short)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithShort:value] forKeyPath:keyPath];
}

- (short)sc_shortValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] shortValue];
}

- (void)sc_setUnsignedShortValue:(unsigned short)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithUnsignedShort:value] forKey:key];
}

- (unsigned short)sc_unsignedShortValueForKey:(NSString *)key {
    return [[self valueForKey:key] unsignedShortValue];
}

- (void)sc_setUnsignedShortValue:(unsigned short)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithUnsignedShort:value] forKeyPath:keyPath];
}

- (unsigned short)sc_unsignedShortValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] unsignedShortValue];
}

- (void)sc_setIntValue:(int)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithInt:value] forKey:key];
}

- (int)sc_intValueForKey:(NSString *)key {
    return [[self valueForKey:key] intValue];
}

- (void)sc_setIntValue:(int)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithInt:value] forKeyPath:keyPath];
}

- (int)sc_intValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] intValue];
}

- (void)sc_setUnsignedIntValue:(unsigned int)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithUnsignedInt:value] forKey:key];
}

- (unsigned int)sc_unsignedIntValueForKey:(NSString *)key {
    return [[self valueForKey:key] unsignedIntValue];
}

- (void)sc_setUnsignedIntValue:(unsigned int)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithUnsignedInt:value] forKeyPath:keyPath];
}

- (unsigned int)sc_unsignedIntValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] unsignedIntValue];
}

- (void)sc_setLongValue:(long)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithLong:value] forKey:key];
}

- (long)sc_longValueForKey:(NSString *)key {
    return [[self valueForKey:key] longValue];
}

- (void)sc_setLongValue:(long)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithLong:value] forKeyPath:keyPath];
}

- (long)sc_longValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] longValue];
}

- (void)sc_setUnsignedLongValue:(unsigned long)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithUnsignedLong:value] forKey:key];
}

- (unsigned long)sc_unsignedLongValueForKey:(NSString *)key {
    return [[self valueForKey:key] unsignedLongValue];
}

- (void)sc_setUnsignedLongValue:(unsigned long)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithUnsignedLong:value] forKeyPath:keyPath];
}

- (unsigned long)sc_unsignedLongValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] unsignedLongValue];
}

- (void)sc_setLongLongValue:(long long)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithLongLong:value] forKey:key];
}

- (long long)sc_longLongValueForKey:(NSString *)key {
    return [[self valueForKey:key] longLongValue];
}

- (void)sc_setLongLongValue:(long long)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithLongLong:value] forKeyPath:keyPath];
}

- (long long)sc_longLongValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] longLongValue];
}

- (void)sc_setUnsignedLongLongValue:(unsigned long long)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithUnsignedLongLong:value] forKey:key];
}

- (unsigned long long)sc_unsignedLongLongValueForKey:(NSString *)key {
    return [[self valueForKey:key] unsignedLongLongValue];
}

- (void)sc_setUnsignedLongLongValue:(unsigned long long)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithUnsignedLongLong:value] forKeyPath:keyPath];
}

- (unsigned long long)sc_unsignedLongLongValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] unsignedLongLongValue];
}

- (void)sc_setFloatValue:(float)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithFloat:value] forKey:key];
}

- (float)sc_floatValueForKey:(NSString *)key {
    return [[self valueForKey:key] floatValue];
}

- (void)sc_setFloatValue:(float)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithFloat:value] forKeyPath:keyPath];
}

- (float)sc_floatValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] floatValue];
}

- (void)sc_setDoubleValue:(double)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithDouble:value] forKey:key];
}

- (double)sc_doubleValueForKey:(NSString *)key {
    return [[self valueForKey:key] doubleValue];
}

- (void)sc_setDoubleValue:(double)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithDouble:value] forKeyPath:keyPath];
}

- (double)sc_doubleValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] doubleValue];
}

- (void)sc_setIntegerValue:(NSInteger)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithInteger:value] forKey:key];
}

- (NSInteger)sc_integerValueForKey:(NSString *)key {
    return [[self valueForKey:key] integerValue];
}

- (void)sc_setIntegerValue:(NSInteger)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithInteger:value] forKeyPath:keyPath];
}

- (NSInteger)sc_integerValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] integerValue];
}

- (void)sc_setUnsignedIntegerValue:(NSUInteger)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithUnsignedInteger:value] forKey:key];
}

- (NSUInteger)sc_unsignedIntegerValueForKey:(NSString *)key {
    return [[self valueForKey:key] unsignedIntegerValue];
}

- (void)sc_setUnsignedIntegerValue:(NSUInteger)value forKeyPath:(NSString *)keyPath {
    [self setValue:[NSNumber numberWithUnsignedInteger:value] forKeyPath:keyPath];
}

- (NSUInteger)sc_unsignedIntegerValueForKeyPath:(NSString *)keyPath {
    return [[self valueForKeyPath:keyPath] unsignedIntegerValue];
}

@end

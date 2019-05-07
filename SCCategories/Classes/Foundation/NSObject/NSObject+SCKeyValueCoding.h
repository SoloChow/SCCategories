//
//  NSObject+SCKeyValueCoding.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  KVC

#import <Foundation/Foundation.h>

@interface NSObject (SCKeyValueCoding)

- (void)sc_setBoolValue:(BOOL)value forKey:(NSString *)key;
- (BOOL)sc_boolValueForKey:(NSString *)key;
- (void)sc_setBoolValue:(BOOL)value forKeyPath:(NSString *)keyPath;
- (BOOL)sc_boolValueForKeyPath:(NSString *)keyPath;

- (void)sc_setCharValue:(char)value forKey:(NSString *)key;
- (char)sc_charValueForKey:(NSString *)key;
- (void)sc_setCharValue:(char)value forKeyPath:(NSString *)keyPath;
- (char)sc_charValueForKeyPath:(NSString *)keyPath;

- (void)sc_setUnsignedCharValue:(unsigned char)value forKey:(NSString *)key;
- (unsigned char)sc_unsignedCharValueForKey:(NSString *)key;
- (void)sc_setUnsignedCharValue:(unsigned char)value forKeyPath:(NSString *)keyPath;
- (unsigned char)sc_unsignedCharValueForKeyPath:(NSString *)keyPath;

- (void)sc_setShortValue:(short)value forKey:(NSString *)key;
- (short)sc_shortValueForKey:(NSString *)key;
- (void)sc_setShortValue:(short)value forKeyPath:(NSString *)keyPath;
- (short)sc_shortValueForKeyPath:(NSString *)keyPath;

- (void)sc_setUnsignedShortValue:(unsigned short)value forKey:(NSString *)key;
- (unsigned short)sc_unsignedShortValueForKey:(NSString *)key;
- (void)sc_setUnsignedShortValue:(unsigned short)value forKeyPath:(NSString *)keyPath;
- (unsigned short)sc_unsignedShortValueForKeyPath:(NSString *)keyPath;

- (void)sc_setIntValue:(int)value forKey:(NSString *)key;
- (int)sc_intValueForKey:(NSString *)key;
- (void)sc_setIntValue:(int)value forKeyPath:(NSString *)keyPath;
- (int)sc_intValueForKeyPath:(NSString *)keyPath;

- (void)sc_setUnsignedIntValue:(unsigned int)value forKey:(NSString *)key;
- (unsigned int)sc_unsignedIntValueForKey:(NSString *)key;
- (void)sc_setUnsignedIntValue:(unsigned int)value forKeyPath:(NSString *)keyPath;
- (unsigned int)sc_unsignedIntValueForKeyPath:(NSString *)keyPath;

- (void)sc_setLongValue:(long)value forKey:(NSString *)key;
- (long)sc_longValueForKey:(NSString *)key;
- (void)sc_setLongValue:(long)value forKeyPath:(NSString *)keyPath;
- (long)sc_longValueForKeyPath:(NSString *)keyPath;

- (void)sc_setUnsignedLongValue:(unsigned long)value forKey:(NSString *)key;
- (unsigned long)sc_unsignedLongValueForKey:(NSString *)key;
- (void)sc_setUnsignedLongValue:(unsigned long)value forKeyPath:(NSString *)keyPath;
- (unsigned long)sc_unsignedLongValueForKeyPath:(NSString *)keyPath;

- (void)sc_setLongLongValue:(long long)value forKey:(NSString *)key;
- (long long)sc_longLongValueForKey:(NSString *)key;
- (void)sc_setLongLongValue:(long long)value forKeyPath:(NSString *)keyPath;
- (long long)sc_longLongValueForKeyPath:(NSString *)keyPath;

- (void)sc_setUnsignedLongLongValue:(unsigned long long)value forKey:(NSString *)key;
- (unsigned long long)sc_unsignedLongLongValueForKey:(NSString *)key;
- (void)sc_setUnsignedLongLongValue:(unsigned long long)value forKeyPath:(NSString *)keyPath;
- (unsigned long long)sc_unsignedLongLongValueForKeyPath:(NSString *)keyPath;

- (void)sc_setFloatValue:(float)value forKey:(NSString *)key;
- (float)sc_floatValueForKey:(NSString *)key;
- (void)sc_setFloatValue:(float)value forKeyPath:(NSString *)keyPath;
- (float)sc_floatValueForKeyPath:(NSString *)keyPath;

- (void)sc_setDoubleValue:(double)value forKey:(NSString *)key;
- (double)sc_doubleValueForKey:(NSString *)key;
- (void)sc_setDoubleValue:(double)value forKeyPath:(NSString *)keyPath;
- (double)sc_doubleValueForKeyPath:(NSString *)keyPath;

- (void)sc_setIntegerValue:(NSInteger)value forKey:(NSString *)key;
- (NSInteger)sc_integerValueForKey:(NSString *)key;
- (void)sc_setIntegerValue:(NSInteger)value forKeyPath:(NSString *)keyPath;
- (NSInteger)sc_integerValueForKeyPath:(NSString *)keyPath;

- (void)sc_setUnsignedIntegerValue:(NSUInteger)value forKey:(NSString *)key;
- (NSUInteger)sc_unsignedIntegerValueForKey:(NSString *)key;
- (void)sc_setUnsignedIntegerValue:(NSUInteger)value forKeyPath:(NSString *)keyPath;
- (NSUInteger)sc_unsignedIntegerValueForKeyPath:(NSString *)keyPath;

@end

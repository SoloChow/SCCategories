//
//  NSString+SCNumberValue.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import <Foundation/Foundation.h>

@interface NSString (SCNumberValue)

/**
 根据字符串, 获取NSNumber数值(@"1" -> @1, 或为nil)
 
 @return 字符串对应的NSNumber对象(或为nil)
 */
- (NSNumber *)sc_numberValue;

@property (readonly) char sc_charValue;                           ///< 字符串对应的NSNumber对象的char值
@property (readonly) unsigned char sc_unsignedCharValue;          ///< 字符串对应的NSNumber对象的unsignedChar值
@property (readonly) short sc_shortValue;                         ///< 字符串对应的NSNumber对象的short值
@property (readonly) unsigned short sc_unsignedShortValue;        ///< 字符串对应的NSNumber对象的unsignedShort值
@property (readonly) int sc_intValue;                             ///< 字符串对应的NSNumber对象的int值
@property (readonly) unsigned int sc_unsignedIntValue;            ///< 字符串对应的NSNumber对象的unsignedInt值
@property (readonly) long sc_longValue;                           ///< 字符串对应的NSNumber对象的long值
@property (readonly) unsigned long sc_unsignedLongValue;          ///< 字符串对应的NSNumber对象的unsignedLong值
@property (readonly) long long sc_longLongValue;                  ///< 字符串对应的NSNumber对象的longLong值
@property (readonly) unsigned long long sc_unsignedLongLongValue; ///< 字符串对应的NSNumber对象的unsignedLongLong值
@property (readonly) float sc_floatValue;                         ///< 字符串对应的NSNumber对象的float值
@property (readonly) double sc_doubleValue;                       ///< 字符串对应的NSNumber对象的double值
@property (readonly) BOOL sc_boolValue;                           ///< 字符串对应的NSNumber对象的bool值
@property (readonly) NSInteger sc_integerValue;                   ///< 字符串对应的NSNumber对象的integer值
@property (readonly) NSUInteger sc_unsignedIntegerValue;          ///< 字符串对应的NSNumber对象的unsignedInteger值

@end

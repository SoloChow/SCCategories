//
//  NSDecimalNumber+SCRoundNumber.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSDecimalNumber+SCRoundNumber.h"

@implementation NSDecimalNumber (SCRoundNumber)

#pragma mark - Create
+ (NSDecimalNumber *)sc_decimalNumberWithFloat:(float)value roundingScale:(short)scale {
    return [[[NSDecimalNumber alloc] initWithFloat:value] sc_roundToScale:scale];
}

+ (NSDecimalNumber *)sc_decimalNumberWithFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode {
    return [[[NSDecimalNumber alloc] initWithFloat:value] sc_roundToScale:scale mode:mode];
}

+ (NSDecimalNumber *)sc_decimalNumberWithDouble:(double)value roundingScale:(short)scale {
    return [[[NSDecimalNumber alloc] initWithDouble:value] sc_roundToScale:scale];
}

+ (NSDecimalNumber *)sc_decimalNumberWithDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode {
    return [[[NSDecimalNumber alloc] initWithDouble:value] sc_roundToScale:scale mode:mode];
}

#pragma mark - Round
- (NSDecimalNumber *)sc_roundToScale:(short)scale {
    return [self sc_roundToScale:scale mode:NSRoundPlain];
}

- (NSDecimalNumber *)sc_roundToScale:(short)scale mode:(NSRoundingMode)roundingMode {
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    return [self decimalNumberByRoundingAccordingToBehavior:handler];
}

@end

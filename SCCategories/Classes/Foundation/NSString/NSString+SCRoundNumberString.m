//
//  NSString+SCRoundNumberString.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCRoundNumberString.h"
#import "NSDecimalNumber+SCRoundNumber.h"

@implementation NSString (SCRoundNumberString)

+ (NSString *)sc_stringFromFileSize:(int64_t)byte {
    if (byte < 0) return nil;
    // Byte
    if (byte < pow(10, 3)) return [NSString stringWithFormat:@"%lldByte", byte];
    
    NSDecimalNumber *number = nil;
    // KB
    if (byte < pow(10, 6)) {
        number = [NSDecimalNumber sc_decimalNumberWithDouble:byte/pow(10, 3) roundingScale:1];
        return [NSString stringWithFormat:@"%@KB", number];
    }
    // MB
    if (byte < pow(10, 9)) {
        number = [NSDecimalNumber sc_decimalNumberWithDouble:byte/pow(10, 6) roundingScale:1];
        return [NSString stringWithFormat:@"%@MB", number];
    }
    // GB
    number = [NSDecimalNumber sc_decimalNumberWithDouble:byte/pow(10, 9) roundingScale:1];
    return [NSString stringWithFormat:@"%@GB", number];
}

+ (NSString *)sc_stringFromFloat:(float)value fractionDigits:(NSUInteger)fractionDigits {
    NSNumber *number = [[NSNumber alloc] initWithFloat:value];
    return [NSString sc_stringFromNumber:number fractionDigits:fractionDigits];
}

+ (NSString *)sc_stringFromDouble:(double)value fractionDigits:(NSUInteger)fractionDigits {
    NSNumber *number = [[NSNumber alloc] initWithDouble:value];
    return [NSString sc_stringFromNumber:number fractionDigits:fractionDigits];
}

+ (NSString *)sc_stringFromNumber:(NSNumber *)number fractionDigits:(NSUInteger)fractionDigits {
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    [numberFormatter setMinimumIntegerDigits:1];
    [numberFormatter setMaximumFractionDigits:fractionDigits];
    [numberFormatter setMinimumFractionDigits:fractionDigits];
    return [numberFormatter stringFromNumber:number];
}

+ (NSString *)sc_stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigits:(NSUInteger)fractionDigits {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber sc_decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    return [NSString sc_stringFromNumber:decimalNumber fractionDigits:fractionDigits];
}

+ (NSString *)sc_stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber sc_decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    if (!isPadded) return [NSString stringWithFormat:@"%@", decimalNumber];
    
    return [NSString sc_stringFromNumber:decimalNumber fractionDigits:scale];
}

+ (NSString *)sc_stringFromFloat:(float)value roundingScale:(short)scale fractionDigitsPadded:(BOOL)isPadded {
    return [NSString sc_stringFromFloat:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:isPadded];
}

+ (NSString *)sc_stringFromFloat:(float)value roundingScale:(short)scale {
    return [NSString sc_stringFromFloat:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:NO];
}

+ (NSString *)sc_stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigits:(NSUInteger)fractionDigits {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber sc_decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    return [NSString sc_stringFromNumber:decimalNumber fractionDigits:fractionDigits];
}

+ (NSString *)sc_stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber sc_decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    if (!isPadded) return [NSString stringWithFormat:@"%@", decimalNumber];
    
    return [NSString sc_stringFromNumber:decimalNumber fractionDigits:scale];
}

+ (NSString *)sc_stringFromDouble:(double)value roundingScale:(short)scale fractionDigitsPadded:(BOOL)isPadded {
    return [NSString sc_stringFromDouble:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:isPadded];
}

+ (NSString *)sc_stringFromDouble:(double)value roundingScale:(short)scale {
    return [NSString sc_stringFromDouble:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:NO];
}

@end

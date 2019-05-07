//
//  NSString+SCBase.m
//  SCCategories
//
//  Created by Solo on 16/12/31.
//  Copyright © 2016年 SC. All rights reserved.
//

#import "NSString+SCBase.h"
#import "NSData+SCBase.h"

@implementation NSString (SCBase)

#pragma mark - Base
- (NSRange)sc_rangeOfAll {
    return NSMakeRange(0, self.length);
}

+ (NSString *)sc_stringNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

#pragma mark - Composed Character Sequences
- (NSUInteger)sc_lengthOfComposedCharacterSequences {
    if (!self.length) return 0;
    
    __block NSUInteger length = 0;
    [self enumerateSubstringsInRange:self.sc_rangeOfAll options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (substring) {
            length++;
        }
    }];
    return length;
}

- (NSString *)sc_firstComposedCharacterSequences {
    return [self sc_composedCharacterSequencesAtIndex:0];
}

- (NSString *)sc_lastComposedCharacterSequences {
    return [self sc_composedCharacterSequencesAtIndex:self.length-1];
}

- (NSString *)sc_composedCharacterSequencesAtIndex:(NSUInteger)index {
    if (!self.length) return nil;
    
    return [self substringWithRange:[self rangeOfComposedCharacterSequenceAtIndex:index]];
}

- (NSArray<NSString *> *)sc_composedCharacterSequences {
    __block NSMutableArray *sequences = [NSMutableArray array];
    if (!self.length) return sequences;
    
    [self enumerateSubstringsInRange:self.sc_rangeOfAll options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (substring) {
            [sequences addObject:[substring copy]];
        }
    }];
    return sequences.copy;
}

- (NSString *)sc_stringByReplacingComposedCharacterSequencesWithString:(NSString *)replacement {
    __block NSString *tempString = [NSString stringWithString:self];
    [self enumerateSubstringsInRange:self.sc_rangeOfAll options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (![substring isEqualToString:replacement]) {
            tempString = [tempString stringByReplacingOccurrencesOfString:substring withString:replacement];
        }
    }];
    return tempString;
}

- (BOOL)sc_isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)sc_isPureInt {
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)sc_isPureFloat {
    NSScanner *scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)sc_containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)sc_containsCharacterSet:(NSCharacterSet *)set {
    if (set == nil) return NO;
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}

#pragma mark - Hex String
- (NSString *)sc_hexString {
    NSData *data = self.sc_dataValue;
    return data.sc_hexString;
}

+ (NSString *)sc_stringWithHexString:(NSString *)hexString {
    NSData *data = [NSData sc_dataWithHexString:hexString];
    return data.sc_utf8String;
}

#pragma mark - Data Value
- (NSData *)sc_dataValue {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end

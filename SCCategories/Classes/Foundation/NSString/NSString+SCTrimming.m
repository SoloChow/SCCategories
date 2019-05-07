//
//  NSString+SCTrimming.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCTrimming.h"
#import "NSString+SCRegularExpression.h"

@implementation NSString (SCTrimming)

- (NSString *)sc_stringByTrimmingDecimalNumbers {
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"[0-9]";
    });
    return [self sc_stringByReplacingRegex:regex options:0 withString:@""];
}

- (NSString *)sc_stringByTrimmingLetters {
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"[a-zA-Z]";
    });
    return [self sc_stringByReplacingRegex:regex options:0 withString:@""];
}

- (NSString *)sc_stringByTrimmingUppercaseLetters {
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"[A-Z]";
    });
    return [self sc_stringByReplacingRegex:regex options:0 withString:@""];
}

- (NSString *)sc_stringByTrimmingLowercaseLetters {
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"[a-z]";
    });
    return [self sc_stringByReplacingRegex:regex options:0 withString:@""];
}

- (NSString *)sc_stringByTrimmingAlphanumericCharacters {
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"[0-9a-zA-Z]";
    });
    return [self sc_stringByReplacingRegex:regex options:0 withString:@""];
}

- (NSString *)sc_stringByTrimmingPunctuation {
    /*
     https://zh.wikipedia.org/wiki/Unicode%E5%AD%97%E7%AC%A6%E5%88%97%E8%A1%A8
     !"#$%&'()*+,-./
     :;<=>?@
     [\]^_`
     {|}~
     */
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"[\\U00000021-\\U0000002F\\U0000003A-\\U00000040\\U0000005B-\\U00000060\\U0000007B-\\U0000007E]";
    });
    return [self sc_stringByReplacingRegex:regex options:0 withString:@""];
}

- (NSString *)sc_stringByTrimmingCharacter:(unichar)character {
    NSString *string = [NSString stringWithFormat:@"%c", character];
    return [self stringByReplacingOccurrencesOfString:string withString:@""];
}

- (NSString *)sc_stringByTrimmingAllWhitespace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)sc_stringByTrimmingExtraWhitespace {
    if (!self.length) return self;
    
    NSString *string = [self sc_stringByTrimmingWhitespace];
    
    NSArray *components = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
    return [components componentsJoinedByString:@" "];
}

- (NSString *)sc_stringByTrimmingWhitespace {
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (NSString *)sc_stringByTrimmingWhitespaceAndNewline {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

@end

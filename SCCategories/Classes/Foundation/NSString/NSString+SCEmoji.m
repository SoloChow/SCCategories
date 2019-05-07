//
//  NSString+SCEmoji.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCEmoji.h"
#import "NSString+SCBase.h"
#import "NSString+SCRegularExpression.h"

@implementation NSString (SCEmoji)

NS_INLINE BOOL SCStringIsEmoji(NSString * string) {
    const unichar hs = [string characterAtIndex:0];
    // surrogate pair (U+1D000-1F9FF)
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (string.length > 1) {
            const unichar ls = [string characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f9c0) {
                return YES;
            }
        }
    }
    else if (string.length > 1) {
        const unichar ls = [string characterAtIndex:1];
        if (ls == 0x20e3 || ls == 0xfe0f || ls == 0xd83c) {
            return YES;
        }
    } else {
        // non surrogate
        if (0x2100 <= hs && hs <= 0x27ff) {
            return YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            return YES;
        }
        else if (0x2934 <= hs && hs <= 0x2935) {
            return YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            return YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)_sc_isValidLengthOfEmoji {
    if (!self.length) return NO;
    
    __block NSUInteger length = 0;
    
    NSUInteger maxLength = 1;
    float version = [UIDevice currentDevice].systemVersion.floatValue;
    if (version < 9) {
        maxLength = 2;
    }
    
    [self enumerateSubstringsInRange:self.sc_rangeOfAll options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        if (substring) {
            length++;
        }
        
        if (length > maxLength) {
            *stop = YES;
        }
    }];
    return length <= maxLength;
}

- (BOOL)sc_isEmoji {
    if (![self _sc_isValidLengthOfEmoji]) return NO;
    
    if (self.sc_lengthOfComposedCharacterSequences < 2) return SCStringIsEmoji(self);
    // To deal with compound emoji, in iOS8, 🇺🇸 is seperated to u + s
    float version = [UIDevice currentDevice].systemVersion.floatValue;
    if (version < 9) {
        static NSMutableString *regex;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            regex = [NSMutableString stringWithString:@"^("];
            [regex appendString:@"©️|®️|™️|〰️|🇨🇳|🇩🇪|🇪🇸|🇫🇷|🇬🇧|🇮🇹|🇯🇵|🇰🇷|🇷🇺|🇺🇸"];
            if (version >= 8.3) {
                [regex appendString:@"|🇦🇺|🇦🇹|🇧🇪|🇧🇷|🇨🇦|🇨🇱|🇨🇴|🇩🇰|🇫🇮|🇭🇰|🇮🇳|🇮🇩|🇮🇪|🇮🇱|🇲🇴|🇲🇾|🇲🇽|🇳🇱|🇳🇿|🇳🇴|🇵🇭|🇵🇱|🇵🇹|🇵🇷|🇸🇦|🇸🇬|🇿🇦|🇸🇪|🇨🇭|🇹🇷|🇦🇪|🇻🇳"];
            }
            [regex appendString:@")$"];
        });
        
        return [self sc_matchesRegex:regex.copy options:NSRegularExpressionCaseInsensitive];
    }
    
    return NO;
}

- (BOOL)sc_containsEmoji {
    __block BOOL containsEmoji = NO;
    
    [self enumerateSubstringsInRange:self.sc_rangeOfAll options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        if (SCStringIsEmoji(substring)) {
            containsEmoji = YES;
            *stop = YES;
        }
    }];
    return containsEmoji;
}

- (NSString *)sc_stringByTrimmingEmoji {
    __block NSString *tempString = [NSString stringWithString:self];
    [self enumerateSubstringsInRange:self.sc_rangeOfAll options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if ([substring sc_isEmoji]) {
            tempString = [tempString stringByReplacingOccurrencesOfString:substring withString:@""];
        }
    }];
    return tempString;
}

@end

//
//  NSString+SCSecurityString.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCSecurityString.h"
#import "NSString+SCBase.h"

@implementation NSString (SCSecurityString)

#pragma mark - Security String
- (NSString *)sc_securityString {
    NSUInteger length = self.sc_lengthOfComposedCharacterSequences;
    NSString *asteriskString = @"";
    while (length--) {
        asteriskString = [asteriskString stringByAppendingString:@"*"];
    }
    return asteriskString;
}

- (NSString *)sc_stingByReplacingWithAsteriskInRange:(NSRange)range {
    return [self sc_stingByReplacingWithSecurityString:@"*" range:range];
}

- (NSString *)sc_stingByReplacingWithSecurityString:(NSString *)replacement range:(NSRange)range {
    NSString *tempString = [NSString stringWithString:self];
    NSString *securityString = @"";
    NSUInteger length = range.length;
    while (length--) {
        securityString = [securityString stringByAppendingString:replacement];
    }
    return [tempString stringByReplacingOccurrencesOfString:[tempString substringWithRange:range] withString:securityString];
}

@end

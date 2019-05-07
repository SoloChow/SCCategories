//
//  NSString+SCNumberValue.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCNumberValue.h"
#import "NSNumber+SCBase.h"

@implementation NSString (SCNumberValue)

#pragma mark - Number Value
- (NSNumber *)sc_numberValue {
    return [NSNumber sc_numberWithString:self];
}

- (char)sc_charValue {
    return self.sc_numberValue.charValue;
}

- (unsigned char)sc_unsignedCharValue {
    return self.sc_numberValue.unsignedCharValue;
}

- (short)sc_shortValue {
    return self.sc_numberValue.shortValue;
}

- (unsigned short)sc_unsignedShortValue {
    return self.sc_numberValue.unsignedShortValue;
}

- (int)sc_intValue {
    return self.intValue;
}

- (unsigned int)sc_unsignedIntValue {
    return self.sc_numberValue.unsignedIntValue;
}

- (long)sc_longValue {
    return self.sc_numberValue.longValue;
}

- (unsigned long)sc_unsignedLongValue {
    return self.sc_numberValue.unsignedLongValue;
}

- (long long)sc_longLongValue {
    return self.longLongValue;
}

- (unsigned long long)sc_unsignedLongLongValue {
    return self.sc_numberValue.unsignedLongLongValue;
}

- (float)sc_floatValue {
    return self.floatValue;
}

- (double)sc_doubleValue {
    return self.doubleValue;
}

- (BOOL)sc_boolValue {
    return self.boolValue;
}

- (NSInteger)sc_integerValue {
    return self.integerValue;
}

- (NSUInteger)sc_unsignedIntegerValue {
    return self.sc_numberValue.unsignedIntegerValue;
}


@end

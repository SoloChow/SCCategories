//
//  NSString+SCBase64String.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCBase64String.h"
#import "NSData+SCBase64.h"

@implementation NSString (SCBase64String)

- (NSString *)sc_base64EncodedString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_base64EncodedString];
}

+ (NSString *)sc_stringWithBase64EncodedString:(NSString *)base64EncodedString {
    NSData *data = [NSData sc_dataWithBase64EncodedString:base64EncodedString];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end

//
//  NSString+SCUUIDString.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCUUIDString.h"

@implementation NSString (SCUUIDString)

+ (NSString *)sc_stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

@end

//
//  NSString+SCPinyin.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCPinyin.h"

@implementation NSString (SCPinyin)

#pragma mark - Pinyin
- (NSString *)sc_pinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformToLatin, false);
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformStripDiacritics, false);
    return mutableString.copy;
}

@end

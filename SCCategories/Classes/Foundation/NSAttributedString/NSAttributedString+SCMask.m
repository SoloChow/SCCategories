//
//  NSAttributedString+SCMask.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSAttributedString+SCMask.h"
#import "NSAttributedString+SCBase.h"
#import "NSValue+SCBase.h"
#import <UIKit/UIKit.h>

@implementation NSAttributedString (SCMask)

#pragma mark - Mask Attributed
+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string textColor:(UIColor *)color font:(UIFont *)font maskRange:(NSRange)maskRange {
    return [NSAttributedString sc_attributedStringWithString:string attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color} maskRange:maskRange maskAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];
}

+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string attributes:(NSDictionary<NSString *, id> *)attrs maskRange:(NSRange)maskRange maskAttributes:(NSDictionary<NSString *, id> *)maskAttrs {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attrs];
    
    if (NSEqualRanges(maskRange, SCNSRangeZero)) return mutableAttributedString.copy;
    
    if ([mutableAttributedString sc_containsRange:maskRange]) {
        [mutableAttributedString addAttributes:maskAttrs range:maskRange];
    }
    
    return mutableAttributedString.copy;
}

@end

//
//  UITextView+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import "UITextView+SCBase.h"

@implementation UITextView (SCBase)

#pragma mark - Base
- (void)sc_selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)sc_setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument; // (0-3)
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location]; // (0-1)
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)]; // (0-2)
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition]; // (1-2)
    [self setSelectedTextRange:selectionRange];
}

- (CGFloat)sc_heightThatFits {
    CGFloat height = [self sc_heightThatFitsWithWidth:self.frame.size.width];
    return height;
}

- (CGFloat)sc_heightThatFitsWithWidth:(CGFloat)width {
    CGSize sizeToFit = [self sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

@end

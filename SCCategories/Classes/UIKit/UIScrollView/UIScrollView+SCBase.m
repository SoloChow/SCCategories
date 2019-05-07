//
//  UIScrollView+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UIScrollView+SCBase.h"
#import "SCCoreGraphicHelper.h"

@implementation UIScrollView (SCBase)

#pragma mark - Base
- (void)sc_scrollToTop {
    [self sc_scrollToTop:YES];
}

- (void)sc_scrollToBottom {
    [self sc_scrollToBottom:YES];
}

- (void)sc_scrollToLeft {
    [self sc_scrollToLeft:YES];
}

- (void)sc_scrollToRight {
    [self sc_scrollToRight:YES];
}

- (void)sc_scrollToTop:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self sc_setContentOffset:off animated:animated];
}

- (void)sc_scrollToBottom:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self sc_setContentOffset:off animated:animated];
}

- (void)sc_scrollToLeft:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self sc_setContentOffset:off animated:animated];
}

- (void)sc_scrollToRight:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self sc_setContentOffset:off animated:animated];
}

- (void)sc_setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
    if (SCCGFloatEqualeToFloat(self.contentOffset.x, contentOffset.x) && SCCGFloatEqualeToFloat(self.contentOffset.y, contentOffset.y)) return; // CGPointEqualToPoint Not Work
    [self setContentOffset:contentOffset animated:animated];
}

@end

//
//  UIView+SCLayout.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIView+SCLayout.h"
#import "UIView+SCBase.h"

@implementation UIView (SCLayout)

#pragma mark - Layout
- (CGFloat)sc_x {
    return self.frame.origin.x;
}

- (void)setSc_x:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)sc_y {
    return self.frame.origin.y;
}

- (void)setSc_y:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGPoint)sc_origin {
    return self.frame.origin;
}

- (void)setSc_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)sc_width {
    return self.frame.size.width;
}

- (void)setSc_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)sc_height {
    return self.frame.size.height;
}

- (void)setSc_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGSize)sc_size {
    return self.frame.size;
}

- (void)setSc_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)sc_centerX {
    return self.center.x;
}

- (void)setSc_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)sc_centerY {
    return self.center.y;
}

- (void)setSc_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)sc_left {
    return self.frame.origin.x;
}

- (void)setSc_left:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)sc_top {
    return self.frame.origin.y;
}

- (void)setSc_top:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)sc_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setSc_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)sc_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setSc_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)sc_originXEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_x = newOrigin.x;
}

- (void)sc_originYEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_y = newOrigin.y;
}

- (void)sc_originEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_origin = newOrigin;
}

- (void)sc_widthEqualToView:(UIView *)view {
    self.sc_width = view.sc_width;
}

- (void)sc_heightEqualToView:(UIView *)view {
    self.sc_height = view.sc_height;
}

- (void)sc_sizeEqualToView:(UIView *)view {
    self.sc_size = view.sc_size;
}

- (void)sc_centerXEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.sc_topSuperView];
    CGPoint centerPoint = [self.sc_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.sc_centerX = centerPoint.x;
}

- (void)sc_centerYEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.sc_topSuperView];
    CGPoint centerPoint = [self.sc_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.sc_centerY = centerPoint.y;
}

- (void)sc_centerEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.sc_topSuperView];
    CGPoint centerPoint = [self.sc_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.sc_centerX = centerPoint.x;
    self.sc_centerY = centerPoint.y;
}

- (void)sc_leftEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_x = newOrigin.x;
}

- (void)sc_topEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_y = newOrigin.y;
}

- (void)sc_rightEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_x = newOrigin.x + view.sc_width - self.sc_width;
}

- (void)sc_bottomEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.sc_origin toView:self.sc_topSuperView];
    CGPoint newOrigin = [self.sc_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.sc_y = newOrigin.y + view.sc_height - self.sc_height;
}

@end

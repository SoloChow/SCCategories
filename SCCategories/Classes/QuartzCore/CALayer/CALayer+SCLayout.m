//
//  CALayer+SCLayout.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "CALayer+SCLayout.h"

@implementation CALayer (SCLayout)

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

- (void)setSc_y:(CGFloat)sc_y {
    CGRect frame = self.frame;
    frame.origin.y = sc_y;
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

- (CGSize)sc_frameSize {
    return self.frame.size;
}

- (void)setSc_frameSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)sc_centerX {
    return self.frame.origin.x + self.frame.size.width * 0.5;
}

- (void)setSc_centerX:(CGFloat)centerX {
    CGRect frame = self.frame;
    frame.origin.x = centerX - frame.size.width * 0.5;
    self.frame = frame;
}

- (CGFloat)sc_centerY {
    return self.frame.origin.y + self.frame.size.height * 0.5;
}

- (void)setSc_centerY:(CGFloat)centerY {
    CGRect frame = self.frame;
    frame.origin.y = centerY - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGPoint)sc_center {
    return CGPointMake(self.frame.origin.x + self.frame.size.width * 0.5,
                       self.frame.origin.y + self.frame.size.height * 0.5);
}

- (void)setSc_center:(CGPoint)center {
    CGRect frame = self.frame;
    frame.origin.x = center.x - frame.size.width * 0.5;
    frame.origin.y = center.y - frame.size.height * 0.5;
    self.frame = frame;
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

@end

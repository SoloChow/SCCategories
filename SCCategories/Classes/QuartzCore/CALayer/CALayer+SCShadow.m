//
//  CALayer+SCShadow.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "CALayer+SCShadow.h"
#import <UIKit/UIKit.h>

@implementation CALayer (SCShadow)

- (void)sc_setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.shadowColor = color.CGColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shadowOpacity = 1;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

@end

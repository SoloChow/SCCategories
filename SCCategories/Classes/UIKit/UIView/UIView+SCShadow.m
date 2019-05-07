//
//  UIView+SCShadow.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIView+SCShadow.h"

@implementation UIView (SCShadow)

- (void)sc_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

@end

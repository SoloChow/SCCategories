//
//  UIView+SCTouchInset.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "UIView+SCTouchInset.h"
#import "NSObject+SCSwizzleMethod.h"
#import "NSObject+SCAssociatedValue.h"

static const int SC_VIEW_TOUCH_INSET_KEY;

@implementation UIView (SCTouchInset)

+ (void)load {
    [self _sc_swizzlePointInsideWithEventMethod];
}

- (void)setSc_touchInset:(UIEdgeInsets)touchInset {
    [self sc_setAssociatedValue:[NSValue valueWithUIEdgeInsets:touchInset] withKey:&SC_VIEW_TOUCH_INSET_KEY];
}

- (UIEdgeInsets)sc_touchInset {
    return [[self sc_getAssociatedValueForKey:&SC_VIEW_TOUCH_INSET_KEY] UIEdgeInsetsValue];
}

+ (void)_sc_swizzlePointInsideWithEventMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(pointInside:withEvent:) withNewMethod:@selector(_sc_pointInside:withEvent:)];
    });
}

- (BOOL)_sc_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.sc_touchInset, UIEdgeInsetsZero) || self.hidden || ([self isKindOfClass:UIControl.class] && !((UIControl *)self).enabled)) {
        return [self _sc_pointInside:point withEvent:event]; // original implementation
    }
    
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, self.sc_touchInset);
    hitFrame.size.width = MAX(hitFrame.size.width, 0); // don't allow negative sizes
    hitFrame.size.height = MAX(hitFrame.size.height, 0);
    return CGRectContainsPoint(hitFrame, point);
}

@end

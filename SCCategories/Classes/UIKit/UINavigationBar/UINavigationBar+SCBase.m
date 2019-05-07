//
//  UINavigationBar+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UINavigationBar+SCBase.h"
#import "NSObject+SCAssociatedValue.h"
#import "NSObject+SCSwizzleMethod.h"

static const int SC_NAVIGATION_BOTTOM_HAIRLINE_KEY;
static const int SC_NAVIGATION_BOTTOM_HAIRLINE_HIDES_KEY;
static const int SC_NAVIGATION_BOTTOM_HAIRLINE_BACKGROUND_KEY;

@interface UIView (SCUINavigationBar)

- (UIImageView *)sc_findHairlineImageView;

@end

@implementation UIView (SCUINavigationBar)

- (UIImageView *)sc_findHairlineImageView {
    if ([self isKindOfClass:UIImageView.class] && self.bounds.size.height <= 1.0f) return (UIImageView *)self;
    
    for (UIView *subview in self.subviews) {
        UIImageView *imageView = [subview sc_findHairlineImageView];
        if (imageView) {
            return imageView;
        }
    }
    
    return nil;
}

@end


@implementation UINavigationBar (SCBase)

#pragma mark - Base
+ (void)load {
    [self _sc_swizzleLayoutSubviewsMethod];
}

- (UIView *)_sc_bottomHairlineView {
    UIView *bottomHairlineView = [self sc_getAssociatedValueForKey:&SC_NAVIGATION_BOTTOM_HAIRLINE_KEY];
    if (!bottomHairlineView) {
        bottomHairlineView = [self sc_findHairlineImageView];
        [self _sc_setBottomHairlineView:bottomHairlineView];
    }
    return bottomHairlineView;
}

- (void)_sc_setBottomHairlineView:(UIView *)topHairlineView {
    [self sc_setAssociatedValue:topHairlineView withKey:&SC_NAVIGATION_BOTTOM_HAIRLINE_KEY];
}

- (void)setSc_hidesBottomHairline:(BOOL)sc_hidesBottomHairline {
    [self sc_setAssociatedValue:@(sc_hidesBottomHairline) withKey:&SC_NAVIGATION_BOTTOM_HAIRLINE_HIDES_KEY];
    [self._sc_bottomHairlineView setHidden:sc_hidesBottomHairline];
}

- (BOOL)sc_hidesBottomHairline {
    return [[self sc_getAssociatedValueForKey:&SC_NAVIGATION_BOTTOM_HAIRLINE_HIDES_KEY] boolValue];
}

- (void)setSc_bottomHairlineColor:(UIColor *)color {
    [self sc_setAssociatedValue:color withKey:&SC_NAVIGATION_BOTTOM_HAIRLINE_BACKGROUND_KEY];
    [self setNeedsLayout];
}

- (UIColor *)sc_bottomHairlineColor {
    UIColor *bottomHairlineColor = [self sc_getAssociatedValueForKey:&SC_NAVIGATION_BOTTOM_HAIRLINE_BACKGROUND_KEY];
    if (!bottomHairlineColor) {
        bottomHairlineColor = self._sc_bottomHairlineView.backgroundColor;
        [self setSc_bottomHairlineColor:bottomHairlineColor];
    }
    return bottomHairlineColor;
}

+ (void)_sc_swizzleLayoutSubviewsMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(layoutSubviews) withNewMethod:@selector(_sc_layoutSubviews)];
    });
}

- (void)_sc_layoutSubviews {
    [self _sc_layoutSubviews];
    
//    self._sc_bottomHairlineView.backgroundColor = self.sc_bottomHairlineColor;
}

@end

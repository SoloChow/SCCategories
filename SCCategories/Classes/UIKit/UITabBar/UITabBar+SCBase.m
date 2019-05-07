//
//  UITabBar+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UITabBar+SCBase.h"
#import "NSObject+SCAssociatedValue.h"
#import "NSObject+SCSwizzleMethod.h"

static const int SC_TAB_BAR_TOP_HAIRLINE_KEY;
static const int SC_TAB_BAR_TOP_HAIRLINE_HIDES_KEY;
static const int SC_TAB_BAR_TOP_HAIRLINE_BACKGROUND_KEY;

@interface UIView (SCUITabBar)

- (UIImageView *)sc_findHairlineImageView;

@end

@implementation UIView (SCUITabBar)

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

@implementation UITabBar (SCBase)

#pragma mark - Base
+ (void)load {
    [self _sc_swizzleLayoutSubviewsMethod];
}

- (UIView *)_sc_topHairlineView {
    UIView *topHairlineView = [self sc_getAssociatedValueForKey:&SC_TAB_BAR_TOP_HAIRLINE_KEY];
    if (!topHairlineView) {
        topHairlineView = [self sc_findHairlineImageView];
         [self _sc_setTopHairlineView:topHairlineView];
    }
    return topHairlineView;
}

- (void)_sc_setTopHairlineView:(UIView *)topHairlineView {
    [self sc_setAssociatedValue:topHairlineView withKey:&SC_TAB_BAR_TOP_HAIRLINE_KEY];
}

- (void)setSc_hidesTopHairline:(BOOL)sc_hidesTopHairline {
    [self sc_setAssociatedValue:@(sc_hidesTopHairline) withKey:&SC_TAB_BAR_TOP_HAIRLINE_HIDES_KEY];
    [self._sc_topHairlineView setHidden:sc_hidesTopHairline];
}

- (BOOL)sc_hidesTopHairline {
    return [[self sc_getAssociatedValueForKey:&SC_TAB_BAR_TOP_HAIRLINE_HIDES_KEY] boolValue];
}

- (void)setSc_topHairlineColor:(UIColor *)color {
    [self sc_setAssociatedValue:color withKey:&SC_TAB_BAR_TOP_HAIRLINE_BACKGROUND_KEY];
    [self setNeedsLayout];
}

- (UIColor *)sc_topHairlineColor {
    UIColor *topHairlineColor = [self sc_getAssociatedValueForKey:&SC_TAB_BAR_TOP_HAIRLINE_BACKGROUND_KEY];
    if (!topHairlineColor) {
        topHairlineColor = self._sc_topHairlineView.backgroundColor;
        [self setSc_topHairlineColor:topHairlineColor];
    }
    return topHairlineColor;
}

+ (void)_sc_swizzleLayoutSubviewsMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(layoutSubviews) withNewMethod:@selector(_sc_layoutSubviews)];
    });
}

- (void)_sc_layoutSubviews {
    [self _sc_layoutSubviews];
    
    self._sc_topHairlineView.backgroundColor = self.sc_topHairlineColor;
}

@end

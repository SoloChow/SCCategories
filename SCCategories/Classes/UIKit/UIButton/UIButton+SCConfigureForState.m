//
//  UIButton+SCConfigureForState.m
//  Pods
//
//  Created by Solo on 17/4/19.
//
//

#import "UIButton+SCConfigureForState.h"
#import "NSObject+SCAssociatedValue.h"
#import "NSObject+SCSwizzleMethod.h"

//static const int SC_BUTTON_BACKGROUND_COLORS_KEY;

@implementation UIButton (SCConfigureForState)

///**
// 根据按钮状态, 设置按钮的背景颜色
// 
// @param backgroundColor 背景颜色
// @param state           按钮状态
// */
//- (void)sc_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
//
///**
// 获取按钮状态对应的背景颜色
// 
// @param state 按钮状态
// @return 对应的背景颜色
// */
//- (UIColor *)sc_backgroundColorForState:(UIControlState)state;
//
//@property(nonatomic, readonly, strong) UIColor *sc_currentBackgroundColor; ///< 按钮当前的背景颜色(normal/highlighted/selected/disabled, 或为nil)

/*
#pragma mark - Base
+ (void)load {
    [self _sc_swizzleSetEnabledMethod];
    [self _sc_swizzleSetHighlightedMethod];
    [self _sc_swizzleSetSelectedMethod];
    [self _sc_swizzleSetBackgroundColorMethod];
}

- (void)sc_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    if (state == self.state) {
        [self setBackgroundColor:backgroundColor];
        return;
    }
    
    [self _sc_setBackgroundColor:backgroundColor forState:state];
}

- (UIColor *)sc_backgroundColorForState:(UIControlState)state {
    UIColor *backgroundColor = [self _sc_backgroundColorForState:state];
    if (!backgroundColor) return [self _sc_backgroundColorForState:UIControlStateNormal];
    
    return backgroundColor;
}

- (UIColor *)sc_currentBackgroundColor {
    return [self _sc_backgroundColorForCurrentState];
}

- (void)_sc_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    NSString *key = [self _sc_keyForState:state];
    if (backgroundColor) {
        [self._sc_backgroundColors setObject:backgroundColor forKey:key];
    } else {
        [self._sc_backgroundColors removeObjectForKey:key];
    }
}

- (UIColor *)_sc_backgroundColorForState:(UIControlState)state {
    NSString *key = [self _sc_keyForState:state];
    return [self._sc_backgroundColors objectForKey:key];
}

- (NSMutableDictionary *)_sc_backgroundColors {
    NSMutableDictionary *backgroundColors = [self sc_getAssociatedValueForKey:&SC_BUTTON_BACKGROUND_COLORS_KEY];
    if (!backgroundColors) {
        backgroundColors = @{}.mutableCopy;
        [self sc_setAssociatedValue:backgroundColors withKey:&SC_BUTTON_BACKGROUND_COLORS_KEY];
    }
    return backgroundColors;
}

- (NSString *)_sc_keyForState:(UIControlState)state {
    return [NSString stringWithFormat:@"%lu", (unsigned long)state];
}

+ (void)_sc_swizzleSetSelectedMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(setSelected:) withNewMethod:@selector(_sc_setSelected:)];
    });
}

+ (void)_sc_swizzleSetHighlightedMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(setHighlighted:) withNewMethod:@selector(_sc_setHighlighted:)];
    });
}

+ (void)_sc_swizzleSetEnabledMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(setEnabled:) withNewMethod:@selector(_sc_setEnabled:)];
    });
}

+ (void)_sc_swizzleSetBackgroundColorMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(setBackgroundColor:) withNewMethod:@selector(_sc_setBackgroundColor:)];
    });
}

- (void)_sc_setBackgroundColorForCurrentState {
    UIColor *color = [self _sc_backgroundColorForCurrentState];
    [self setBackgroundColor:color];
}

- (UIColor *)_sc_backgroundColorForCurrentState {
    return [self sc_backgroundColorForState:self.state];
}

- (void)_sc_setSelected:(BOOL)selected {
    [self _sc_setSelected:selected];
    
    [self _sc_setBackgroundColorForCurrentState];
}

- (void)_sc_setHighlighted:(BOOL)highlighted {
    [self _sc_setHighlighted:highlighted];
    
    [self _sc_setBackgroundColorForCurrentState];
}

- (void)_sc_setEnabled:(BOOL)enabled {
    [self _sc_setEnabled:enabled];
    
    [self _sc_setBackgroundColorForCurrentState];
}

- (void)_sc_setBackgroundColor:(UIColor *)backgroundColor {
    [self _sc_setBackgroundColor:backgroundColor];
    
    [self _sc_setBackgroundColor:backgroundColor forState:self.state];
}
 */

@end

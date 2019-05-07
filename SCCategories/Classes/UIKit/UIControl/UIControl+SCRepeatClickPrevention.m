//
//  UIControl+SCRepeatClickPrevention.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIControl+SCRepeatClickPrevention.h"
#import "NSObject+SCAssociatedValue.h"
#import "NSObject+SCSwizzleMethod.h"

static const int SC_CONTROL_REPEAT_CLICK_PREVENTION_KEY;
static const int SC_CONTROL_ACCEPT_EVENT_INTERVAL_KEY;
static const int SC_CONTROL_IGNORE_EVENT_KEY;

@implementation UIControl (SCRepeatClickPrevention)

+ (void)load {
    [self _sc_swizzleSendActionToForEventMethod];
}

- (BOOL)sc_repeatClickPrevention {
    return [[self sc_getAssociatedValueForKey:&SC_CONTROL_REPEAT_CLICK_PREVENTION_KEY] boolValue];
}

- (void)setSc_repeatClickPrevention:(BOOL)repeatClickPrevention {
    [self sc_setAssociatedValue:@(repeatClickPrevention) withKey:&SC_CONTROL_REPEAT_CLICK_PREVENTION_KEY];
}

- (NSTimeInterval)sc_acceptEventInterval {
    return [[self sc_getAssociatedValueForKey:&SC_CONTROL_ACCEPT_EVENT_INTERVAL_KEY] doubleValue];
}

- (void)setSc_acceptEventInterval:(NSTimeInterval)acceptEventInterval {
    [self sc_setAssociatedValue:@(acceptEventInterval) withKey:&SC_CONTROL_ACCEPT_EVENT_INTERVAL_KEY];
}

- (BOOL)sc_ignoreEvent {
    return [[self sc_getAssociatedValueForKey:&SC_CONTROL_IGNORE_EVENT_KEY] boolValue];
}

- (void)setSc_ignoreEvent:(BOOL)ignoreEvent {
    [self sc_setAssociatedValue:@(ignoreEvent) withKey:&SC_CONTROL_IGNORE_EVENT_KEY];
}

- (void)_sc_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (!self.sc_repeatClickPrevention) {
        [self _sc_sendAction:action to:target forEvent:event];
        return;
    }
    
    if (self.sc_ignoreEvent) return;
    if (self.sc_acceptEventInterval > 0) {
        self.sc_ignoreEvent = YES;
        [self performSelector:@selector(setSc_ignoreEvent:) withObject:@(NO) afterDelay:self.sc_acceptEventInterval];
    }
    
    [self _sc_sendAction:action to:target forEvent:event];
}

+ (void)_sc_swizzleSendActionToForEventMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sc_swizzleInstanceMethod:@selector(sendAction:to:forEvent:) withNewMethod:@selector(_sc_sendAction:to:forEvent:)];
    });
}

@end

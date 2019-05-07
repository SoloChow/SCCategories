//
//  UISwipeGestureRecognizer+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import "UISwipeGestureRecognizer+SCBase.h"
#import "UIGestureRecognizer+SCBase.h"

const UISwipeGestureRecognizerDirection SCUISwipeGestureRecognizerDirectionHorizontal = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;

const UISwipeGestureRecognizerDirection SCUISwipeGestureRecognizerDirectionVertical = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;

@implementation UISwipeGestureRecognizer (SCBase)

#pragma mark - Base
+ (instancetype)sc_swipeGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction target:(id)target action:(SEL)action {
    return [[self alloc] initWithDirection:direction target:target action:action];
}

+ (instancetype)sc_swipeGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction actionBlock:(void (^)(id sender))block {
    return [[self alloc] initWithDirection:direction actionBlock:block];
}

- (instancetype)initWithDirection:(UISwipeGestureRecognizerDirection)direction target:(id)target action:(SEL)action {
    self = [super init];
    if (self) {
        self = [self initWithTarget:target action:action];
        [self setDirection:direction];
    }
    return self;
}

- (instancetype)initWithDirection:(UISwipeGestureRecognizerDirection)direction actionBlock:(void (^)(id sender))block {
    self = [super init];
    if (self) {
        if (block) {
            self = [self initWithActionBlock:block];
        }
        [self setDirection:direction];
    }
    return self;
}

@end

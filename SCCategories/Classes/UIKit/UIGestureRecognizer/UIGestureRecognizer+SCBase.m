//
//  UIGestureRecognizer+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import "UIGestureRecognizer+SCBase.h"
#import "NSObject+SCAssociatedValue.h"

static const int SC_GESTURE_RECOGNIZER_BLOCK_KEY;

@interface SCUIGestureRecognizerBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation SCUIGestureRecognizerBlockTarget

- (id)initWithBlock:(void (^)(id sender))block {
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    !_block?:_block(sender);
}

@end


@implementation UIGestureRecognizer (SCBase)

#pragma mark - Base
+ (instancetype)sc_gestureRecognizerWithActionBlock:(void (^)(id sender))block {
    return [[self alloc] initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(void (^)(id sender))block {
    self = [self init];
    if (self) {
        [self sc_addActionBlock:block];
    }
    return self;
}

- (void)sc_addActionBlock:(void (^)(id sender))block {
    SCUIGestureRecognizerBlockTarget *target = [[SCUIGestureRecognizerBlockTarget alloc] initWithBlock:block];
    [self addTarget:target action:@selector(invoke:)];
    NSMutableArray *targets = [self _sc_allUIGestureRecognizerBlockTargets];
    [targets addObject:target];
}

- (void)sc_removeAllActionBlocks {
    NSMutableArray *targets = [self _sc_allUIGestureRecognizerBlockTargets];
    [targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        [self removeTarget:target action:@selector(invoke:)];
    }];
    [targets removeAllObjects];
}

- (NSMutableArray *)_sc_allUIGestureRecognizerBlockTargets{
    NSMutableArray *targets = [self sc_getAssociatedValueForKey:&SC_GESTURE_RECOGNIZER_BLOCK_KEY];
    if (!targets) {
        targets = [NSMutableArray array];
        [self sc_setAssociatedValue:targets withKey:&SC_GESTURE_RECOGNIZER_BLOCK_KEY];
    }
    return targets;
}

@end

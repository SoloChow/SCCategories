//
//  UIControl+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import "UIControl+SCBase.h"
#import "NSObject+SCAssociatedValue.h"

static const int SC_CONTROL_BLOCK_KEY;

@interface SCUIControlBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);
@property (nonatomic, assign) UIControlEvents events;

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events;
- (void)invoke:(id)sender;

@end

@implementation SCUIControlBlockTarget

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events {
    self = [super init];
    if (self) {
        _block = [block copy];
        _events = events;
    }
    return self;
}

- (void)invoke:(id)sender {
    !_block?:_block(sender);
}

@end


@implementation UIControl (SCBase)

#pragma mark - Base
- (void)sc_setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    if (!target || !action || !controlEvents) return;
    NSSet *targets = [self allTargets];
    // deal with controlEvents
    for (id currentTarget in targets) {
        NSArray *actions = [self actionsForTarget:currentTarget forControlEvent:controlEvents]; // actions for currentTarget of controlEvents
        for (NSString *currentAction in actions) {
            [self removeTarget:currentTarget action:NSSelectorFromString(currentAction)
              forControlEvents:controlEvents];
        }
    }
    [self addTarget:target action:action forControlEvents:controlEvents];
}

- (void)sc_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block {
    [self sc_removeAllBlocksForControlEvents:UIControlEventAllEvents];
    [self sc_addBlockForControlEvents:controlEvents block:block];
}

- (void)sc_addBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block {
    if (!controlEvents) return;
    SCUIControlBlockTarget *target = [[SCUIControlBlockTarget alloc] initWithBlock:block events:controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSMutableArray *targets = [self _sc_allUIControlBlockTargets];
    [targets addObject:target];
}

- (void)sc_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents {
    if (!controlEvents) return;
    
    NSMutableArray *targets = [self _sc_allUIControlBlockTargets];
    NSMutableArray *removes = [NSMutableArray array];
    for (SCUIControlBlockTarget *target in targets) {
        /*
         假定(target.events = 0010 | 0100, controlEvents = 0010 | 1000)
         target.events & controlEvents = 0010 -> target.events与controlEvents存在重叠
         target.events & (~controlEvents) = 0100 -> 获取target.events与controlEvents不重叠的部分
         */
        // target.events 与 controlEvents 存在重叠
        if (target.events & controlEvents)  {
            UIControlEvents newEvent = target.events & (~controlEvents);
            if (newEvent) {
                [self removeTarget:target action:@selector(invoke:) forControlEvents:target.events];
                target.events = newEvent;
                [self addTarget:target action:@selector(invoke:) forControlEvents:target.events];
            } else {
                [self removeTarget:target action:@selector(invoke:) forControlEvents:target.events];
                [removes addObject:target];
            }
        }
    }
    [targets removeObjectsInArray:removes];
}

- (NSMutableArray *)_sc_allUIControlBlockTargets {
    NSMutableArray *targets = [self sc_getAssociatedValueForKey:&SC_CONTROL_BLOCK_KEY];
    if (!targets) {
        targets = [NSMutableArray array];
        [self sc_setAssociatedValue:targets withKey:&SC_CONTROL_BLOCK_KEY];
    }
    return targets;
}

- (void)sc_removeAllTargets {
    [[self allTargets] enumerateObjectsUsingBlock: ^(id object, BOOL *stop) {
        [self removeTarget:object action:NULL forControlEvents:UIControlEventAllEvents];
    }];
    [[self _sc_allUIControlBlockTargets] removeAllObjects];
}

#pragma mark - Touch Up Inside
- (void)sc_setTarget:(id)target actionForTouchUpInsideControlEvent:(SEL)action {
    [self sc_setTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)sc_addTarget:(id)target actionForTouchUpInsideControlEvent:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)sc_removeTarget:(id)target actionForTouchUpInsideControlEvent:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)sc_setBlockForTouchUpInsideControlEvent:(void (^)(id sender))block {
    [self sc_setBlockForControlEvents:UIControlEventTouchUpInside block:block];
}

- (void)sc_addBlockForTouchUpInsideControlEvent:(void (^)(id sender))block {
    [self sc_addBlockForControlEvents:UIControlEventTouchUpInside block:block];
}

- (void)sc_removeAllBlocksForTouchUpInsideControlEvent {
    [self sc_removeAllBlocksForControlEvents:UIControlEventTouchUpInside];
}

@end

//
//  NSObject+SCKeyValueObserving.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSObject+SCKeyValueObserving.h"
#import "NSObject+SCAssociatedValue.h"

static const int SC_OBJECT_KVO_BLOCK_KEY;

@interface SCNSObjectKVOBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(__weak id obj, id oldVal, id newVal);

- (id)initWithBlock:(void (^)(__weak id obj, id oldVal, id newVal))block;

@end

@implementation SCNSObjectKVOBlockTarget

- (id)initWithBlock:(void (^)(__weak id obj, id oldVal, id newVal))block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (!self.block) return;
    
    BOOL isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (isPrior) return;
    
    NSKeyValueChange changeKind = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting) return;
    
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldValue == [NSNull null]) oldValue = nil;
    
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    if (newValue == [NSNull null]) newValue = nil;
    
    self.block(object, oldValue, newValue);
}

@end


@implementation NSObject (SCKeyValueObserving)

- (void)sc_addObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id obj, id oldValue, id newValue))block {
    if (!keyPath || !block) return;
    SCNSObjectKVOBlockTarget *target = [[SCNSObjectKVOBlockTarget alloc] initWithBlock:block];
    NSMutableDictionary *dict = [self _sc_allNSObjectObserverBlocks];
    NSMutableArray *array = dict[keyPath];
    if (!array) {
        array = [NSMutableArray new];
        dict[keyPath] = array;
    }
    [array addObject:target];
    [self addObserver:target forKeyPath:keyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}

- (void)sc_removeObserverBlocksForKeyPath:(NSString *)keyPath {
    if (!keyPath) return;
    NSMutableDictionary *dic = [self _sc_allNSObjectObserverBlocks];
    NSMutableArray *arr = dic[keyPath];
    [arr enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        [self removeObserver:obj forKeyPath:keyPath];
    }];
    
    [dic removeObjectForKey:keyPath];
}

- (void)sc_removeObserverBlocks {
    NSMutableDictionary *dic = [self _sc_allNSObjectObserverBlocks];
    [dic enumerateKeysAndObjectsUsingBlock: ^(NSString *key, NSArray *arr, BOOL *stop) {
        [arr enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
            [self removeObserver:obj forKeyPath:key];
        }];
    }];
    
    [dic removeAllObjects];
}

- (NSMutableDictionary *)_sc_allNSObjectObserverBlocks {
    NSMutableDictionary *targets = [self sc_getAssociatedValueForKey:&SC_OBJECT_KVO_BLOCK_KEY];
    if (!targets) {
        targets = [NSMutableDictionary new];
        [self sc_setAssociatedValue:targets withKey:&SC_OBJECT_KVO_BLOCK_KEY];
    }
    return targets;
}

@end

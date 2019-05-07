//
//  NSArray+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSArray+SCBase.h"

@implementation NSArray (SCBase)

#pragma mark - Base
- (id)sc_objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

- (id)sc_randomObject {
    if (self.count) {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    return nil;
}

- (NSArray *)sc_randomObjectsInCount:(NSUInteger)count {
    if (!count) return self;
    if (!self.count) return self;
    if (count > self.count) return nil;
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [array addObject:[self sc_randomObject]];
    }
    return [array copy];
}

- (BOOL)sc_containsString:(NSString *)string {
    if (!self.count) return NO;
    
    for (id element in self) {
        if ([element isKindOfClass:[NSString class]] && [element isEqualToString:string]) return YES;
    }
    return NO;
}

@end


@implementation NSMutableArray (SCBase)

- (void)sc_removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

- (void)sc_removeLastObject {
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}

- (id)sc_popFirstObject {
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self sc_removeFirstObject];
    }
    return obj;
}

- (id)sc_popLastObject {
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self sc_removeLastObject];
    }
    return obj;
}

- (void)sc_appendObject:(id)anObject {
    [self addObject:anObject];
}

- (void)sc_prependObject:(id)anObject {
    [self insertObject:anObject atIndex:0];
}

- (void)sc_appendObjects:(NSArray *)objects {
    if (!objects || !objects.count) return;
    [self addObjectsFromArray:objects];
}

- (void)sc_prependObjects:(NSArray *)objects {
    if (!objects || !objects.count) return;
    NSUInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)sc_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    if (!objects || !objects.count) return;
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

@end

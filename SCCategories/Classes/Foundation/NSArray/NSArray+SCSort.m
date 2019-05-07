//
//  NSArray+SCSort.m
//  Pods
//
//  Created by Solo on 17/2/9.
//
//

#import "NSArray+SCSort.h"

@implementation NSArray (SCSort)

- (NSArray *)sc_sortedArrayAtRandomInCount:(NSUInteger)count {
    if (count > self.count) return nil;
    
    NSArray *array = [self sc_sortedArrayAtRandom];
    return [array subarrayWithRange:NSMakeRange(0, count)];
}

- (NSArray *)sc_sortedArrayAtRandom {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array sc_shuffle];
    return [array copy];
}

- (NSArray *)sc_sortedArrayByReversed {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array sc_reverse];
    return [array copy];
}

- (NSArray *)sc_sortedArrayInAscending {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array sc_sortInAscending];
    return [array copy];
}

- (NSArray *)sc_sortedArrayInDescending {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array sc_sortInDescending];
    return [array copy];
}

- (NSArray *)sc_sortedArrayInAscendingWithKeys:(NSArray<NSString *> *)keys {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array sc_sortedArrayInAscendingWithKeys:keys];
    return [array copy];
}

- (NSArray *)sc_sortedArrayInDescendingWithKeys:(NSArray<NSString *> *)keys {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array sc_sortedArrayInDescendingWithKeys:keys];
    return [array copy];
}

@end


@implementation NSMutableArray (SCSort)

- (void)sc_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0); // 向下取整中间值 9.99 -> 9, -3.14 -> -4
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))]; // 互相交换两个元素位置 i + (count - (i + 1)) = count - 1
    }
}

- (void)sc_shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)]; // 机会递减: (A B C) -> B (A C) -> B C (A)
    }
}

- (void)sc_sortInAscending {
    if (self.count <= 1) return;
    
    [self sortUsingSelector:@selector(compare:)];
}

- (void)sc_sortInDescending {
    if (self.count <= 1) return;
    
    [self sortWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return - [obj1 compare:obj2];
    }];
}

- (void)sc_sortInAscendingWithKeys:(NSArray<NSString *> *)keys {
    if (!keys.count || !keys) return;
    if (self.count <= 1) return;
    
    NSMutableArray *descriptors = @[].mutableCopy;
    for (NSString *key in keys) {
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:YES];
        [descriptors addObject:descriptor];
    }
    [self sortUsingDescriptors:descriptors];
}

- (void)sc_sortInDescendingWithKeys:(NSArray<NSString *> *)keys {
    if (!keys.count || !keys) return;
    if (self.count <= 1) return;
    
    NSMutableArray *descriptors = @[].mutableCopy;
    for (NSString *key in keys) {
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:NO];
        [descriptors addObject:descriptor];
    }
    [self sortUsingDescriptors:descriptors];
}

@end

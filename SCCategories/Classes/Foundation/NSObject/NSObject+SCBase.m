//
//  NSObject+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/3.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSObject+SCBase.h"
#import <objc/runtime.h>

@implementation NSObject (SCBase)

#pragma mark - Base
+ (NSString *)sc_className {
    return NSStringFromClass(self);
}

- (NSString *)sc_className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}

- (NSUInteger)sc_retainCountInARC {
    return [[self valueForKey:@"retainCount"] unsignedLongValue];
}

- (void)sc_performSelector:(SEL)sel afterDelay:(NSTimeInterval)delay {
    [self performSelector:sel withObject:nil afterDelay:delay];
}

#pragma mark - Check
+ (BOOL)sc_isEqualToClass:(Class)aClass {
    return [[self sc_className] isEqualToString:[aClass sc_className]];
}

- (BOOL)sc_isEqualToClass:(id)object {
    return [[self sc_className] isEqualToString:[object sc_className]];
}

#pragma mark - Deep Copy
- (id)sc_deepCopy {
    id obj = nil;
    @try {
        obj = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    return obj;
}

- (id)sc_deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver {
    id obj = nil;
    @try {
        obj = [unarchiver unarchiveObjectWithData:[archiver archivedDataWithRootObject:self]];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    return obj;
}

@end

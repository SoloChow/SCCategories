//
//  NSObject+SCAssociatedValue.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "NSObject+SCAssociatedValue.h"
#import <objc/runtime.h>

@implementation NSObject (SCAssociatedValue)

- (void)sc_setAssociatedValue:(id)value withKey:(const void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)sc_setAssociatedWeakValue:(id)value withKey:(const void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)sc_setAssociatedCopyValue:(id)value withKey:(const void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)sc_getAssociatedValueForKey:(const void *)key {
    return objc_getAssociatedObject(self, key);
}

- (void)sc_removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

@end

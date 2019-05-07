//
//  UINavigationController+SCBase.m
//  Pods
//
//  Created by Solo on 17/7/19.
//
//

#import "UINavigationController+SCBase.h"

@implementation UINavigationController (SCBase)

#pragma mark - Base
- (void)sc_removeViewControllerFromClassName:(NSString *)className {
    if (!className || !className.length) return;
    
    Class class = NSClassFromString(className);
    [self sc_removeViewControllerFromClass:class];
}

- (void)sc_removeViewControllerFromClass:(Class)aClass {
    if (!self.viewControllers || !self.viewControllers.count) return;
    if (![aClass isSubclassOfClass:[UIViewController class]]) return;
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    BOOL changed = NO;
    for (UIViewController *viewController in self.viewControllers) {
        if ([viewController isKindOfClass:[aClass class]]) {
            changed = YES;
            [viewControllers removeObject:viewController];
            break;
        }
    }
    
    if (!changed) return;
    self.viewControllers = viewControllers.copy;
}

- (void)sc_removeViewControllersFromClassNames:(NSSet<NSString *> *)classNames {
    if (!classNames || !classNames.count ) return;
    
    NSMutableSet *buffer = [NSMutableSet set];
    NSEnumerator *enumerator = [classNames objectEnumerator];
    for (NSString *className in enumerator) {
        Class aClass = NSClassFromString(className);
        [buffer addObject:aClass];
    }
    if (!buffer.count) return;
    
    [self sc_removeViewControllersFromClasses:buffer.copy];
}

- (void)sc_removeViewControllersFromClasses:(NSSet<Class> *)classes {
    if (!classes || !classes.count) return;
    
    NSMutableSet *buffer = [NSMutableSet set];
    NSEnumerator *enumerator = [classes objectEnumerator];
    for (Class aClass in enumerator) {
        if (![aClass isSubclassOfClass:[UIViewController class]]) continue;
        
        [buffer addObject:aClass];
    }
    if (!buffer.count) return;
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    BOOL changed = NO;
    for (UIViewController *viewController in self.viewControllers) {
        if ([buffer containsObject:viewController.class]) {
            changed = YES;
            [viewControllers removeObject:viewController];
        }
    }
    
    if (!changed) return;
    self.viewControllers = viewControllers.copy;
}

#pragma mark - Pop
- (nullable NSArray<__kindof UIViewController *> *)sc_popToViewControllerFromClassName:(NSString *)className animated:(BOOL)animated {
    if (!className || !className.length) return nil;
    
    Class class = NSClassFromString(className);
    return [self sc_popToViewControllerFromClass:class animated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)sc_popToViewControllerFromClass:(Class)aClass animated:(BOOL)animated {
    if (!self.viewControllers || !self.viewControllers.count) return nil;
    if (![aClass isSubclassOfClass:[UIViewController class]]) return nil;
    
    for (UIViewController *viewController in self.viewControllers) {
        if ([viewController isKindOfClass:[aClass class]]) {
            if (self.topViewController == viewController) continue;
            
            return [self popToViewController:viewController animated:animated];
        }
    }
    return nil;
}

@end

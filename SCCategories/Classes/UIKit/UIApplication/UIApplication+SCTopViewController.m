//
//  UIApplication+SCTopViewController.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIApplication+SCTopViewController.h"

@implementation UIApplication (SCTopViewController)

- (UIViewController *)sc_topViewController {
    __block UIWindow *normalWindow = [self.delegate window];
    if (normalWindow.windowLevel != UIWindowLevelNormal) {
        [self.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.windowLevel == UIWindowLevelNormal) {
                normalWindow = obj;
                *stop = YES;
            }
        }];
    }
    
    return [self _sc_nextTopForViewController:normalWindow.rootViewController];
}

- (UIViewController *)_sc_nextTopForViewController:(UIViewController *)inViewController {
    while (inViewController.presentedViewController) {
        inViewController = inViewController.presentedViewController;
    }
    
    if ([inViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedViewController = [self _sc_nextTopForViewController:((UITabBarController *)inViewController).selectedViewController];
        return selectedViewController;
    } else if ([inViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *selectedViewController = [self _sc_nextTopForViewController:((UINavigationController *)inViewController).visibleViewController];
        return selectedViewController;
    } else {
        return inViewController;
    }
}

@end

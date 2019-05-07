//
//  UINavigationController+SCBase.h
//  Pods
//
//  Created by Solo on 17/7/19.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (SCBase)

#pragma mark - Base
/**
 根据类名，移除导航栏ViewControllers栈区内指定的ViewController(依据ViewControllers栈区顺序查找, 单次移除)
 
 @param className 类名
 */
- (void)sc_removeViewControllerFromClassName:(NSString *)className;

/**
 根据类别，移除导航栏ViewControllers栈区内指定的ViewController(依据ViewControllers栈区顺序查找, 单次移除)
 
 @param aClass 类别
 */
- (void)sc_removeViewControllerFromClass:(Class)aClass;

/**
 根据类名集合，移除导航栏ViewControllers栈区所有对应的ViewController(无序查找, 多次移除)
 
 @param classNames 类名集合
 */
- (void)sc_removeViewControllersFromClassNames:(NSSet<NSString *> *)classNames;

/**
 根据类别集合，移除导航栏ViewControllers栈区所有对应的ViewController(无序查找, 多次移除)
 
 @param classes 类别集合
 */
- (void)sc_removeViewControllersFromClasses:(NSSet<Class> *)classes;

#pragma mark - Pop
/**
 根据类名，Pop到导航栏ViewControllers栈区内指定的ViewController(依据ViewControllers栈区顺序查找)
 
 @param className 类名
 @param animated  动画
 */
- (nullable NSArray<__kindof UIViewController *> *)sc_popToViewControllerFromClassName:(NSString *)className animated:(BOOL)animated;

/**
 根据类别，Pop到导航栏ViewControllers栈区内指定的ViewController(依据ViewControllers栈区顺序查找)
 
 @param aClass   类别
 @param animated 动画
 */
- (nullable NSArray<__kindof UIViewController *> *)sc_popToViewControllerFromClass:(Class)aClass animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

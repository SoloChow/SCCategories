//
//  UISwipeGestureRecognizer+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN const UISwipeGestureRecognizerDirection SCUISwipeGestureRecognizerDirectionHorizontal; ///< 水平轻扫方向(UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight)
UIKIT_EXTERN const UISwipeGestureRecognizerDirection SCUISwipeGestureRecognizerDirectionVertical;   ///< 垂直轻扫方向(UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown)

@interface UISwipeGestureRecognizer (SCBase)

#pragma mark - Base

/**
 根据轻扫方向, target和action, 创建轻扫手势响应者

 @param direction 轻扫方向
 @param target    target
 @param action    action
 @return 轻扫手势响应者
 */
+ (instancetype)sc_swipeGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction
                                                target:(id)target
                                                action:(SEL)action;

/**
 根据轻扫方向和回调事件, 创建轻扫手势响应者

 @param direction 轻扫方向
 @param block     手势回调事件
 @return 轻扫手势响应者
 */
+ (instancetype)sc_swipeGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction actionBlock:(void (^)(id sender))block;

/**
 根据轻扫方向, target和action, 初始化轻扫手势响应者

 @param direction 轻扫方向
 @param target    target
 @param action    action
 @return 轻扫手势响应者
 */
- (instancetype)initWithDirection:(UISwipeGestureRecognizerDirection)direction
                           target:(id)target
                           action:(SEL)action;

/**
 根据轻扫方向和回调事件, 创建轻扫手势响应者

 @param direction 轻扫方向
 @param block     手势回调事件
 @return 轻扫手势响应者
 */
- (instancetype)initWithDirection:(UISwipeGestureRecognizerDirection)direction actionBlock:(void (^)(id sender))block;

@end

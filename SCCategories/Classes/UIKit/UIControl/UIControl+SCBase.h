//
//  UIControl+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import <UIKit/UIKit.h>

@interface UIControl (SCBase)

#pragma mark - Base
/**
 根据指定的响应事件, 为控件添加或替换Target和Action

 @param target        target
 @param action        action
 @param controlEvents 响应事件
 */
- (void)sc_setTarget:(id)target
              action:(SEL)action
    forControlEvents:(UIControlEvents)controlEvents;

/**
 根据指定的响应事件, 为控件添加或替换回调事件(替代编辑)

 @param controlEvents 响应事件
 @param block         回调事件
 */
- (void)sc_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

/**
 根据指定的响应事件, 为控件添加回调事件(增量编辑)

 @param controlEvents 指定的响应事件
 @param block         回调事件
 */
- (void)sc_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

/**
 根据指定的响应事件, 移除控件所有的回调事件(通过sc_setBlockForControlEvents:block:或sc_addBlockForControlEvents:block:添加)

 @param controlEvents 指定的响应事件
 */
- (void)sc_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

/**
 移除控件所有响应事件的targets
 */
- (void)sc_removeAllTargets;

#pragma mark - Touch Up Inside
/**
 根据TouchUpInside响应事件, 为控件添加或替换Target和Action

 @param target target
 @param action action
 */
- (void)sc_setTarget:(id)target actionForTouchUpInsideControlEvent:(SEL)action;

/**
 根据TouchUpInside响应事件, 为控件添加Target和Action

 @param target target
 @param action action
 */
- (void)sc_addTarget:(id)target actionForTouchUpInsideControlEvent:(SEL)action;

/**
 根据TouchUpInside响应事件, 为控件移除Target和Action

 @param target target
 @param action action
 */
- (void)sc_removeTarget:(id)target actionForTouchUpInsideControlEvent:(SEL)action;

/**
 根据TouchUpInside响应事件, 为控件添加或替换回调事件(替代编辑)

 @param block 回调事件
 */
- (void)sc_setBlockForTouchUpInsideControlEvent:(void (^)(id sender))block;

/**
 根据TouchUpInside响应事件, 为控件添加回调事件(增量编辑)

 @param block 回调事件
 */
- (void)sc_addBlockForTouchUpInsideControlEvent:(void (^)(id sender))block;

/**
 *  根据TouchUpInside响应事件, 移除控件所有的回调事件(通过sc_setBlockForControlEvents:block:或sc_addBlockForControlEvents:block:添加)
 */
- (void)sc_removeAllBlocksForTouchUpInsideControlEvent;

@end

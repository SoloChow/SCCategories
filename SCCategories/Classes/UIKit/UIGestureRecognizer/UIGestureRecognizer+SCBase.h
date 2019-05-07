//
//  UIGestureRecognizer+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (SCBase)

#pragma mark - Base
/**
 创建一个包含回调事件的手势响应者

 @param block 手势回调事件
 @return 手势响应者
 */
+ (instancetype)sc_gestureRecognizerWithActionBlock:(void (^)(id sender))block;

/**
 初始化一个包含回调事件的手势响应者

 @param block 手势回调事件
 @return 手势响应者
 */
- (instancetype)initWithActionBlock:(void (^)(id sender))block;

/**
 为手势响应者添加回调事件

 @param block 手势回调事件
 */
- (void)sc_addActionBlock:(void (^)(id sender))block;

/**
 移除手势响应者的所有回调事件(通过sc_addActionBlock:添加)
 */
- (void)sc_removeAllActionBlocks;

@end

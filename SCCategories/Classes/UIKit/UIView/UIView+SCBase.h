//
//  UIView+SCBase.h
//  SCCategories
//
//  Created by Solo on 16/12/31.
//  Copyright © 2016年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SCBase)

#pragma mark - Base
/**
 View可见的Alpha值(综合考虑Subview及Window情况)
 */
@property (nonatomic, readonly) CGFloat sc_visibleAlpha;

/**
 View最顶部的SuperView(无则为self)
 */
@property (nonatomic, readonly) UIView *sc_topSuperView;

/**
 View所属的ViewController(或为nil)
 */
@property (nonatomic, readonly) UIViewController *sc_viewController;

/**
 将View移动到父View的最前面
 */
- (void)sc_bringToFront;

/**
 将View移动到父View的最后面
 */
- (void)sc_sendToBack;

/**
 移除View内指定的Subview(勿在view的drawRect:方法内调用此方法)

 @param subview 指定的Subview
 */
- (void)sc_removeSubview:(UIView *)subview;

/**
 移除所有Subviews(勿在view的drawRect:方法内调用此方法)
 */
- (void)sc_removeAllSubviews;

#pragma mark - Convert
/**
  将Point由Point所在视图转换到目标视图View或Window中

 @param point Point
 @param view 目标视图view或window
 @return 在目标视图view中或window的point
 */
- (CGPoint)sc_convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view;

/**
 将Point从Point所在View或Window中转换到当前视图中

 @param point Point
 @param view Point所在View或Window
 @return 在当前视图中的Point值
 */
- (CGPoint)sc_convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view;

/**
 将Rect由Rect所在视图转换到目标视图View或Window中

 @param rect Rect
 @param view 目标视图View或Window
 @return 在目标视图View中或Window的Rect
 */
- (CGRect)sc_convertRect:(CGRect)rect toViewOrWindow:(UIView *)view;

/**
 将Rect从Rect所在View或Window中转换到当前视图中

 @param rect Rect
 @param view Rect所在View或Window
 @return 在当前视图中的Rect值
 */
- (CGRect)sc_convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view;

@end

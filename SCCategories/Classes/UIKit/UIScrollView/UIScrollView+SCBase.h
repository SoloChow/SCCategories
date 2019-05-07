//
//  UIScrollView+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (SCBase)

#pragma mark - Base
/**
 滑动到顶部(默认动画)
 */
- (void)sc_scrollToTop;

/**
 滑动到底部(默认动画)
 */
- (void)sc_scrollToBottom;

/**
 滑动到左边(默认动画)
 */
- (void)sc_scrollToLeft;

/**
 滑动到右边(默认动画)
 */
- (void)sc_scrollToRight;

/**
 滑动到右边

 @param animated 动画
 */
- (void)sc_scrollToTop:(BOOL)animated;

/**
 滑动到底部

 @param animated 动画
 */
- (void)sc_scrollToBottom:(BOOL)animated;

/**
 滑动到左边

 @param animated 动画
 */
- (void)sc_scrollToLeft:(BOOL)animated;

/**
 滑动到右边

 @param animated 动画
 */
- (void)sc_scrollToRight:(BOOL)animated;

/**
 设置滑动偏移位置(类似setContentOffset:animated:, 避免重复调用)

 @param contentOffset 偏移位置
 @param animated      动画
 */
- (void)sc_setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;

@end

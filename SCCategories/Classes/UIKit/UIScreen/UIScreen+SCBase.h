//
//  UIScreen+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (SCBase)

#pragma mark - Base

/**
 [[UIScreen mainScreen] scale];
 */
+ (CGFloat)sc_currentScale;

/**
 ([[UIScreen mainScreen] nativeScale]);
 */
+ (CGFloat)sc_nativeScale;

/// 是否横竖屏(用户界面横屏了才会返回YES)
+ (BOOL)sc_isLandScape;

/// 是否放大模式（iPhone 6及以上的设备支持放大模式）
+ (BOOL)sc_isZoomedMode;

#pragma mark - 直接获取 [UIScreen mainScreen] 的下列参数
/// 屏幕宽度，会根据横竖屏的变化而变化
+ (CGFloat)sc_currentWidth;
/// 屏幕高度，会根据横竖屏的变化而变化
+ (CGFloat)sc_currentHeight;
/// 屏幕Size，会根据横竖屏的变化而变化
+ (CGSize)sc_currentSize;
/// 屏幕Bound，会根据横竖屏的变化而变化
+ (CGRect)sc_currentBounds;

#pragma mark - 直接获取 [UIScreen mainScreen] 且不受横竖屏的变化而变化
/// 屏幕宽度，跟横竖屏无关
+ (CGFloat)sc_deviceWidth;
/// 屏幕高度，跟横竖屏无关
+ (CGFloat)sc_deviceHeight;

#pragma mark - 基本的

/**
 获取屏幕当前的width(currentBounds.size.width, 屏幕旋转方向改变)
 
 @return 屏幕当前的width(currentBounds.size.width, 屏幕旋转方向改变)
 */
- (CGFloat)sc_currentWidth;

/**
 获取屏幕当前的height(currentBounds.size.height, 屏幕旋转方向改变)
 
 @return 屏幕当前的height(currentBounds.size.height, 屏幕旋转方向改变)
 */
- (CGFloat)sc_currentHeight;

/**
 获取屏幕当前的size(currentBounds.size, 屏幕旋转方向改变)
 
 @return 屏幕当前的size(currentBounds.size, 屏幕旋转方向改变)
 */
- (CGSize)sc_currentSize;

/**
 获取屏幕当前的bounds(屏幕旋转方向改变)
 
 @return 屏幕当前的bounds(屏幕旋转方向改变)
 */
- (CGRect)sc_currentBounds;

/**
 根据屏幕旋转方向, 获取屏幕当前的bounds([UIScreen mainScreen].bounds只返回竖屏的bounds)
 
 @param orientation 屏幕旋转方向
 @return 屏幕当前的bounds
 */
- (CGRect)sc_boundsForOrientation:(UIInterfaceOrientation)orientation;

#pragma mark - 系统固定值

/// 将屏幕分为普通和紧凑两种，这个方法用于判断普通屏幕
+ (BOOL)sc_isRegularScreen;

/// iPhone XS Max
+ (BOOL)sc_is65InchScreen;

/// iPhone XR
+ (BOOL)sc_is61InchScreen;

/// iPhone X/XS
+ (BOOL)sc_is58InchScreen;

/// iPhone 8 Plus
+ (BOOL)sc_is55InchScreen;

/// iPhone 8
+ (BOOL)sc_is47InchScreen;

/// iPhone 5
+ (BOOL)sc_is40InchScreen;

/// iPhone 4
+ (BOOL)sc_is35InchScreen;

+ (CGSize)sc_screenSizeFor65Inch;
+ (CGSize)sc_screenSizeFor61Inch;
+ (CGSize)sc_screenSizeFor58Inch;
+ (CGSize)sc_screenSizeFor55Inch;
+ (CGSize)sc_screenSizeFor47Inch;
+ (CGSize)sc_screenSizeFor40Inch;
+ (CGSize)sc_screenSizeFor35Inch;

/// 带物理凹槽的刘海屏或者使用 Home Indicator 类型的设备
+ (BOOL)sc_isNotchedScreen;

// 用于获取 isNotchedScreen 设备的 insets，注意对于 iPad Pro 11-inch 这种无刘海凹槽但却有使用 Home Indicator 的设备，它的 top 返回0，bottom 返回 safeAreaInsets.bottom 的值
+ (UIEdgeInsets)sc_safeAreaInsetsForDeviceWithNotch;

@end

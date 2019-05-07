//
//  UIApplication+SCNetworkActivityIndicator.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  状态栏网络请求提示器处理

#import <UIKit/UIKit.h>

@interface UIApplication (SCNetworkActivityIndicator)

/**
 增加活跃的网络请求数(若增加前为0, 将开启状态栏网络请求提示器动画. 该方法为线程安全, 应用扩展中无效)
 */
- (void)sc_incrementNetworkActivityCount;

/**
 减少活跃的网络请求数(若减少后为0, 将关闭状态栏网络请求提示器动画. 该方法为线程安全, 应用扩展中无效)
 */
- (void)sc_decrementNetworkActivityCount;

@end

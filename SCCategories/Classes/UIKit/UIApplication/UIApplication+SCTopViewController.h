//
//  UIApplication+SCTopViewController.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  获取当前应用顶层的ViewController

#import <UIKit/UIKit.h>

@interface UIApplication (SCTopViewController)
/**
 获取当前应用顶层的ViewController
 */
@property (nonatomic, strong, readonly) UIViewController *sc_topViewController;

@end

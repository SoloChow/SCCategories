//
//  UIView+SCNibView.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  NibView创建

#import <UIKit/UIKit.h>

@interface UIView (SCNibView)

/**
 根据Nib文件名(当前View类名)，创建对应的View(MainBundle, 或为nil)
 
 @return View
 */
+ (instancetype)sc_viewFromNib;

/**
 根据Nib文件名，创建对应的View(MainBundle, 或为nil)
 
 @param name Nib文件名
 @return View
 */
+ (instancetype)sc_viewFromNib:(NSString *)name;

@end

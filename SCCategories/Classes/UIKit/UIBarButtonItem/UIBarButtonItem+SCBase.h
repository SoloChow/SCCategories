//
//  UIBarButtonItem+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SCBase)

#pragma mark - Base
/**
 根据item图片, item风格, target和action, 创建BarButtonItem

 @param image  Item图片
 @param style  Item风格
 @param target Target
 @param action Action
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image
                                         style:(UIBarButtonItemStyle)style
                                        target:(id)target
                                        action:(SEL)action;

/**
 根据item图片, item风格, 回调事件, 创建BarButtonItem

 @param image       Item图片
 @param style       Item风格
 @param actionBlock 回调事件
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image
                                         style:(UIBarButtonItemStyle)style
                                   actionBlock:(void (^)(id sender))actionBlock;

/**
 根据item图片, item横屏图片, item风格, target和action, 创建BarButtonItem

 @param image               Item图片
 @param landscapeImagePhone Item横屏图片
 @param style               Item风格
 @param target              Target
 @param action              Action
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image
                           landscapeImagePhone:(UIImage *)landscapeImagePhone
                                         style:(UIBarButtonItemStyle)style
                                        target:(id)target
                                        action:(SEL)action;

/**
 根据item图片, item横屏图片, item风格, 回调事件, 创建BarButtonItem

 @param image               Item图片
 @param landscapeImagePhone Item横屏图片
 @param style               Item风格
 @param actionBlock         回调事件
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image
                           landscapeImagePhone:(UIImage *)landscapeImagePhone
                                         style:(UIBarButtonItemStyle)style
                                   actionBlock:(void (^)(id sender))actionBlock;

/**
 根据item图片, item高亮图片, target和action, 创建BarButtonItem

 @param image            Item图片
 @param highlightedImage Item高亮图片
 @param target           Target
 @param action           Action
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image
                              highlightedImage:(UIImage *)highlightedImage
                                        target:(id)target
                                        action:(SEL)action;

/**
 根据item图片, item高亮图片, 回调事件, 创建BarButtonItem

 @param image            Item图片
 @param highlightedImage Item高亮图片
 @param actionBlock      回调事件
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image
                              highlightedImage:(UIImage *)highlightedImage
                                   actionBlock:(void (^)(id sender))actionBlock;

/**
 根据item标题, item风格, target和action, 创建BarButtonItem

 @param title  Item标题
 @param style  Item风格
 @param target Target
 @param action Action
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithTitle:(NSString *)title
                                         style:(UIBarButtonItemStyle)style
                                        target:(id)target
                                        action:(SEL)action;

/**
 根据item标题, item风格, 回调事件, 创建BarButtonItem

 @param title       Item标题
 @param style       Item风格
 @param actionBlock 回调事件
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithTitle:(NSString *)title
                                         style:(UIBarButtonItemStyle)style
                                   actionBlock:(void (^)(id sender))actionBlock;

/**
 根据系统Item样式, target和action, 创建BarButtonItem

 @param systemItem 系统Item样式
 @param target     Target
 @param action     Action
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                                      target:(id)target
                                                      action:(SEL)action;

/**
 根据系统Item样式和回调事件, 创建BarButtonItem

 @param systemItem  系统Item样式
 @param actionBlock 回调事件
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem actionBlock:(void (^)(id sender))actionBlock;

/**
 根据自定义View, target和action, 创建BarButtonItem

 @param customView 自定义View
 @param target     Target
 @param action     Action
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithCustomView:(UIView *)customView
                                             target:(id)target
                                             action:(SEL)action;

/**
 根据自定义View和回调事件, 创建BarButtonItem

 @param customView  自定义View
 @param actionBlock 回调事件
 @return UIBarButtonItem对象
 */
+ (UIBarButtonItem *)sc_barButtonItemWithCustomView:(UIView *)customView actionBlock:(void (^)(id sender))actionBlock;

@end

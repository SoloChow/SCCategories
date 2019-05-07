//
//  UIButton+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/12.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (SCBase)

#pragma mark - Base
/**
 图片文字上下排列
 
 @param spacing 间距
 */
- (void)sc_verticalImageAndTitle:(CGFloat)spacing;


/**
 图片文字上下排列
 */
- (void)sc_verticalImageAndTitle;


/**
 左文字右图标排列
 
 @param spacing 间距
 */
- (void)sc_invertedImageAndTitle:(CGFloat)spacing;

/**
 左文字右图标排列,默认间距
 */
- (void)sc_invertedImageAndTitle;

@end

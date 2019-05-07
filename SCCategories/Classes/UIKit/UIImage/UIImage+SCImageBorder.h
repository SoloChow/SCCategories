//
//  UIImage+SCImageBorder.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片边框处理

#import <UIKit/UIKit.h>

@interface UIImage (SCImageBorder)

/**
 根据内边距和颜色, 设置图片边框(error -> nil)
 
 @param insets 内边距(正数->内距; 负数->外边)
 @param color 边框颜色
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByInsetEdge:(UIEdgeInsets)insets withColor:(UIColor *)color;

@end

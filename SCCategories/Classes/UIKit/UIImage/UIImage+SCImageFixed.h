//
//  UIImage+SCImageFixed.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片修复处理

#import <UIKit/UIKit.h>

@interface UIImage (SCImageFixed)

/**
 将图片调整为方向向上的图片
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByFixToOrientationUp;

@end

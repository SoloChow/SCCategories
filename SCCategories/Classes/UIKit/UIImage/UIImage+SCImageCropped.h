//
//  UIImage+SCImageCropped.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片裁切处理

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SCUIImageCropStyle) {  // 裁切类型
    SCUIImageCropStyleLeft = 0,                   // 左半部分
    SCUIImageCropStyleRight,                      // 右半部分
    SCUIImageCropStyleCenter,                     // 中间部分
    SCUIImageCropStyleTop,                        // 上半部分
    SCUIImageCropStyleBottom,                     // 下半部分
};

@interface UIImage (SCImageCropped)

/**
 将矩形图片裁切为正方形图片(单位为像素<Pixel>, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByCropToSquare;

/**
 根据裁切类型, 裁切图片(单位为像素<Pixel>, error -> nil)
 
 @param style 裁切类型
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByCropStyle:(SCUIImageCropStyle)style;

/**
 根据裁切后显示的范围, 裁切图片(单位为像素<Pixel>, error -> nil)
 
 @param rect 裁切后显示的范围
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByCropToRect:(CGRect)rect;

/**
 根据裁切后显示的范围, 裁切图片(单位可为像素<Pixel>或点<Dot>, error -> nil)
 
 @param rect  裁切后显示的范围
 @param scale 是否按屏幕分辨比放大(以像素<Pixel>或点<Dot>为单位)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByCropToRect:(CGRect)rect scale:(BOOL)scale;

@end

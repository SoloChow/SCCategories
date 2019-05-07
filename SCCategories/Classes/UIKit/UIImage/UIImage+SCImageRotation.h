//
//  UIImage+SCImageRotation.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  图片旋转/翻转处理

#import <UIKit/UIKit.h>

@interface UIImage (SCImageRotation)

/**
 根据旋转角度, 旋转图片(中心点旋转, error -> nil)
 
 @param degrees 旋转角度(⟲逆时针旋转)
 @param fitSize 调整尺寸(YES -> 新图片尺寸, 显示全部图片内容; NO -> 原图尺寸不变, 图片内容可能被裁切)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByDegrees:(CGFloat)degrees fitSize:(BOOL)fitSize;

/**
 根据旋转弧度, 旋转图片(中心点旋转, error -> nil)
 
 @param radians 旋转弧度(⟲逆时针旋转。角度弧度转换 -> degrees * M_PI / 180, 可用SCDegreesToRadians()方法转换)
 @param fitSize 调整尺寸(YES -> 新图片尺寸, 显示全部内容; NO -> 原图尺寸不变, 内容可能被裁切)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;

/**
 将图片⤺逆时针旋转90°(宽高替换, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRotateLeft90;

/**
 将图片⤼顺时针旋转90°(宽高替换, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRotateRight90;

/**
 将图片↻顺时针旋转180°(error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByRotate180;

/**
 垂直方向翻转图片(⥯, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByFlipVertical;

/**
 水平方向翻转图片(⇋, error -> nil)
 
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByFlipHorizontal;

@end

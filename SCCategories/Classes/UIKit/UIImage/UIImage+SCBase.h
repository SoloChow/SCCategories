//
//  UIImage+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (SCBase)

#pragma mark - Base
/**
 根据自定义绘制上下文和图片尺寸, 创建图片(error -> nil)

 @param size      图片尺寸
 @param drawBlock 自定义绘制上下文
 @return 新图片(error -> nil)
 */
+ (UIImage *)sc_imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock;

#pragma mark - Check
/**
 判断两个图片是否相等

 @param other 另一个图片
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToImage:(UIImage *)other;

/**
 图片是否包含Alpha通道

 @return 包含返回YES, 否则返回NO
 */
- (BOOL)sc_hasAlphaChannel;

#pragma mark - Modify
/**
 根据图片显示contentMode, 在指定的矩形rect内绘制图片(该方法依据图片设置, 在当前图形上下文内绘制图片。默认坐标系下, 图片以矩形左上为原点绘制。该方法可在当前图形上下文内任意变换)

 @param rect        指定的矩形rect
 @param contentMode 图片显示contentMode
 @param clips       是否裁切图片
 */
- (void)sc_drawInRect:(CGRect)rect
      withContentMode:(UIViewContentMode)contentMode
        clipsToBounds:(BOOL)clips;

/**
 根据指定宽度，等比例调整图片尺寸

 @param width 指定宽度
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByResizeToWidth:(CGFloat)width;

/**
 根据指定宽度及是否按屏幕分辨比放大，等比例调整图片尺寸

 @param width 指定宽度
 @param scale 是否按屏幕分辨比放大
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByResizeToWidth:(CGFloat)width sclae:(BOOL)scale;

/**
 根据图片新的尺寸, 调整图片(图片可能会被拉伸)

 @param size 图片的新尺寸(正数)
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByResizeToSize:(CGSize)size;

/**
 根据图片新的尺寸及是否按屏幕分辨比放大, 调整图片(图片可能会被拉伸)

 @param size  图片的新尺寸(正数)
 @param scale 是否按屏幕分辨比放大
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByResizeToSize:(CGSize)size scale:(BOOL)scale;

/**
 根据图片新的尺寸和contentMode, 调整图片(图片内容根据contentMode变化)

 @param size 图片的新尺寸(正数)
 @param contentMode 图片显示contentMode
 @return 新图片(error -> nil)
 */
- (UIImage *)sc_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

@end

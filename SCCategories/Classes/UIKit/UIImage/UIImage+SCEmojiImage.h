//
//  UIImage+SCEmojiImage.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  Emoji转为图片

#import <UIKit/UIKit.h>

@interface UIImage (SCEmojiImage)

/**
 根据苹果emoji表情, 创建一张正方形图片(图片缩放比例与屏幕scale一致, 原始AppleColorEmoji格式emoji图片的尺寸为160*160 px, error -> nil)
 
 @param emoji 单个emoji(😄)
 @param size  图片大小(单边)
 @return 新图片(error -> nil)
 */
+ (UIImage *)sc_imageWithEmoji:(NSString *)emoji size:(CGFloat)size;

@end

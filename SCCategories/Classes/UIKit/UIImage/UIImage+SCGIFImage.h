//
//  UIImage+SCGIFImage.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  GIF图片处理

#import <UIKit/UIKit.h>

@interface UIImage (SCGIFImage)

/**
 图片data是否为动态GIF图(data为GIF且图片帧数不小于1)
 
 @param data 图片data
 @return 是返回YES, 否则返回NO
 */
+ (BOOL)sc_isAnimatedGIFData:(NSData *)data;

/**
 指定路径下的文件是否为动态GIF图
 
 @param path 指定路径
 @return 是返回YES, 否则返回NO
 */
+ (BOOL)sc_isAnimatedGIFFile:(NSString *)path;

/**
 根据GIF的data, 图片缩放比例, 创建动态图片。(创建后, 可通过.images属性获取GIF图包含的所有图片。若data不是GIF图, 该方法使用类似于[UIImage imageWithData:data scale:scale]。通过该方法创建的GIF图效果更好, 同时占用的内存也更高<width * height * frames Bytes>, 适合创建小的GIF图<动态表情等>, error -> nil)
 
 @param data  GIF data
 @param scale 图片缩放比例
 @return 新图片(error -> nil)
 */
+ (UIImage *)sc_imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

@end

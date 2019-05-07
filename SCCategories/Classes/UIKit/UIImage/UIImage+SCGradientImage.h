//
//  UIImage+SCGradientImage.h
//  Pods
//
//  Created by Solo on 17/7/19.
//
//  渐变颜色图片

#import <UIKit/UIKit.h>

UIKIT_EXTERN const CGPoint SCUIImageGradientPointTop;        ///< 上{0.5, 0}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointBottom;     ///< 下{0.5, 1}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointLeft;       ///< 左{1, 0.5}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointRight;      ///< 右{0.5, 0}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointCenter;     ///< 中心{0.5, 0.5}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointUpperLeft;  ///< 左上角{0, 0}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointLowerLeft;  ///< 左下角{0, 1}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointUpperRight; ///< 右上角{1, 0}
UIKIT_EXTERN const CGPoint SCUIImageGradientPointLowerRight; ///< 右下角{1, 1}

@interface UIImage (SCGradientImage)

/**
 根据图片尺寸, 渐变起点, 渐变终点, 渐变颜色集及颜色分割点集, 创建线性渐变颜色图片(使用方式类似CAGradientLayer)

 @param size       图片尺寸
 @param startPoint 渐变起点[{0, 0}-{1, 1}]
 @param endPoint   渐变终点[{0, 0}-{1, 1}]
 @param colors     渐变颜色集
 @param locations  颜色分割点集(可选, nil则使用默认分割点集)
 @return 线性渐变颜色图片
 */
+ (UIImage *)sc_gradientColorImageWithSize:(CGSize)size
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint
                                    colors:(NSArray<UIColor *> *)colors
                                 locations:(NSArray<NSNumber *> *)locations;

@end

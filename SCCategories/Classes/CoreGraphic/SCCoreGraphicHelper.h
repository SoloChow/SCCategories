//
//  SCCoreGraphicHelper.h
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if defined(__LP64__) && __LP64__
# define SCCGFLOAT_EPSILON DBL_EPSILON
#else
# define SCCGFLOAT_EPSILON FLT_EPSILON
#endif

typedef NS_ENUM(NSInteger, SCCGPointQuadrant) { // 点相对矩形中心点所处的象限
    SCCGPointQuadrantOrigin = 0,
    SCCGPointQuadrantFirst,
    SCCGPointQuadrantSecond,
    SCCGPointQuadrantThird,
    SCCGPointQuadrantForth,
};

#pragma mark - Info
/**
 获取屏幕的Scale
 
 @return 屏幕的Scale
 */
CGFloat SCScreenScale(void);


/**
 获取屏幕的尺寸
 
 @return 屏幕的尺寸
 */
 CGSize SCScreenSize(void);

#pragma mark - Utilities
/**
 判断两个CGFloat值是否相等

 @param float1 float1
 @param float2 float2
 @return 相等返回YES, 否则返回NO
 */
NS_INLINE BOOL SCCGFloatEqualeToFloat(CGFloat float1, CGFloat float2) {
    return float1 == float2 || fabs(float1 - float2) < __FLT_EPSILON__;
}

/**
 将角度值转换为弧度值

 @param degrees 角度值
 @return 弧度值
 */
NS_INLINE CGFloat SCDegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

/**
 将弧度值转换为角度值

 @param radians 弧度值
 @return 角度值
 */
NS_INLINE CGFloat SCRadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}

/**
 反转UIEdgeInsets

 @param insets 原UIEdgeInsets
 @return 反转后的UIEdgeInsets
 */
NS_INLINE UIEdgeInsets SCUIEdgeInsetsInvert(UIEdgeInsets insets) {
    return UIEdgeInsetsMake(-insets.top, -insets.left, -insets.bottom, -insets.right);
}

/**
 获取矩形的中心点

 @param rect 矩形
 @return 矩形rect的中心点
 */
NS_INLINE CGPoint SCCGRectGetCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

/**
 获取矩形的面积

 @param rect 矩形
 @return 矩形的面积
 */
NS_INLINE CGFloat SCCGRectGetArea(CGRect rect) {
    if (CGRectIsNull(rect)) return 0;
    rect = CGRectStandardize(rect); // 根据一个矩形创建一个标准的矩形
    return rect.size.width * rect.size.height;
}

/**
 判断矩形是否为正方形

 @param rect 矩形
 @return 是返回YES, 否则返回NO
 */
NS_INLINE BOOL SCCGRectIsSquare(CGRect rect) {
    if (CGRectIsNull(rect)) return NO;
    if (CGRectIsEmpty(rect)) return NO;
    
    rect = CGRectStandardize(rect);
    return rect.size.width == rect.size.height;
}

/**
 获取矩形中间的正方形(无法获取, 返回CGRectZero)

 @param rect 矩形
 @return 正方形的矩形(无法获取, 返回CGRectZero)
 */
NS_INLINE CGRect SCCGRectGetCenterSquareRect(CGRect rect) {
    if (CGRectIsNull(rect)) return CGRectZero;
    if (CGRectIsEmpty(rect)) return CGRectZero;
    
    rect = CGRectStandardize(rect);
    CGFloat rectX = rect.origin.x, rectY = rect.origin.y, rectWidth = rect.size.width, rectHeight = rect.size.height;
    
    if (rectWidth > rectHeight) {
        rectX = (rectWidth - rectHeight)/2;
        rectWidth = rectHeight;
    } else if (rectWidth < rectHeight) {
        rectY = (rectHeight - rectWidth)/2;
        rectHeight = rectWidth;
    }
    
    return CGRectMake(rectX, rectY, rectWidth, rectHeight);
}

/**
 获取两点的直线距离

 @param point1 point1
 @param point2 point2
 @return 两点的直线距离
 */
NS_INLINE CGFloat SCCGPointGetDistanceToPoint(CGPoint point1, CGPoint point2) {
    return sqrt((point1.x - point2.x) * (point1.x - point2.x) + (point1.y - point2.y) * (point1.y - point2.y));
}

/**
 获取点到矩形的最小距离(垂直/水平)

 @param point 点
 @param rect 矩形
 @return 点到矩形的最小距离
 */
NS_INLINE CGFloat SCCGPointGetDistanceToRect(CGPoint point, CGRect rect) {
    rect = CGRectStandardize(rect);
    if (CGRectContainsPoint(rect, point)) return 0; //  Rect是否包含Point
    CGFloat distV, distH; // 垂直距离, 水平距离
    // Point in [rect.origin.y, rect.origin.y + rect.size.height]
    if (CGRectGetMinY(rect) <= point.y && point.y <= CGRectGetMaxY(rect)) {
        distV = 0;
    } else {
        distV = point.y < CGRectGetMinY(rect) ? CGRectGetMinY(rect) - point.y : point.y - CGRectGetMaxY(rect); // Rect上/下
    }
    
    // Point in [rect.origin.x, rect.origin.x + rect.size.width]
    if (CGRectGetMinX(rect) <= point.x && point.x <= CGRectGetMaxX(rect)) {
        distH = 0;
    } else {
        distH = point.x < CGRectGetMinX(rect) ? CGRectGetMinX(rect) - point.x : point.x - CGRectGetMaxX(rect); // Rect左/右
    }
    return MAX(distV, distH); // (0, 10) -> 10; (10, 20) -> 20
}

/**
 获取某点相对于矩形中心点所处的象限

 @param point 点
 @param rect 矩形
 @return 点相对于矩形中心点所处的象限
 */
NS_INLINE SCCGPointQuadrant SCCGPointQuadrantInRect(CGPoint point, CGRect rect) {
    CGPoint mid = SCCGRectGetCenter(rect);
    
    if (point.x > mid.x) {
        if (point.y < mid.y) return SCCGPointQuadrantFirst;
        if (point.y > mid.y) return SCCGPointQuadrantForth;
    }

    if (point.x < mid.x) {
        if (point.y < mid.y) return SCCGPointQuadrantSecond;
        if (point.y > mid.y) return SCCGPointQuadrantThird;
    }
    
    return SCCGPointQuadrantOrigin;
}

#pragma mark - Point & Pixel
/**
 将PT值转为像素值

 @param value PT值
 @return 像素值
 */
NS_INLINE CGFloat SCCGFloatToPixel(CGFloat value) {
    return value * SCScreenScale();
}

/**
 将像素值转为PT值

 @param value 像素值
 @return PT值
 */
NS_INLINE CGFloat SCCGFloatFromPixel(CGFloat value) {
    return value / SCScreenScale();
}

/**
 向下取整像素值对应的PT值(像素对齐)

 @param value 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGFloat SCCGFloatPixelFloor(CGFloat value) {
    CGFloat scale = SCScreenScale();
    return floor(value * scale) / scale;
}

/**
 四舍五入像素值对应的PT值(像素对齐)

 @param value 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGFloat SCCCGFloatPixelRound(CGFloat value) {
    CGFloat scale = SCScreenScale();
    return round(value * scale) / scale;
}

/**
 向上取整像素值对应的PT值(像素对齐)

 @param value 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGFloat SCCGFloatPixelCeil(CGFloat value) {
    CGFloat scale = SCScreenScale();
    return ceil(value * scale) / scale;
}

/**
 round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)

 @param value 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGFloat SCCCGFloatPixelHalf(CGFloat value) {
    CGFloat scale = SCScreenScale();
    return (floor(value * scale) + 0.5) / scale;
}


/**
 floor point value for pixel-aligned

 @param point CGPoint 像素值
 @return CGPoint PT值(像素对齐)
 */
NS_INLINE CGPoint SCCGPointPixelFloor(CGPoint point) {
    CGFloat scale = SCScreenScale();
    return CGPointMake(floor(point.x * scale) / scale,
                       floor(point.y * scale) / scale);
}

/**
 round point value for pixel-aligned

 @param point CGPoint 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGPoint SCCGPointPixelRound(CGPoint point) {
    CGFloat scale = SCScreenScale();
    return CGPointMake(round(point.x * scale) / scale,
                       round(point.y * scale) / scale);
}

/**
 ceil point value for pixel-aligned

 @param point CGPoint 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGPoint SCCGPointPixelCeil(CGPoint point) {
    CGFloat scale = SCScreenScale();
    return CGPointMake(ceil(point.x * scale) / scale,
                       ceil(point.y * scale) / scale);
}

/**
 round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)

 @param point CGPoint 像素值
 @return PT值(像素对齐)
 */
NS_INLINE CGPoint SCCGPointPixelHalf(CGPoint point) {
    CGFloat scale = SCScreenScale();
    return CGPointMake((floor(point.x * scale) + 0.5) / scale,
                       (floor(point.y * scale) + 0.5) / scale);
}

/// floor point value for pixel-aligned
NS_INLINE  CGSize SCCGSizePixelFloor(CGSize size) {
    CGFloat scale = SCScreenScale();
    return CGSizeMake(floor(size.width * scale) / scale,
                      floor(size.height * scale) / scale);
}

/**
 round point value for pixel-aligned

 @param size CGSize 像素值
 @return CGSize PT值(像素对齐)
 */
NS_INLINE  CGSize SCCGSizePixelRound(CGSize size) {
    CGFloat scale = SCScreenScale();
    return CGSizeMake(round(size.width * scale) / scale,
                      round(size.height * scale) / scale);
}

/**
 ceil point value for pixel-aligned

 @param size CGSize 像素值
 @return CGSize PT值(像素对齐)
 */
NS_INLINE  CGSize SCCGSizePixelCeil(CGSize size) {
    CGFloat scale = SCScreenScale();
    return CGSizeMake(ceil(size.width * scale) / scale,
                      ceil(size.height * scale) / scale);
}

/**
 round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)

 @param size CGSize 像素值
 @return CGSize PT值(像素对齐)
 */
NS_INLINE  CGSize SCCGSizePixelHalf(CGSize size) {
    CGFloat scale = SCScreenScale();
    return CGSizeMake((floor(size.width * scale) + 0.5) / scale,
                      (floor(size.height * scale) + 0.5) / scale);
}

/**
 floor point value for pixel-aligned

 @param rect CGRect 像素值
 @return CGRect PT值(像素对齐)
 */
NS_INLINE CGRect SCCGRectPixelFloor(CGRect rect) {
    CGPoint origin = SCCGPointPixelCeil(rect.origin);
    CGPoint corner = SCCGPointPixelFloor(CGPointMake(rect.origin.x + rect.size.width,
                                                   rect.origin.y + rect.size.height));
    CGRect ret = CGRectMake(origin.x, origin.y, corner.x - origin.x, corner.y - origin.y);
    if (ret.size.width < 0) ret.size.width = 0;
    if (ret.size.height < 0) ret.size.height = 0;
    return ret;
}

/**
 round point value for pixel-aligned

 @param rect CGRect 像素值
 @return CGRect PT值(像素对齐)
 */
NS_INLINE CGRect SCCGRectPixelRound(CGRect rect) {
    CGPoint origin = SCCGPointPixelRound(rect.origin);
    CGPoint corner = SCCGPointPixelRound(CGPointMake(rect.origin.x + rect.size.width,
                                                   rect.origin.y + rect.size.height));
    return CGRectMake(origin.x, origin.y, corner.x - origin.x, corner.y - origin.y);
}

/**
 ceil point value for pixel-aligned

 @param rect CGRect 像素值
 @return CGRect PT值(像素对齐)
 */
NS_INLINE CGRect SCCGRectPixelCeil(CGRect rect) {
    CGPoint origin = SCCGPointPixelFloor(rect.origin);
    CGPoint corner = SCCGPointPixelCeil(CGPointMake(rect.origin.x + rect.size.width,
                                                  rect.origin.y + rect.size.height));
    return CGRectMake(origin.x, origin.y, corner.x - origin.x, corner.y - origin.y);
}

/**
 round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)

 @param rect CGRect 像素值
 @return CGRect PT值(像素对齐)
 */
NS_INLINE CGRect SCCGRectPixelHalf(CGRect rect) {
    CGPoint origin = SCCGPointPixelHalf(rect.origin);
    CGPoint corner = SCCGPointPixelHalf(CGPointMake(rect.origin.x + rect.size.width,
                                                  rect.origin.y + rect.size.height));
    return CGRectMake(origin.x, origin.y, corner.x - origin.x, corner.y - origin.y);
}

/**
 floor UIEdgeInset for pixel-aligned

 @param insets UIEdgeInset 像素值
 @return UIEdgeInset PT值(像素对齐)
 */
NS_INLINE UIEdgeInsets SCUIEdgeInsetPixelFloor(UIEdgeInsets insets) {
    insets.top = SCCGFloatPixelFloor(insets.top);
    insets.left = SCCGFloatPixelFloor(insets.left);
    insets.bottom = SCCGFloatPixelFloor(insets.bottom);
    insets.right = SCCGFloatPixelFloor(insets.right);
    return insets;
}

/**
 ceil UIEdgeInset for pixel-aligned

 @param insets UIEdgeInset 像素值
 @return UIEdgeInset PT值(像素对齐)
 */
NS_INLINE UIEdgeInsets SCUIEdgeInsetPixelCeil(UIEdgeInsets insets) {
    insets.top = SCCGFloatPixelCeil(insets.top);
    insets.left = SCCGFloatPixelCeil(insets.left);
    insets.bottom = SCCGFloatPixelCeil(insets.bottom);
    insets.right = SCCGFloatPixelCeil(insets.right);
    return insets;
}

#pragma mark - UIViewContent
/**
 根据CALayer的gravity, 转化为与之对应的UIViewContentMode
 
 @param gravity layer的contentsGravity
 @return 对应的UIViewContentMode
 */
UIViewContentMode SCCAGravityToUIViewContentMode(NSString *gravity);

/**
 根据UIViewContentMode, 转化为与之对应的CALayer的gravity

 @param contentMode UIViewContentMode
 @return 对应的CALayer的contentsGravity
 */
NSString *SCUIViewContentModeToCAGravity(UIViewContentMode contentMode);

/**
 根据contentMode和内容尺寸, 调整并适配绘制Rect

 @param rect 绘制Rect
 @param size 内容尺寸
 @param mode contentMode(UIViewContentModeRedraw == UIViewContentModeScaleToFill)
 @return 调整后的Rect
 */
CGRect SCCGRectFitWithContentMode(CGRect rect, CGSize size, UIViewContentMode mode);

@interface SCCoreGraphicHelper : NSObject

@end

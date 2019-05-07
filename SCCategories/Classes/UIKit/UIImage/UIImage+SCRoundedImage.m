//
//  UIImage+SCRoundedImage.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIImage+SCRoundedImage.h"
#import "SCCoreGraphicHelper.h"

@implementation UIImage (SCRoundedImage)

- (UIImage *)sc_imageByCropToRound {
    if (self.size.width <= 0 || self.size.height <= 0) return nil;
    
    CGRect rect = SCCGRectGetCenterSquareRect(CGRectMake(0, 0, self.size.width, self.size.height));
    if (CGRectEqualToRect(rect, CGRectZero)) return nil;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.size.height-rect.origin.y);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path closePath];
    
    CGContextSaveGState(context);
    [path addClip];
    CGContextDrawImage(context, rect, self.CGImage);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)sc_imageByRoundCornerRadius:(CGFloat)radius {
    return [self sc_imageByRoundCornerRadius:radius borderWidth:0 borderColor:nil];
}

- (UIImage *)sc_imageByRoundCornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    return [self sc_imageByRoundCornerRadius:radius corners:UIRectCornerAllCorners borderWidth:borderWidth borderColor:borderColor borderLineJoin:kCGLineJoinMiter];
}

- (UIImage *)sc_imageByRoundCornerRadius:(CGFloat)radius corners:(UIRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor borderLineJoin:(CGLineJoin)borderLineJoin {
    /*   CGLineJoin
     kCGLineJoinMiter 接合点为尖角
     kCGLineJoinBevel 接合点为斜角
     kCGLineJoinRound 接合点为圆角
     */
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    CGFloat minSize = MIN(self.size.width, self.size.height);
    if (borderWidth < minSize / 2) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, borderWidth, borderWidth) byRoundingCorners:corners cornerRadii:CGSizeMake(radius, borderWidth)];
        [path closePath];
        
        CGContextSaveGState(context);
        [path addClip];
        CGContextDrawImage(context, rect, self.CGImage);
        CGContextRestoreGState(context);
    }
    
    if (borderColor && borderWidth < minSize / 2 && borderWidth > 0) {
        CGFloat strokeInset = (floor(borderWidth * self.scale) + 0.5) / self.scale;
        CGRect strokeRect = CGRectInset(rect, strokeInset, strokeInset);
        CGFloat strokeRadius = radius > self.scale / 2 ? radius - self.scale / 2 : 0;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeRect byRoundingCorners:corners cornerRadii:CGSizeMake(strokeRadius, borderWidth)];
        [path closePath];
        
        path.lineWidth = borderWidth;
        path.lineJoinStyle = borderLineJoin;
        [borderColor setStroke];
        [path stroke];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

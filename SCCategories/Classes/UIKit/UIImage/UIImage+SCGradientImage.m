//
//  UIImage+SCGradientImage.m
//  Pods
//
//  Created by Solo on 17/7/19.
//
//

#import "UIImage+SCGradientImage.h"

const CGPoint SCUIImageGradientPointTop        = {0.5, 0};
const CGPoint SCUIImageGradientPointBottom     = {0.5, 1};
const CGPoint SCUIImageGradientPointLeft       = {0, 0.5};
const CGPoint SCUIImageGradientPointRight      = {1, 0.5};
const CGPoint SCUIImageGradientPointCenter     = {0.5, 0.5};
const CGPoint SCUIImageGradientPointUpperLeft  = {0, 0};
const CGPoint SCUIImageGradientPointLowerLeft  = {0, 1};
const CGPoint SCUIImageGradientPointUpperRight = {1, 0};
const CGPoint SCUIImageGradientPointLowerRight = {1, 1};

@implementation UIImage (SCGradientImage)

+ (UIImage *)sc_gradientColorImageWithSize:(CGSize)size
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint
                                    colors:(NSArray<UIColor *> *)colors
                                 locations:(NSArray<NSNumber *> *)locations {
    NSMutableArray *colorsBuffer = @[].mutableCopy;
    for (UIColor *color in colors) {
        [colorsBuffer addObject:(__bridge id)color.CGColor];
    }
    
    CGFloat *locationsBuffer = NULL;
    if (locations) {
        NSUInteger length = locations.count;
        locationsBuffer = (CGFloat *)calloc(length, length * sizeof(CGFloat));
        for (int i = 0; i < locations.count; i++) {
            NSNumber *location = locations[i];
#if CGFLOAT_IS_DOUBLE
            locationsBuffer[i] = [location doubleValue];
#else
            locationsBuffer[i] = [location floatValue];
#endif
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colorsBuffer, locationsBuffer);
    
    CGPoint start = CGPointMake(size.width * startPoint.x, size.height * startPoint.y);
    CGPoint end = CGPointMake(size.width * endPoint.x, size.height * endPoint.y);
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    free(locationsBuffer);
    locationsBuffer = 0;
    return image;
}

@end

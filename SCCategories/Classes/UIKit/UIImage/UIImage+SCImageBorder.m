//
//  UIImage+SCImageBorder.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIImage+SCImageBorder.h"

@implementation UIImage (SCImageBorder)

- (UIImage *)sc_imageByInsetEdge:(UIEdgeInsets)insets withColor:(UIColor *)color {
    /*
     self.size = (100, 100)
     insets = (10, 10, 10, 10)
     size.width -= insets.left + insets.right; -> 80
     size.height -= insets.top + insets.bottom; -> 80
     
     CGRect rect = CGRectMake(-insets.left, -insets.top, self.size.width, self.size.height); -> rect = (-10, -10, 100, 100)
     
     CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height)); -> (0, 0, 80, 80)
     CGPathAddRect(path, NULL, rect); -> (-10, -10, 100, 100)
     */
    CGSize size = self.size;
    size.width -= insets.left + insets.right;
    size.height -= insets.top + insets.bottom;
    if (size.width <= 0 || size.height <= 0) return nil;
    
    CGRect rect = CGRectMake(-insets.left, -insets.top, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (color) {
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
        CGPathAddRect(path, NULL, rect);
        CGContextAddPath(context, path);
        CGContextEOFillPath(context);
        CGPathRelease(path);
    }
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

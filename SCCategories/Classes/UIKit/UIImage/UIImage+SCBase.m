//
//  UIImage+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import "UIImage+SCBase.h"
#import "SCCoreGraphicHelper.h"

@implementation UIImage (SCBase)

#pragma mark - Base
+ (UIImage *)sc_imageWithColor:(UIColor *)color {
    return [self sc_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)sc_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)sc_imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock {
    if (!drawBlock) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) return nil;
    drawBlock(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - Check
typedef union {
    uint32_t raw;
    unsigned char bytes[4];
    struct {
        char red;
        char green;
        char blue;
        char alpha;
    } __attribute__ ((packed)) pixels;
} SCComparePixel;

- (BOOL)_sc_compareWithImage:(UIImage *)image tolerance:(CGFloat)tolerance {
    /*
     https://github.com/facebook/ios-snapshot-test-case/blob/master/FBSnapshotTestCase/Categories/UIImage%2BCompare.m
     */
    if (!CGSizeEqualToSize(self.size, image.size)) return NO;
    
    CGSize referenceImageSize = CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));
    CGSize imageSize = CGSizeMake(CGImageGetWidth(image.CGImage), CGImageGetHeight(image.CGImage));
    
    // The images have the equal size, so we could use the smallest amount of bytes because of byte padding
    size_t minBytesPerRow = MIN(CGImageGetBytesPerRow(self.CGImage), CGImageGetBytesPerRow(image.CGImage));
    size_t referenceImageSizeBytes = referenceImageSize.height * minBytesPerRow;
    void *referenceImagePixels = calloc(1, referenceImageSizeBytes);
    void *imagePixels = calloc(1, referenceImageSizeBytes);
    
    if (!referenceImagePixels || !imagePixels) {
        free(referenceImagePixels);
        free(imagePixels);
        return NO;
    }
    
    CGContextRef referenceImageContext = CGBitmapContextCreate(referenceImagePixels,
                                                               referenceImageSize.width,
                                                               referenceImageSize.height,
                                                               CGImageGetBitsPerComponent(self.CGImage),
                                                               minBytesPerRow,
                                                               CGImageGetColorSpace(self.CGImage),
                                                               (CGBitmapInfo)kCGImageAlphaPremultipliedLast
                                                               );
    CGContextRef imageContext = CGBitmapContextCreate(imagePixels,
                                                      imageSize.width,
                                                      imageSize.height,
                                                      CGImageGetBitsPerComponent(image.CGImage),
                                                      minBytesPerRow,
                                                      CGImageGetColorSpace(image.CGImage),
                                                      (CGBitmapInfo)kCGImageAlphaPremultipliedLast
                                                      );
    
    if (!referenceImageContext || !imageContext) {
        CGContextRelease(referenceImageContext);
        CGContextRelease(imageContext);
        free(referenceImagePixels);
        free(imagePixels);
        return NO;
    }
    
    CGContextDrawImage(referenceImageContext, CGRectMake(0, 0, referenceImageSize.width, referenceImageSize.height), self.CGImage);
    CGContextDrawImage(imageContext, CGRectMake(0, 0, imageSize.width, imageSize.height), image.CGImage);
    
    CGContextRelease(referenceImageContext);
    CGContextRelease(imageContext);
    
    BOOL imageEqual = YES;
    
    // Do a fast compare if we can
    if (tolerance == 0) {
        imageEqual = (memcmp(referenceImagePixels, imagePixels, referenceImageSizeBytes) == 0);
    } else {
        // Go through each pixel in turn and see if it is different
        const NSInteger pixelCount = referenceImageSize.width * referenceImageSize.height;
        
        SCComparePixel *p1 = referenceImagePixels;
        SCComparePixel *p2 = imagePixels;
        
        NSInteger numDiffPixels = 0;
        for (int n = 0; n < pixelCount; ++n) {
            // If this pixel is different, increment the pixel diff count and see
            // if we have hit our limit.
            if (p1->raw != p2->raw) {
                numDiffPixels ++;
                
                CGFloat percent = (CGFloat)numDiffPixels / pixelCount;
                if (percent > tolerance) {
                    imageEqual = NO;
                    break;
                }
            }
            
            p1++;
            p2++;
        }
    }
    
    free(referenceImagePixels);
    free(imagePixels);
    
    return imageEqual;
}

- (BOOL)sc_isEqualToImage:(UIImage *)other {
    if (!other) return NO;
    if (![other isKindOfClass:[UIImage class]]) return NO;
    if (self == other) return YES;
    
    return [self _sc_compareWithImage:other tolerance:0];
}

- (BOOL)sc_hasAlphaChannel {
    if (self.CGImage == NULL) return NO;
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage) & kCGBitmapAlphaInfoMask;
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

#pragma mark - Modify
- (void)sc_drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips {
    CGRect drawRect = SCCGRectFitWithContentMode(rect, self.size, contentMode);
    if (drawRect.size.width == 0 || drawRect.size.height == 0) return;
    if (clips) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        if (context) {
            CGContextSaveGState(context);
            CGContextAddRect(context, rect);
            CGContextClip(context);
            [self drawInRect:drawRect];
            CGContextRestoreGState(context);
        }
    } else {
        [self drawInRect:drawRect];
    }
}

- (UIImage *)sc_imageByResizeToWidth:(CGFloat)width {
    return [self sc_imageByResizeToWidth:width sclae:YES];
}

- (UIImage *)sc_imageByResizeToWidth:(CGFloat)width sclae:(BOOL)scale {
    if (self.size.width <= 0 || self.size.height <= 0) return nil;
    CGFloat height = width * self.size.height / self.size.width;
    return [self sc_imageByResizeToSize:CGSizeMake(width, height) scale:scale];
}

- (UIImage *)sc_imageByResizeToSize:(CGSize)size {
    return [self sc_imageByResizeToSize:size scale:YES];
}

- (UIImage *)sc_imageByResizeToSize:(CGSize)size scale:(BOOL)scale {
    if (size.width <= 0 || size.height <= 0) return nil;
    CGFloat scaleFactor = scale ? self.scale : 1.0;
    UIGraphicsBeginImageContextWithOptions(size, NO, scaleFactor);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)sc_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self sc_drawInRect:CGRectMake(0, 0, size.width, size.height) withContentMode:contentMode clipsToBounds:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

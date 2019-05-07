//
//  UIImage+SCImageCropped.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIImage+SCImageCropped.h"

@implementation UIImage (SCImageCropped)

- (UIImage *)sc_imageByCropToSquare {
    if (self.size.width <= 0 || self.size.height <= 0) return nil;
    
    return [self sc_imageByCropStyle:SCUIImageCropStyleCenter];
}

- (UIImage *)sc_imageByCropStyle:(SCUIImageCropStyle)style {
    CGFloat cropX = 0, cropY = 0, cropWidth = self.size.width, cropHeight = self.size.height;
    
    if (style == SCUIImageCropStyleLeft) {
        cropWidth /= 2;
    } else if (style == SCUIImageCropStyleRight) {
        cropWidth /= 2;
        cropX = cropWidth;
    } else if (style == SCUIImageCropStyleCenter) {
        if (cropWidth > cropHeight) {
            cropX = (cropWidth - cropHeight)/2;
            cropWidth = cropHeight;
        } else if (cropWidth < cropHeight) {
            cropY = (cropHeight - cropWidth)/2;
            cropHeight = cropWidth;
        }
    } else if (style == SCUIImageCropStyleTop) {
        cropHeight /= 2;
    } else if (style == SCUIImageCropStyleBottom) {
        cropHeight /= 2;
        cropY = cropHeight;
    }
    
    return [self sc_imageByCropToRect:CGRectMake(cropX, cropY, cropWidth, cropHeight)];
}

- (UIImage *)sc_imageByCropToRect:(CGRect)rect
{
    return [self sc_imageByCropToRect:rect scale:YES];
}

- (UIImage *)sc_imageByCropToRect:(CGRect)rect scale:(BOOL)scale
{
    CGFloat scaleFactor = 1.f;
    if (scale) {
        scaleFactor = self.scale;
        rect.origin.x *= scaleFactor; // Point -> Px
        rect.origin.y *= scaleFactor;
        rect.size.width *= scaleFactor;
        rect.size.height *= scaleFactor;
    }
    if (rect.size.width <= 0 || rect.size.height <= 0) return nil;
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:scaleFactor orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return image;
}

@end

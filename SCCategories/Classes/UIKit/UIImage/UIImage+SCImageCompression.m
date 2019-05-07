//
//  UIImage+SCImageCompression.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIImage+SCImageCompression.h"
#import "UIImage+SCBase.h"

@implementation UIImage (SCImageCompression)

#pragma mark - Compress
NS_INLINE CGFloat SCClampCompressionFactor(CGFloat factor) {
    return factor < 1e-10 ? 1e-10 : factor > 0.1 ? 0.1 : factor;
}

- (NSData *)sc_compressToPNGFormatData {
    return UIImagePNGRepresentation(self);
}

- (NSData *)sc_compressToJPEGFormatDataWithFactor:(CGFloat)factor maxFileSize:(u_int64_t)fileSize {
    if (fileSize <= 0) return nil;
    
    NSData *tempImageData = UIImageJPEGRepresentation(self, 1.0);
    if ([tempImageData length] <= fileSize) return tempImageData;
    
    tempImageData = UIImageJPEGRepresentation(self, 0);
    if ([tempImageData length] > fileSize) return nil;
    if ([tempImageData length] == fileSize) return tempImageData;
    
    NSData *targetImageData = nil;
    CGFloat compressionFactor = SCClampCompressionFactor(factor);
    CGFloat minFactor = compressionFactor;
    CGFloat maxFactor = 1.0 - compressionFactor;
    CGFloat midFactor = 0;
    // binary search
    while (fabs(maxFactor-minFactor) > compressionFactor) {
        @autoreleasepool {
            midFactor = minFactor + (maxFactor - minFactor)/2;
            tempImageData = UIImageJPEGRepresentation(self, midFactor);
            
            if ([tempImageData length] > fileSize) {
                maxFactor = midFactor;
            } else {
                minFactor = midFactor;
                targetImageData = tempImageData;
            }
        }
    }
    
    return targetImageData;
}

- (NSData *)sc_resetImageDataWithImageWidth:(CGFloat)width maxFileSize:(uint64_t)maxFileSize {
    UIImage *image = [self sc_imageByResizeToWidth:width];
    return [image sc_compressToJPEGFormatDataWithFactor:1e-10 maxFileSize:maxFileSize];
}

- (NSData *)sc_resetImageDataWithImageSize:(CGSize)size maxFileSize:(uint64_t)maxFileSize {
    UIImage *image = [self sc_imageByResizeToSize:size];
    return [image sc_compressToJPEGFormatDataWithFactor:1e-10 maxFileSize:maxFileSize];
}

@end

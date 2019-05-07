//
//  CALayer+SCSnapshot.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "CALayer+SCSnapshot.h"
#import <UIKit/UIKit.h>

@implementation CALayer (SCSnapshot)

#pragma mark - Snapshot
- (UIImage *)sc_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

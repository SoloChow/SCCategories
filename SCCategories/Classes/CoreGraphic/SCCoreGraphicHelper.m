//
//  SCCoreGraphicHelper.m
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "SCCoreGraphicHelper.h"

#pragma mark - Info
CGFloat SCScreenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

 CGSize SCScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

#pragma mark - UIViewContent
UIViewContentMode SCCAGravityToUIViewContentMode(NSString *gravity) {
    static NSDictionary *dict;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{ kCAGravityCenter:@(UIViewContentModeCenter),
                 kCAGravityTop:@(UIViewContentModeTop),
                 kCAGravityBottom:@(UIViewContentModeBottom),
                 kCAGravityLeft:@(UIViewContentModeLeft),
                 kCAGravityRight:@(UIViewContentModeRight),
                 kCAGravityTopLeft:@(UIViewContentModeTopLeft),
                 kCAGravityTopRight:@(UIViewContentModeTopRight),
                 kCAGravityBottomLeft:@(UIViewContentModeBottomLeft),
                 kCAGravityBottomRight:@(UIViewContentModeBottomRight),
                 kCAGravityResize:@(UIViewContentModeScaleToFill),
                 kCAGravityResizeAspect:@(UIViewContentModeScaleAspectFit),
                 kCAGravityResizeAspectFill:@(UIViewContentModeScaleAspectFill) };
    });
    if (!gravity) return UIViewContentModeScaleToFill;
    return (UIViewContentMode)((NSNumber *)dict[gravity]).integerValue;
}

NSString *SCUIViewContentModeToCAGravity(UIViewContentMode contentMode) {
    switch (contentMode)
    {
        case UIViewContentModeScaleToFill: return kCAGravityResize;
        case UIViewContentModeScaleAspectFit: return kCAGravityResizeAspect;
        case UIViewContentModeScaleAspectFill: return kCAGravityResizeAspectFill;
        case UIViewContentModeRedraw: return kCAGravityResize;
        case UIViewContentModeCenter: return kCAGravityCenter;
        case UIViewContentModeTop: return kCAGravityTop;
        case UIViewContentModeBottom: return kCAGravityBottom;
        case UIViewContentModeLeft: return kCAGravityLeft;
        case UIViewContentModeRight: return kCAGravityRight;
        case UIViewContentModeTopLeft: return kCAGravityTopLeft;
        case UIViewContentModeTopRight: return kCAGravityTopRight;
        case UIViewContentModeBottomLeft: return kCAGravityBottomLeft;
        case UIViewContentModeBottomRight: return kCAGravityBottomRight;
        default: return kCAGravityResize;
    }
}

CGRect SCCGRectFitWithContentMode(CGRect rect, CGSize size, UIViewContentMode mode)
{
    rect = CGRectStandardize(rect);
    size.width = size.width < 0 ? -size.width : size.width;
    size.height = size.height < 0 ? -size.height : size.height;
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    switch (mode) {
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill:
        {
            if (rect.size.width < 0.01 || rect.size.height < 0.01 ||
                size.width < 0.01 || size.height < 0.01) {
                rect.origin = center;
                rect.size = CGSizeZero;
            } else {
                CGFloat scale;
                if (mode == UIViewContentModeScaleAspectFit) {
                    if (size.width / size.height < rect.size.width / rect.size.height) {
                        scale = rect.size.height / size.height;
                    } else {
                        scale = rect.size.width / size.width;
                    }
                } else {
                    if (size.width / size.height < rect.size.width / rect.size.height) {
                        scale = rect.size.width / size.width;
                    } else {
                        scale = rect.size.height / size.height;
                    }
                }
                size.width *= scale;
                size.height *= scale;
                rect.size = size;
                rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
            }
        }
            break;
        case UIViewContentModeCenter:
        {
            rect.size = size;
            rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
        }
            break;
        case UIViewContentModeTop:
        {
            rect.origin.x = center.x - size.width * 0.5;
            rect.size = size;
        }
            break;
        case UIViewContentModeBottom:
        {
            rect.origin.x = center.x - size.width * 0.5;
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        }
            break;
        case UIViewContentModeLeft:
        {
            rect.origin.y = center.y - size.height * 0.5;
            rect.size = size;
        }
            break;
        case UIViewContentModeRight:
        {
            rect.origin.y = center.y - size.height * 0.5;
            rect.origin.x += rect.size.width - size.width;
            rect.size = size;
        }
            break;
        case UIViewContentModeTopLeft:
        {
            rect.size = size;
        }
            break;
        case UIViewContentModeTopRight:
        {
            rect.origin.x += rect.size.width - size.width;
            rect.size = size;
        }
            break;
        case UIViewContentModeBottomLeft:
        {
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        }
            break;
        case UIViewContentModeBottomRight:
        {
            rect.origin.x += rect.size.width - size.width;
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        }
            break;
        case UIViewContentModeScaleToFill:
        case UIViewContentModeRedraw:
        default:
        {
            rect = rect;
        }
    }
    return rect;
}

@implementation SCCoreGraphicHelper

@end

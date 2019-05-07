//
//  UIScreen+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "UIScreen+SCBase.h"
#import "UIDevice+SCBase.h"

@implementation UIScreen (SCBase)
#pragma mark - Base

+ (CGFloat)sc_currentScale {
    static CGFloat screenScale = 0.0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([NSThread isMainThread]) {
            screenScale = [[UIScreen mainScreen] scale];
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                screenScale = [[UIScreen mainScreen] scale];
            });
        }
    });
    return screenScale;
}

+ (CGFloat)sc_nativeScale {
    return ([[UIScreen mainScreen] nativeScale]);
}

+ (BOOL)sc_isLandScape {
    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}

+ (BOOL)sc_isZoomedMode {
    return ([[UIScreen mainScreen] respondsToSelector:@selector(nativeScale)] ? ([self sc_nativeScale] > [self sc_currentScale]) : NO);
}

#pragma mark - 直接获取 [UIScreen mainScreen] 的下列参数
+ (CGFloat)sc_currentWidth {
    return [[UIScreen mainScreen] sc_currentWidth];
}

+ (CGFloat)sc_currentHeight {
    return [[UIScreen mainScreen] sc_currentHeight];
}

+ (CGSize)sc_currentSize {
    return [[UIScreen mainScreen] sc_currentSize];
}

+ (CGRect)sc_currentBounds {
    return [[UIScreen mainScreen] sc_currentBounds];
}

#pragma mark - 直接获取 [UIScreen mainScreen] 且不受横竖屏的变化而变化
+ (CGFloat)sc_deviceWidth {
    if ([self sc_isLandScape]) {
        return [[UIScreen mainScreen] sc_currentHeight];
    } else {
        return [[UIScreen mainScreen] sc_currentWidth];
    }
}

+ (CGFloat)sc_deviceHeight {
    if ([self sc_isLandScape]) {
        return [[UIScreen mainScreen] sc_currentWidth];
    } else {
        return [[UIScreen mainScreen] sc_currentHeight];
    }
}

#pragma mark - 基本的

- (CGFloat)sc_currentWidth {
    return [self sc_currentBounds].size.width;
}

- (CGFloat)sc_currentHeight {
    return [self sc_currentBounds].size.height;
}

- (CGSize)sc_currentSize {
    return [self sc_currentBounds].size;
}

- (CGRect)sc_currentBounds {
    return [self sc_boundsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (CGRect)sc_boundsForOrientation:(UIInterfaceOrientation)orientation {
    CGRect bounds = [self bounds];
    // 横屏
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        CGFloat buffer = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = buffer;
    }
    return bounds;
}

#pragma mark - 系统固定值

+ (BOOL)sc_isRegularScreen {
    return [UIDevice sc_isIPad] || (![UIScreen sc_isZoomedMode] && ([self sc_is65InchScreen] || [self sc_is61InchScreen] || [self sc_is55InchScreen]));
}

static NSInteger is65InchScreen = -1;
+ (BOOL)sc_is65InchScreen {
    if (is65InchScreen < 0) {
        // Since iPhone XS Max and iPhone XR share the same resolution, we have to distinguish them using the model identifiers
        // 由于 iPhone XS Max 和 iPhone XR 的屏幕宽高是一致的，我们通过机器 Identifier 加以区别
        is65InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor65Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor65Inch.height && ([[UIDevice sc_deviceModel] isEqualToString:@"iPhone11,4"] || [[UIDevice sc_deviceModel] isEqualToString:@"iPhone11,6"])) ? 1 : 0;
    }
    return is65InchScreen > 0;
}

static NSInteger is61InchScreen = -1;
+ (BOOL)sc_is61InchScreen {
    if (is61InchScreen < 0) {
        is61InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor61Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor61Inch.height && [[UIDevice sc_deviceModel] isEqualToString:@"iPhone11,8"]) ? 1 : 0;
    }
    return is61InchScreen > 0;
}

static NSInteger is58InchScreen = -1;
+ (BOOL)sc_is58InchScreen {
    if (is58InchScreen < 0) {
        // Both iPhone XS and iPhone X share the same actual screen sizes, so no need to compare identifiers
        // iPhone XS 和 iPhone X 的物理尺寸是一致的，因此无需比较机器 Identifier
        is58InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor58Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor58Inch.height) ? 1 : 0;
    }
    return is58InchScreen > 0;
}

static NSInteger is55InchScreen = -1;
+ (BOOL)sc_is55InchScreen {
    if (is55InchScreen < 0) {
        is55InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor55Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor55Inch.height) ? 1 : 0;
    }
    return is55InchScreen > 0;
}

static NSInteger is47InchScreen = -1;
+ (BOOL)sc_is47InchScreen {
    if (is47InchScreen < 0) {
        is47InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor47Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor47Inch.height) ? 1 : 0;
    }
    return is47InchScreen > 0;
}

static NSInteger is40InchScreen = -1;
+ (BOOL)sc_is40InchScreen {
    if (is40InchScreen < 0) {
        is40InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor40Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor40Inch.height) ? 1 : 0;
    }
    return is40InchScreen > 0;
}

static NSInteger is35InchScreen = -1;
+ (BOOL)sc_is35InchScreen {
    if (is35InchScreen < 0) {
        is35InchScreen = ([UIScreen sc_deviceWidth] == self.sc_screenSizeFor35Inch.width && [UIScreen sc_deviceHeight] == self.sc_screenSizeFor35Inch.height) ? 1 : 0;
    }
    return is35InchScreen > 0;
}

+ (CGSize)sc_screenSizeFor65Inch {
    return CGSizeMake(414, 896);
}

+ (CGSize)sc_screenSizeFor61Inch {
    return CGSizeMake(414, 896);
}

+ (CGSize)sc_screenSizeFor58Inch {
    return CGSizeMake(375, 812);
}

+ (CGSize)sc_screenSizeFor55Inch {
    return CGSizeMake(414, 736);
}

+ (CGSize)sc_screenSizeFor47Inch {
    return CGSizeMake(375, 667);
}

+ (CGSize)sc_screenSizeFor40Inch {
    return CGSizeMake(320, 568);
}

+ (CGSize)sc_screenSizeFor35Inch {
    return CGSizeMake(320, 480);
}

static NSInteger isNotchedScreen = -1;
+ (BOOL)sc_isNotchedScreen {
    if (@available(iOS 11, *)) {
        if (isNotchedScreen < 0) {
            // iOS 12，只要 init 完 window，window 的尺寸就已经被设定为当前 App 的大小了，所以可以通过是否有 safeAreaInsets 来动态判断。
            // 但 iOS 11 及以前无法通过这个方式动态判断，所以只能依靠物理设备的判断方式
            if (@available(iOS 12, *)) {
                UIWindow *window = [[UIWindow alloc] init];
                isNotchedScreen = window.safeAreaInsets.bottom > 0 ? 1 : 0;
            } else {
                isNotchedScreen = [UIScreen sc_is58InchScreen] ? 1 : 0;
            }
        }
    } else {
        isNotchedScreen = 0;
    }
    
    return isNotchedScreen > 0;
}

+ (UIEdgeInsets)sc_safeAreaInsetsForDeviceWithNotch {
    if (![self sc_isNotchedScreen]) {
        return UIEdgeInsetsZero;
    }
    
    if ([UIDevice sc_isIPad]) {
        return UIEdgeInsetsMake(20, 0, 20, 0);
    }
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            return UIEdgeInsetsMake(44, 0, 34, 0);
            
        case UIInterfaceOrientationPortraitUpsideDown:
            return UIEdgeInsetsMake(34, 0, 44, 0);
            
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            return UIEdgeInsetsMake(0, 44, 21, 44);
            
        case UIInterfaceOrientationUnknown:
        default:
            return UIEdgeInsetsMake(44, 0, 34, 0);
    }
}

@end

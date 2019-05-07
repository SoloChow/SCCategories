//
//  SCUIMarco.h
//  SCUIKit
//
//  Created by Solo on 2018/8/21.
//  Copyright © 2019年 SC. All rights reserved.
//  通用的UI定义

#ifndef SCUIMarco_h
#define SCUIMarco_h

#import <SCCategories/UIDevice+SCBase.h>
#import <SCCategories/UIScreen+SCBase.h>
#import <SCCategories/UIColor+SCBase.h>
#import <SCCategories/UIImage+SCGradientImage.h>

#pragma mark - 变量-设备相关

/// 屏幕宽度，会根据横竖屏的变化而变化
#define SCREEN_WIDTH [UIScreen sc_currentWidth]
/// 屏幕高度，会根据横竖屏的变化而变化
#define SCREEN_HEIGHT [UIScreen sc_currentHeight]
/// 屏幕宽度，跟横竖屏无关
#define DEVICE_WIDTH [UIScreen sc_deviceWidth]
/// 屏幕高度，跟横竖屏无关
#define DEVICE_HEIGHT [UIScreen sc_deviceHeight]

/// 设备类型
#define IS_IPAD [UIDevice sc_isIPad]
#define IS_IPOD [UIDevice sc_isIPod]
#define IS_IPHSCE [UIDevice sc_isIPhone]
#define IS_SIMULATOR [UIDevice sc_isSimulator]

/// 操作系统版本号，只获取第二级的版本号，例如 10.3.1 只会得到 10.3
#define IOS_VERSISC ([[[UIDevice currentDevice] systemVersion] doubleValue])

/// 是否横竖屏
/// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE [UIScreen sc_isLandScape]
/// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

/// 是否全面屏设备
#define IS_NOTCHED_SCREEN [UIScreen sc_isNotchedScreen]
/// iPhone XS Max
#define IS_65INCH_SCREEN [UIScreen sc_is65InchScreen]
/// iPhone XR
#define IS_61INCH_SCREEN [UIScreen sc_is61InchScreen]
/// iPhone X/XS
#define IS_58INCH_SCREEN [UIScreen sc_is58InchScreen]
/// iPhone 6/7/8 Plus
#define IS_55INCH_SCREEN [UIScreen sc_is55InchScreen]
/// iPhone 6/7/8
#define IS_47INCH_SCREEN [UIScreen sc_is47InchScreen]
/// iPhone 5/5S/SE
#define IS_40INCH_SCREEN [UIScreen sc_is40InchScreen]
/// iPhone 4/4S
#define IS_35INCH_SCREEN [UIScreen sc_is35InchScreen]
/// iPhone 4/4S/5/5S/SE
#define IS_320WIDTH_SCREEN (IS_35INCH_SCREEN || IS_40INCH_SCREEN)

/// 是否Retina
#define IS_RETINASCREEN ([[UIScreen mainScreen] scale] >= 2.0)

/// 是否放大模式（iPhone 6及以上的设备支持放大模式）
#define IS_ZOOMEDMODE [UIScreen sc_isZoomedMode]

#pragma mark - 变量-布局相关

/// toolBar相关frame
#define ToolBarHeight (IS_IPAD ? (IS_NOTCHED_SCREEN ? 65 : 50) : (IS_LANDSCAPE ? PreferredValueForVisualDevice(44, 32) : 44) + PreferredValueForNotchedDevice(39, 0))

/// tabBar相关frame
#define TabBarHeight (IS_IPAD ? (IS_NOTCHED_SCREEN ? 65 : 50) : PreferredValueForNotchedDevice(IS_LANDSCAPE ? 32 : 49, 49) + SafeAreaInsetsConstantForDeviceWithNotch.bottom)

/// 状态栏高度(来电等情况下，状态栏高度会发生变化，所以应该实时计算)
#define StatusBarHeight ([UIApplication sharedApplication].statusBarHidden ? 0 : [[UIApplication sharedApplication] statusBarFrame].size.height)

/// 状态栏高度(如果状态栏不可见，也会返回一个普通状态下可见的高度)
#define StatusBarHeightConstant ([UIApplication sharedApplication].statusBarHidden ? (IS_IPAD ? (IS_NOTCHED_SCREEN ? 24 : 20) : PreferredValueForNotchedDevice(IS_LANDSCAPE ? 0 : 44, 20)) : [[UIApplication sharedApplication] statusBarFrame].size.height)

/// navigationBar 的静态高度
#define NavigationBarHeight (IS_LANDSCAPE ? PreferredValueForVisualDevice(44, 32) : 44)

/// 代表(导航栏+状态栏)，这里用于获取其高度
/// @warn 如果是用于 viewController，请使用 UIViewController(QMUI) qmui_navigationBarMaxYInViewCoordinator 代替
#define NavigationContentTop (StatusBarHeight + NavigationBarHeight)

/// 同上，这里用于获取它的静态常量值
#define NavigationContentTopConstant (StatusBarHeightConstant + NavigationBarHeight)

/// iPhoneX 系列全面屏手机的安全区域的静态值
#define SafeAreaInsetsConstantForDeviceWithNotch [UIScreen sc_safeAreaInsetsForDeviceWithNotch]

/// iPhoneX 系列 底部安全高度
#define kSafeBottomHeight (IS_NOTCHED_SCREEN ? 34.f : 0.f)

#pragma mark - 方法-创建器

#define CGSizeMax CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)

#define UIImageMake(img) [UIImage imageNamed:img]

/// 使用文件名(不带后缀名，仅限png)创建一个UIImage对象，不会被系统缓存，用于不被复用的图片，特别是大图
#define UIImageMakeWithFile(name) UIImageMakeWithFileAndSuffix(name, @"png")
#define UIImageMakeWithFileAndSuffix(name, suffix) [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", [[NSBundle mainBundle] resourcePath], name, suffix]]

/// 字体相关的宏，用于快速创建一个字体对象，更多创建宏可查看 UIFont+QMUI.h
#define UIFontMake(size) [UIFont systemFontOfSize:size]
#define UIFontItalicMake(size) [UIFont italicSystemFontOfSize:size] /// 斜体只对数字和字母有效，中文无效
#define UIFontBoldMake(size) [UIFont boldSystemFontOfSize:size]

// UIColor 相关的宏，用于快速创建一个 UIColor 对象，更多创建的宏可查看 UIColor+QMUI.h
#define UIColorMake(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorMakeWithRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]
#define UIColorHexMake(hex) [UIColor sc_colorWithRGB:hex]
#define UIColorHexAMake(hex,a) [UIColor sc_colorWithRGB:hex alpha:a]

// 用两个Color生成一张左右对称的渐变色图片
#define UIImageGradientMake(color1,color2) [UIImage sc_gradientColorImageWithSize:CGSizeMake(1, 1) startPoint:SCUIImageGradientPointLeft endPoint:SCUIImageGradientPointRight colors:@[color1,color2] locations:nil]

#endif /* SCUIMarco_h */

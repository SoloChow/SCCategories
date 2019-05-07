//
//  UIApplication+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (SCBase)

#pragma mark - Base
@property (nonatomic, readonly) NSString *sc_appBundleName;        ///< 获取应用的包名(展示在iDevice<SpringBoard>中)
@property (nonatomic, readonly) NSString *sc_appBundleDisplayName; ///< 获取应用的本地化包名
@property (nonatomic, readonly) NSString *sc_appBundleID;          ///< 获取应用的Bundle ID(com.xxx.yyy)
@property (nonatomic, readonly) NSString *sc_appVersion;           ///< 获取应用的版本(1.2.0)
@property (nonatomic, readonly) NSString *sc_appBuildVersion;      ///< 获取应用的构建版本(123)

@property (nonatomic, readonly) NSURL *sc_documentsURL;       ///< 获取应用沙盒内Documents文件夹的URL
@property (nonatomic, readonly) NSString *sc_documentsPath;   ///< 获取应用沙盒内Documents文件夹的路径
@property (nonatomic, readonly) NSURL *sc_cachesURL;          ///< 获取应用沙盒内Caches文件夹的URL
@property (nonatomic, readonly) NSString *sc_cachesPath;      ///< 获取应用沙盒内Caches文件夹的路径
@property (nonatomic, readonly) NSURL *sc_libraryURL;         ///< 获取应用沙盒内Library文件夹的URL
@property (nonatomic, readonly) NSString *sc_libraryPath;     ///< 获取应用沙盒内Library文件夹的路径
@property (nonatomic, readonly) NSURL *sc_temporaryURL;       ///< 获取应用沙盒内Tmp文件夹的URL
@property (nonatomic, readonly) NSString *sc_temporaryPath;   ///< 获取应用沙盒内Tmp文件夹的路径

@property (nonatomic, readonly) CGFloat sc_statusBarHeight;   ///< 获取当前应用状态栏的高度, 状态栏隐藏时高度为0
@property (nonatomic, readonly) CGFloat sc_statusBarWidth;    ///< 获取当前应用状态栏的宽度, 状态栏隐藏时宽度为0

#pragma mark - Check
@property (nonatomic, readonly) BOOL sc_isPirated;       ///< 应用是否为盗版(非通过AppStore安装, 包被破解, 简单判断)
@property (nonatomic, readonly) BOOL sc_isBeingDebugged; ///< 应用是否在调试模式运行

@end

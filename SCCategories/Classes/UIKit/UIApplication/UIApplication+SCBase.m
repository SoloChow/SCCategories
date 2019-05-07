//
//  UIApplication+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "UIApplication+SCBase.h"
#import "UIDevice+SCBase.h"
#import "NSString+SCPathString.h"
#import <mach/mach.h>
#import <sys/sysctl.h>

@implementation UIApplication (SCBase)

#pragma mark - Base
- (NSString *)sc_appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)sc_appBundleDisplayName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

- (NSString *)sc_appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)sc_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)sc_appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

- (NSURL *)sc_documentsURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)sc_documentsPath {
    return SCNSDocumentsDirectory();
}

- (NSURL *)sc_cachesURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)sc_cachesPath {
    return SCNSCachesDirectory();
}

- (NSURL *)sc_libraryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)sc_libraryPath {
    return SCNSLibraryDirectory();
}

- (NSURL *)sc_temporaryURL {
    return [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
}

- (NSString *)sc_temporaryPath {
    return NSTemporaryDirectory();
}

- (CGFloat)sc_statusBarHeight {
    CGSize statusBarSize = [UIApplication sharedApplication].statusBarFrame.size;
    return MIN(statusBarSize.height, statusBarSize.width);
}

- (CGFloat)sc_statusBarWidth {
    CGSize statusBarSize = [UIApplication sharedApplication].statusBarFrame.size;
    return MAX(statusBarSize.height, statusBarSize.width);
}

#pragma mark - Check
- (BOOL)_sc_isFileExistInMainBundle:(NSString *)name {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *path = [NSString stringWithFormat:@"%@/%@", bundlePath, name];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

- (BOOL)sc_isPirated {
    if ([UIDevice sc_isSimulator]) return YES; // Simulator is not from appstore
    
    if (getgid() <= 10) return YES; // 目前进程的组识别码 process ID shouldn't be root
    // 破解版包含标签
    if ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"SignerIdentity"]) return YES;
    // 签名信息
    if (![self _sc_isFileExistInMainBundle:@"_CodeSignature"]) return YES;
    
    if (![self _sc_isFileExistInMainBundle:@"SC_Info"]) return YES;
    
    //if someone really want to crack your app, this method is useless..
    //you may change this method's name, encrypt the code and do more check..
    return NO;
}

- (BOOL)sc_isBeingDebugged {
    size_t size = sizeof(struct kinfo_proc);
    struct kinfo_proc info;
    int ret = 0, name[4];
    memset(&info, 0, sizeof(struct kinfo_proc));
    
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID;
    name[3] = getpid();
    
    if (ret == (sysctl(name, 4, &info, &size, NULL, 0))) {
        return ret != 0;
    }
    return (info.kp_proc.p_flag & P_TRACED) ? YES : NO;
}

@end

//
//  NSString+SCPathString.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  路径字符串

#import <Foundation/Foundation.h>

@interface NSString (SCPathString)

/**
 获取当前用户Documents文件夹路径
 
 @return 当前用户Documents文件夹路径
 */
FOUNDATION_EXPORT NSString *SCNSDocumentsDirectory(void);

/**
 获取当前用户Caches文件夹路径
 
 @return 获取当前用户Caches文件夹路径
 */
FOUNDATION_EXPORT NSString *SCNSCachesDirectory(void);

/**
 获取当前用户Library文件夹路径
 
 @return 当前用户Library文件夹路径
 */
FOUNDATION_EXPORT NSString *SCNSLibraryDirectory(void);

/**
 根据路径子节点集, 获取应用documents文件夹路径拼接后的新路径
 
 @param components 路径子节点集
 @return 新路径
 */
+ (NSString *)sc_documentsPathWithComponents:(NSArray<NSString *> *)components;

/**
 根据路径子节点, 获取应用documents文件夹路径拼接后的新路径
 
 @param component 路径子节点
 @return 新路径
 */
+ (NSString *)sc_documentsPathWithComponent:(NSString *)component;

/**
 根据路径最末子节点, 获取应用documents文件夹路径拼接后的新路径
 
 @param lastPathComponent 路径最末子节点
 @return 新路径
 */
+ (NSString *)sc_documentsPathWithLastPathComponent:(NSString *)lastPathComponent;

/**
 根据路径子节点集, 获取应用caches文件夹路径拼接后的新路径
 
 @param components 路径子节点集
 @return 新路径
 */
+ (NSString *)sc_cachesPathWithComponents:(NSArray<NSString *> *)components;

/**
 根据路径子节点, 获取应用caches文件夹路径拼接后的新路径
 
 @param component 路径子节点
 @return 新路径
 */
+ (NSString *)sc_cachesPathWithComponent:(NSString *)component;

/**
 根据路径最末子节点, 获取应用caches文件夹路径拼接后的新路径
 
 @param lastPathComponent 路径最末子节点
 @return 新路径
 */
+ (NSString *)sc_cachesPathWithLastPathComponent:(NSString *)lastPathComponent;

/**
 根据路径子节点集, 获取应用library文件夹路径拼接后的新路径
 
 @param components 路径子节点集
 @return 新路径
 */
+ (NSString *)sc_libraryPathWithComponents:(NSArray<NSString *> *)components;

/**
 根据路径子节点, 获取应用library文件夹路径拼接后的新路径
 
 @param component 路径子节点
 @return 新路径
 */
+ (NSString *)sc_libraryPathWithComponent:(NSString *)component;

/**
 根据路径最末子节点, 获取应用library文件夹路径拼接后的新路径
 
 @param lastPathComponent 路径最末子节点
 @return 新路径
 */
+ (NSString *)sc_libraryPathWithLastPathComponent:(NSString *)lastPathComponent;

/**
 根据路径子节点集, 获取应用temp文件夹路径拼接后的新路径
 
 @param components 路径子节点集
 @return 新路径
 */
+ (NSString *)sc_temporaryPathWithComponents:(NSArray<NSString *> *)components;

/**
 根据路径子节点, 获取应用temp文件夹路径拼接后的新路径
 
 @param component 路径子节点
 @return 新路径
 */
+ (NSString *)sc_temporaryPathWithComponent:(NSString *)component;

/**
 根据路径最末子节点, 获取应用temp文件夹路径拼接后的新路径
 
 @param lastPathComponent 路径最末子节点
 @return 新路径
 */
+ (NSString *)sc_temporaryPathWithLastPathComponent:(NSString *)lastPathComponent;

@end

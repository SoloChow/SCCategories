//
//  NSString+SCPathString.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCPathString.h"

@implementation NSString (SCPathString)

#pragma mark - Path String
NSString *SCNSDocumentsDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

NSString *SCNSCachesDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

NSString *SCNSLibraryDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)sc_documentsPathWithComponents:(NSArray<NSString *> *)components {
    NSString *componentsString = [NSString pathWithComponents:components];
    return [SCNSDocumentsDirectory() stringByAppendingPathComponent:componentsString];
}

+ (NSString *)sc_documentsPathWithComponent:(NSString *)component {
    return [SCNSDocumentsDirectory() stringByAppendingPathComponent:component];
}

+ (NSString *)sc_documentsPathWithLastPathComponent:(NSString *)lastPathComponent {
    return [SCNSDocumentsDirectory() stringByAppendingPathComponent:[lastPathComponent lastPathComponent]];
}

+ (NSString *)sc_cachesPathWithComponents:(NSArray<NSString *> *)components {
    NSString *componentsString = [NSString pathWithComponents:components];
    return [SCNSCachesDirectory() stringByAppendingPathComponent:componentsString];
}

+ (NSString *)sc_cachesPathWithComponent:(NSString *)component {
    return [SCNSCachesDirectory() stringByAppendingPathComponent:component];
}

+ (NSString *)sc_cachesPathWithLastPathComponent:(NSString *)lastPathComponent {
    return [SCNSCachesDirectory() stringByAppendingPathComponent:[lastPathComponent lastPathComponent]];
}

+ (NSString *)sc_libraryPathWithComponents:(NSArray<NSString *> *)components {
    NSString *componentsString = [NSString pathWithComponents:components];
    return [SCNSLibraryDirectory() stringByAppendingPathComponent:componentsString];
}

+ (NSString *)sc_libraryPathWithComponent:(NSString *)component {
    return [SCNSLibraryDirectory() stringByAppendingPathComponent:component];
}

+ (NSString *)sc_libraryPathWithLastPathComponent:(NSString *)lastPathComponent {
    return [SCNSLibraryDirectory() stringByAppendingPathComponent:[lastPathComponent lastPathComponent]];
}

+ (NSString *)sc_temporaryPathWithComponents:(NSArray<NSString *> *)components {
    NSString *componentsString = [NSString pathWithComponents:components];
    return [NSTemporaryDirectory() stringByAppendingPathComponent:componentsString];
}

+ (NSString *)sc_temporaryPathWithComponent:(NSString *)component {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:component];
}

+ (NSString *)sc_temporaryPathWithLastPathComponent:(NSString *)lastPathComponent {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[lastPathComponent lastPathComponent]];
}

@end

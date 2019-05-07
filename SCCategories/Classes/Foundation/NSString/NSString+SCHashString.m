//
//  NSString+SCHashString.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCHashString.h"
#import "NSData+SCHash.h"

@implementation NSString (SCHashString)

#pragma mark - Hash
- (NSString *)sc_md2String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_md2String];
}

- (NSString *)sc_md4String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_md4String];
}

- (NSString *)sc_md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_md5String];
}

- (NSString *)sc_sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_sha1String];
}

- (NSString *)sc_sha224String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_sha224String];
}

- (NSString *)sc_sha256String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_sha256String];
}

- (NSString *)sc_sha384String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_sha384String];
}

- (NSString *)sc_sha512String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_sha512String];
}

- (NSString *)sc_crc32String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sc_crc32String];
}

- (NSString *)sc_hmacMD5StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sc_hmacMD5StringWithKey:key];
}

- (NSString *)sc_hmacSHA1StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sc_hmacSHA1StringWithKey:key];
}

- (NSString *)sc_hmacSHA224StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sc_hmacSHA224StringWithKey:key];
}

- (NSString *)sc_hmacSHA256StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sc_hmacSHA256StringWithKey:key];
}

- (NSString *)sc_hmacSHA384StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sc_hmacSHA384StringWithKey:key];
}

- (NSString *)sc_hmacSHA512StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sc_hmacSHA512StringWithKey:key];
}

@end

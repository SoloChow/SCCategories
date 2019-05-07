//
//  NSData+SCHash.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSData+SCHash.h"
#include <CommonCrypto/CommonCrypto.h>
#include <zlib.h> // libz.1.2.5.tbd

@implementation NSData (SCHash)

#pragma mark - Hash
- (NSString *)sc_md2String {
    unsigned char result[CC_MD2_DIGEST_LENGTH]; // MD2信息长度
    CC_MD2(self.bytes, (CC_LONG)self.length, result); // 将输入信息的长度(bit)进行填充, 记录信息长度, 装入标准的幻数
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; // %02x -> 16进制形式两位输出(不足补0)
}

- (NSData *)sc_md2Data {
    unsigned char result[CC_MD2_DIGEST_LENGTH];
    CC_MD2(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_MD2_DIGEST_LENGTH];
}

- (NSString *)sc_md4String {
    unsigned char result[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSData *)sc_md4Data {
    unsigned char result[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_MD4_DIGEST_LENGTH];
}

- (NSString *)sc_md5String {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSData *)sc_md5Data {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)sc_sha1String {
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

- (NSData *)sc_sha1Data {
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)sc_sha224String {
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA224_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

- (NSData *)sc_sha224Data {
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA224_DIGEST_LENGTH];
}

- (NSString *)sc_sha256String {
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

- (NSData *)sc_sha256Data {
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)sc_sha384String {
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

- (NSData *)sc_sha384Data {
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA384_DIGEST_LENGTH];
}

- (NSString *)sc_sha512String {
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

- (NSData *)sc_sha512Data {
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, result);
    return [NSData dataWithBytes:result length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)sc_crc32String {
    uLong result = crc32(0, self.bytes, (uInt)self.length);
    return [NSString stringWithFormat:@"%08x", (uint32_t)result]; // %08x -> 16进制形式八位输出(不足补0)
}

- (uint32_t)sc_crc32 {
    uLong result = crc32(0, self.bytes, (uInt)self.length);
    return (uint32_t)result;
}

/**
 根据加密算法和密钥, 生成加密后的data字符串
 
 @param algorithm 加密算法
 @param key       密钥
 @return 加密后的data字符串
 */
- (NSString *)_sc_hmacStringUsingAlgorithm:(CCHmacAlgorithm)algorithm withKey:(NSString *)key
{
    size_t size;
    switch (algorithm) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(algorithm, cKey, strlen(cKey), self.bytes, self.length, result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];
    for (int i = 0; i < size; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

/**
 根据加密算法和密钥, 生成加密后的data
 
 @param algorithm 加密算法
 @param key       密钥
 @return 加密后的data
 */
- (NSData *)_sc_hmacDataUsingAlgorithm:(CCHmacAlgorithm)algorithm withKey:(NSData *)key {
    size_t size;
    switch (algorithm) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    CCHmac(algorithm, [key bytes], key.length, self.bytes, self.length, result);
    return [NSData dataWithBytes:result length:size];
}

- (NSString *)sc_hmacMD5StringWithKey:(NSString *)key {
    return [self _sc_hmacStringUsingAlgorithm:kCCHmacAlgMD5 withKey:key];
}

- (NSData *)sc_hmacMD5DataWithKey:(NSData *)key {
    return [self _sc_hmacDataUsingAlgorithm:kCCHmacAlgMD5 withKey:key];
}

- (NSString *)sc_hmacSHA1StringWithKey:(NSString *)key {
    return [self _sc_hmacStringUsingAlgorithm:kCCHmacAlgSHA1 withKey:key];
}

- (NSData *)sc_hmacSHA1DataWithKey:(NSData *)key {
    return [self _sc_hmacDataUsingAlgorithm:kCCHmacAlgSHA1 withKey:key];
}

- (NSString *)sc_hmacSHA224StringWithKey:(NSString *)key {
    return [self _sc_hmacStringUsingAlgorithm:kCCHmacAlgSHA224 withKey:key];
}

- (NSData *)sc_hmacSHA224DataWithKey:(NSData *)key {
    return [self _sc_hmacDataUsingAlgorithm:kCCHmacAlgSHA224 withKey:key];
}

- (NSString *)sc_hmacSHA256StringWithKey:(NSString *)key {
    return [self _sc_hmacStringUsingAlgorithm:kCCHmacAlgSHA256 withKey:key];
}

- (NSData *)sc_hmacSHA256DataWithKey:(NSData *)key {
    return [self _sc_hmacDataUsingAlgorithm:kCCHmacAlgSHA256 withKey:key];
}

- (NSString *)sc_hmacSHA384StringWithKey:(NSString *)key {
    return [self _sc_hmacStringUsingAlgorithm:kCCHmacAlgSHA384 withKey:key];
}

- (NSData *)sc_hmacSHA384DataWithKey:(NSData *)key {
    return [self _sc_hmacDataUsingAlgorithm:kCCHmacAlgSHA384 withKey:key];
}

- (NSString *)sc_hmacSHA512StringWithKey:(NSString *)key {
    return [self _sc_hmacStringUsingAlgorithm:kCCHmacAlgSHA512 withKey:key];
}

- (NSData *)sc_hmacSHA512DataWithKey:(NSData *)key {
    return [self _sc_hmacDataUsingAlgorithm:kCCHmacAlgSHA512 withKey:key];
}

@end

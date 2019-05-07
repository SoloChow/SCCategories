//
//  NSString+SCHashString.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  Hash字符串

#import <Foundation/Foundation.h>

@interface NSString (SCHashString)

/**
 获取string对应的MD2字符串(小写)
 
 @return string对应的MD2字符串(小写)
 */
- (NSString *)sc_md2String;

/**
 获取string对应的MD4字符串(小写)
 
 @return string对应的MD4字符串(小写)
 */
- (NSString *)sc_md4String;

/**
 获取string对应的MD5字符串(小写)
 
 @return string对应的MD5字符串(小写)
 */
- (NSString *)sc_md5String;

/**
 获取string对应的SHA1字符串(小写)
 
 @return string对应的SHA1字符串(小写)
 */
- (NSString *)sc_sha1String;

/**
 获取string对应的SHA224字符串(小写)
 
 @return string对应的SHA224字符串(小写)
 */
- (NSString *)sc_sha224String;

/**
 获取string对应的SHA256字符串(小写)
 
 @return string对应的SHA256字符串(小写)
 */
- (NSString *)sc_sha256String;

/**
 获取string对应的SHA384字符串(小写)
 
 @return string对应的SHA384字符串(小写)
 */
- (NSString *)sc_sha384String;

/**
 获取string对应的SHA512字符串(小写)
 
 @return string对应的SHA512字符串(小写)
 */
- (NSString *)sc_sha512String;

/**
 获取string对应的CRC32字符串(小写)
 
 @return string对应的CRC32字符串(小写)
 */
- (NSString *)sc_crc32String;

/**
 根据密钥, 生成MD5加密后的字符串
 
 @param key 密钥
 @return MD5加密后的字符串
 */
- (NSString *)sc_hmacMD5StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA1加密后的字符串
 
 @param key 密钥
 @return SHA1加密后的字符串
 */
- (NSString *)sc_hmacSHA1StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA224加密后的字符串
 
 @param key 密钥
 @return SHA224加密后的字符串
 */
- (NSString *)sc_hmacSHA224StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA256加密后的字符串
 
 @param key 密钥
 @return SHA256加密后的字符串
 */
- (NSString *)sc_hmacSHA256StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA384加密后的字符串
 
 @param key 密钥
 @return SHA384加密后的字符串
 */
- (NSString *)sc_hmacSHA384StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA512加密后的字符串
 
 @param key 密钥
 @return SHA512加密后的字符串
 */
- (NSString *)sc_hmacSHA512StringWithKey:(NSString *)key;

@end

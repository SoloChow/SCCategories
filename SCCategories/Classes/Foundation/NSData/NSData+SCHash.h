//
//  NSData+SCHash.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  Hash

#import <Foundation/Foundation.h>

@interface NSData (SCHash)
/**
 获取data对应的MD2字符串(小写)
 
 @return data对应的MD2字符串(小写)
 */
- (NSString *)sc_md2String;

/**
 获取data对应的MD2Data
 
 @return MD2Data
 */
- (NSData *)sc_md2Data;

/**
 获取data对应的MD4字符串(小写)
 
 @return data对应的MD4字符串(小写)
 */
- (NSString *)sc_md4String;

/**
 获取data对应的MD4Data
 
 @return MD4Data
 */
- (NSData *)sc_md4Data;

/**
 获取data对应的MD5字符串(小写)
 
 @return data对应的MD5字符串(小写)
 */
- (NSString *)sc_md5String;

/**
 获取data对应的MD5Data
 
 @return MD5Data
 */
- (NSData *)sc_md5Data;

/**
 获取data对应的SHA1字符串(小写)
 
 @return data对应的SHA1字符串(小写)
 */
- (NSString *)sc_sha1String;

/**
 获取data对应的SHA1Data
 
 @return SHA1Data
 */
- (NSData *)sc_sha1Data;

/**
 获取data对应的SHA224字符串(小写)
 
 @return data对应的SHA224字符串(小写)
 */
- (NSString *)sc_sha224String;

/**
 获取data对应的SHA224Data
 
 @return SHA224Data
 */
- (NSData *)sc_sha224Data;

/**
 获取data对应的SHA256字符串(小写)
 
 @return data对应的SHA256字符串(小写)
 */
- (NSString *)sc_sha256String;

/**
 获取data对应的SHA256Data
 
 @return SHA256Data
 */
- (NSData *)sc_sha256Data;

/**
 获取data对应的SHA384字符串(小写)
 
 @return data对应的SHA384字符串(小写)
 */
- (NSString *)sc_sha384String;

/**
 获取data对应的SHA384Data
 
 @return SHA384Data
 */
- (NSData *)sc_sha384Data;

/**
 获取data对应的SHA512字符串(小写)
 
 @return data对应的SHA512字符串(小写)
 */
- (NSString *)sc_sha512String;

/**
 获取data对应的SHA512Data
 
 @return SHA512Data
 */
- (NSData *)sc_sha512Data;

/**
 获取data对应的CRC32字符串
 
 @return data对应的CRC32字符串
 */
- (NSString *)sc_crc32String;

/**
 获取data对应的CRC32值
 
 @return data对应的CRC32值
 */
- (uint32_t)sc_crc32;

/**
 根据密钥, 生成MD5加密后的data字符串
 
 @param key 密钥
 @return MD5加密后的data字符串
 */
- (NSString *)sc_hmacMD5StringWithKey:(NSString *)key;

/**
 根据密钥, 生成MD5加密后的data
 
 @param key 密钥
 @return MD5加密后的data
 */
- (NSData *)sc_hmacMD5DataWithKey:(NSData *)key;

/**
 根据密钥, 生成SHA1加密后的data字符串
 
 @param key 密钥
 @return SHA1加密后的data字符串
 */
- (NSString *)sc_hmacSHA1StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA1加密后的data
 
 @param key 密钥
 @return SHA1加密后的data
 */
- (NSData *)sc_hmacSHA1DataWithKey:(NSData *)key;

/**
 根据密钥, 生成SHA224加密后的data字符串
 
 @param key 密钥
 @return SHA224加密后的data字符串
 */
- (NSString *)sc_hmacSHA224StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA224加密后的data
 
 @param key 密钥
 @return SHA224加密后的data
 */
- (NSData *)sc_hmacSHA224DataWithKey:(NSData *)key;

/**
 根据密钥, 生成SHA256加密后的data字符串
 
 @param key 密钥
 @return SHA256加密后的data字符串
 */
- (NSString *)sc_hmacSHA256StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA256加密后的data
 
 @param key 密钥
 @return SHA256加密后的data
 */
- (NSData *)sc_hmacSHA256DataWithKey:(NSData *)key;

/**
 根据密钥, 生成SHA384加密后的data字符串
 
 @param key 密钥
 @return SHA384加密后的data字符串
 */
- (NSString *)sc_hmacSHA384StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA384加密后的data
 
 @param key 密钥
 @return SHA384加密后的data
 */
- (NSData *)sc_hmacSHA384DataWithKey:(NSData *)key;

/**
 根据密钥, 生成SHA512加密后的data字符串
 
 @param key 密钥
 @return SHA512加密后的data字符串
 */
- (NSString *)sc_hmacSHA512StringWithKey:(NSString *)key;

/**
 根据密钥, 生成SHA512加密后的data
 
 @param key 密钥
 @return SHA512加密后的data
 */
- (NSData *)sc_hmacSHA512DataWithKey:(NSData *)key;

@end

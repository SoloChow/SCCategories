//
//  NSData+SCEncryptAndDecrypt.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  加密和解密

#import <Foundation/Foundation.h>

@interface NSData (SCEncryptAndDecrypt)

/**
 获取AES256加密后的data(key长度非法, 返回nil)
 
 @param key 密钥(16, 24, 32字节 <128, 192, 256位>)
 @return AES256加密后的data(key长度非法, 返回nil)
 */
- (NSData *)sc_AES256EncryptWithKey:(NSString *)key;

/**
 获取AES256加密后的data(key或iv长度非法, 返回nil)
 
 @param key 密钥(16, 24, 32字节 <128, 192, 256位>)
 @param iv  初始化向量(16字节<128位>, 可传nil)
 @return AES256加密后的data(key或iv长度非法, 返回nil)
 */
- (NSData *)sc_AES256EncryptWithKey:(NSData *)key iv:(NSData *)iv;

/**
 获取AES256解密后的data(key长度非法, 返回nil)
 
 @param key 密钥(16, 24, 32字节 <128, 192, 256位>)
 @return AES256解密后的data(key长度非法, 返回nil)
 */
- (NSData *)sc_AES256DecryptWithString:(NSString *)key;

/**
 获取AES256解密后的data(key或iv长度非法, 返回nil)
 
 @param key 密钥(16, 24, 32字节 <128, 192, 256位>)
 @param iv  初始化向量(16字节<128位>, 可传nil)
 @return AES256解密后的data(key或iv长度非法, 返回nil)
 */
- (NSData *)sc_AES256DecryptWithkey:(NSData *)key iv:(NSData *)iv;

@end

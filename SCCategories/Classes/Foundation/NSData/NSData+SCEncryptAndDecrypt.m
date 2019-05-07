//
//  NSData+SCEncryptAndDecrypt.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSData+SCEncryptAndDecrypt.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (SCEncryptAndDecrypt)

- (NSData *)sc_AES256EncryptWithKey:(NSString *)key {
    return [self sc_AES256EncryptWithKey:[key dataUsingEncoding:NSUTF8StringEncoding] iv:nil];
}

- (NSData *)sc_AES256EncryptWithKey:(NSData *)key iv:(NSData *)iv {
    if (key.length != 16 && key.length != 24 && key.length != 32) return nil;
    if (iv.length != 16 && iv.length != 0) return nil;
    
    NSData *result = nil;
    size_t bufferSize = self.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    if (!buffer) return nil;
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          key.bytes,
                                          key.length,
                                          iv.bytes,
                                          self.bytes,
                                          self.length,
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [[NSData alloc] initWithBytes:buffer length:encryptedSize];
        free(buffer);
        return result;
    } else {
        free(buffer);
        return nil;
    }
}

- (NSData *)sc_AES256DecryptWithString:(NSString *)key {
    return [self sc_AES256DecryptWithkey:[key dataUsingEncoding:NSUTF8StringEncoding] iv:nil];
}

- (NSData *)sc_AES256DecryptWithkey:(NSData *)key iv:(NSData *)iv {
    if (key.length != 16 && key.length != 24 && key.length != 32) return nil;
    if (iv.length != 16 && iv.length != 0) return nil;
    
    NSData *result = nil;
    size_t bufferSize = self.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    if (!buffer) return nil;
    size_t decryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          key.bytes,
                                          key.length,
                                          iv.bytes,
                                          self.bytes,
                                          self.length,
                                          buffer,
                                          bufferSize,
                                          &decryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [[NSData alloc] initWithBytes:buffer length:decryptedSize];
        free(buffer);
        return result;
    } else {
        free(buffer);
        return nil;
    }
}

@end

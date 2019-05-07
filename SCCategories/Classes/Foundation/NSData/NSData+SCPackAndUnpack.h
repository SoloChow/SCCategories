//
//  NSData+SCPackAndUnpack.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  压缩和解压缩

#import <Foundation/Foundation.h>

@interface NSData (SCPackAndUnpack)

/**
 将data压缩成gzip格式data
 
 @return gzip格式data
 */
- (NSData *)sc_gzipPack;

/**
 将gzip格式data解压成data
 
 @return NSData对象
 */
- (NSData *)sc_gzipUnpack;

/**
 将data压缩成zlib格式data
 
 @return zlib格式data
 */
- (NSData *)sc_zlibPack;

/**
 将zlib格式data解压成data
 
 @return NSData对象
 */
- (NSData *)sc_zlibUnpack;

@end

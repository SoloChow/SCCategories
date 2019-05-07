//
//  NSFileManager+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSFileManager (SCBase)

#pragma mark - Base
/**
 获取路径下所有文件或文件夹的大小(字节, error -> -1)

 @param path 文件或文件夹路径
 @return 文件或文件夹的大小(字节, error -> -1)
 */
- (int64_t)sc_fileSizeWithPath:(NSString *)path;

@end

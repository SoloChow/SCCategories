//
//  NSKeyedArchiver+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "NSKeyedArchiver+SCBase.h"

@implementation NSKeyedArchiver (SCBase)

#pragma mark - Base
+ (id)sc_unarchiveObjectWithData:(NSData *)data exception:(__autoreleasing NSException **)exception
{
    id object = nil;
    @try {
        object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    } @catch (NSException *e) {
        if (exception) *exception = e;
    } @finally {
    }
    return object;
}

+ (id)sc_unarchiveObjectWithFile:(NSString *)path exception:(__autoreleasing NSException **)exception
{
    id object = nil;
    @try {
        object = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    } @catch (NSException *e) {
        if (exception) *exception = e;
    } @finally {
    }
    return object;
}

@end

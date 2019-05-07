//
//  NSIndexPath+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/4.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <Foundation/Foundation.h>

@interface NSIndexPath (SCBase)

#pragma mark - Base
/**
 判断两个IndexPath是否相等

 @param other 另一个indexPath
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToIndexPath:(NSIndexPath *)other;

@end

//
//  UITextField+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (SCBase)

#pragma mark - Base
/**
 选中所有的文本
 */
- (void)sc_selectAllText;

/**
 选中范围内的文本

 @param range 范围
 */
- (void)sc_setSelectedRange:(NSRange)range;

@end

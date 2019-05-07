//
//  UITextView+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//

#import <UIKit/UIKit.h>

@interface UITextView (SCBase)

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

/**
 根据现有宽度自适应高度

 @return 自适应后的高度
 */
- (CGFloat)sc_heightThatFits;

/**
 根据输入宽度自适应高度

 @param width 宽度
 @return 自适应后的高度
 */
- (CGFloat)sc_heightThatFitsWithWidth:(CGFloat)width;

@end

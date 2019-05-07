//
//  CALayer+SCBase.h
//  SCCategories
//
//  Created by Solo on 17/1/6.
//  Copyright © 2017年 SC. All rights reserved.
//  Base

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (SCBase)

#pragma mark - Base
/**
 根据Layer的contentsGravity属性, 获取其对应的contentMode
 */
@property (nonatomic) UIViewContentMode sc_contentMode;

/**
 移除所有子Layers
 */
- (void)sc_removeAllSublayers;

@end

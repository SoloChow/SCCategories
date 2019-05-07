//
//  UITabBar+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UITabBar (SCBase)

#pragma mark - Base
@property (nonatomic, assign) BOOL sc_hidesTopHairline; ///< 隐藏TabBar顶部的分割线, 默认为NO
@property (nonatomic, strong) UIColor *sc_topHairlineColor; ///< TabBar顶部的分割线颜色

@end

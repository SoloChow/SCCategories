//
//  UINavigationBar+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (SCBase)

#pragma mark - Base
@property (nonatomic, assign) BOOL sc_hidesBottomHairline;     ///< 隐藏NavigationBar底部的分割线, 默认为NO
@property (nonatomic, strong) UIColor *sc_bottomHairlineColor; ///< NavigationBar底部的分割线颜色

@end

//
//  UITableViewCell+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SCBase)

#pragma mark - Base
/**
 Cell选中时的背景颜色, SelectionStyle为UITableViewCellSelectionStyleNone时为nil
 */
@property (nonatomic, readonly) UIColor *sc_selectedBackgroundViewColor;

/**
 设置Cell选中时的背景颜色, SelectionStyle为UITableViewCellSelectionStyleNone时无效

 @param color 背景颜色
 */
- (void)sc_setSelectedBackgroundViewColor:(UIColor *)color;

#pragma mark - Accessory
/**
 准备设置Cell的AccessoryDisclosureIndicator的颜色, 在Cell调用"setTintColor:"方法前调用
 Usage:
 
 [cell sc_prepareForAccessoryDisclosureIndicatorColor];
 [cell setTintColor:[UIColor blackColor]];
 */
- (void)sc_prepareForAccessoryDisclosureIndicatorColor;

@end

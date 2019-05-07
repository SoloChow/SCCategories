//
//  UITableViewCell+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UITableViewCell+SCBase.h"
#import "NSObject+SCAssociatedValue.h"

const  CGSize SCUITableViewCellAccessoryDisclosureIndicatorBackgroundImageSize = {8, 13};
static const int SC_TABLE_VIEW_CELL_CUSTOM_SELECTED_BACKGROUND_VIEW_KEY;

@interface UITableViewCell ()

@property (nonatomic, strong, setter=_sc_setCustomSelectedBackgroundView:) UIView *_sc_customSelectedBackgroundView;

@end

@implementation UITableViewCell (SCBase)

#pragma mark - Base
- (UIView *)_sc_customSelectedBackgroundView {
    if (self.selectionStyle == UITableViewCellSelectionStyleNone) return nil;
    
    UIView *customSelectedBackgroundView = [self sc_getAssociatedValueForKey:&SC_TABLE_VIEW_CELL_CUSTOM_SELECTED_BACKGROUND_VIEW_KEY];
    if (!customSelectedBackgroundView) {
        customSelectedBackgroundView = [UIView new];
        [self _sc_setCustomSelectedBackgroundView:customSelectedBackgroundView];
    }
    return customSelectedBackgroundView;
}

- (void)_sc_setCustomSelectedBackgroundView:(UIView *)view {
    if (self.selectionStyle == UITableViewCellSelectionStyleNone) return;
    
    [self sc_setAssociatedValue:view withKey:&SC_TABLE_VIEW_CELL_CUSTOM_SELECTED_BACKGROUND_VIEW_KEY];
}

- (UIColor *)sc_selectedBackgroundViewColor {
    if (self.selectionStyle == UITableViewCellSelectionStyleNone) return nil;
    
    return self.selectedBackgroundView.backgroundColor;
}

- (void)sc_setSelectedBackgroundViewColor:(UIColor *)color {
    if (self.selectionStyle == UITableViewCellSelectionStyleNone) return;
    
    self._sc_customSelectedBackgroundView.backgroundColor = color;
    self.selectedBackgroundView = self._sc_customSelectedBackgroundView;
}

#pragma mark - Accessory
- (void)sc_prepareForAccessoryDisclosureIndicatorColor {
    if (self.accessoryType != UITableViewCellAccessoryDisclosureIndicator) return;
    
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            UIImage *image = [button backgroundImageForState:UIControlStateNormal];
            if (CGSizeEqualToSize(image.size, SCUITableViewCellAccessoryDisclosureIndicatorBackgroundImageSize)) {
                image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                [button setBackgroundImage:image forState:UIControlStateNormal];
                return;
            }
        }
    }
}

@end

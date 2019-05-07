//
//  UIView+SCNibView.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "UIView+SCNibView.h"

@implementation UIView (SCNibView)

#pragma mark - Nib
+ (instancetype)sc_viewFromNib {
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

+ (instancetype)sc_viewFromNib:(NSString *)name {
    return  [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject];
}

@end

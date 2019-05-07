//
//  UIView+SCTouchInset.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  点击区域

#import <UIKit/UIKit.h>

@interface UIView (SCTouchInset)
/**
 扩大视图点击区域(正数->内距; 负数->外边)
 */
@property (nonatomic) UIEdgeInsets sc_touchInset;

@end

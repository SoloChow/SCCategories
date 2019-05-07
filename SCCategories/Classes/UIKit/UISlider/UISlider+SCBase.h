//
//  UISlider+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UISlider (SCBase)

#pragma mark - Base
@property (nonatomic, readonly) CGRect sc_trackRect; ///< 获取Slider的Track图片的Rect, Rect根据Slider的Bounds计算
@property (nonatomic, readonly) CGRect sc_thumbRect; ///< 获取Slider的Thumb图片的Rect, Rect根据Slider的Bounds计算

@end

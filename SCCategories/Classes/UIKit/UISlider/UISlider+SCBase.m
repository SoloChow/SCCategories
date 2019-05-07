//
//  UISlider+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UISlider+SCBase.h"

@implementation UISlider (SCBase)

#pragma mark - Base
- (CGRect)sc_trackRect {
    return [self trackRectForBounds:self.bounds];
}

- (CGRect)sc_thumbRect {
    return [self thumbRectForBounds:self.bounds trackRect:self.sc_trackRect value:self.value];
}

@end

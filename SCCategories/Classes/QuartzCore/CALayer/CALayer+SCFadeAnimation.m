//
//  CALayer+SCFadeAnimation.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "CALayer+SCFadeAnimation.h"
#import <UIKit/UIKit.h>

@implementation CALayer (SCFadeAnimation)

- (void)sc_addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve {
    if (duration <= 0) return;
    
    NSString *mediaFunction;
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
        {
            mediaFunction = kCAMediaTimingFunctionEaseInEaseOut;
        }
            break;
        case UIViewAnimationCurveEaseIn:
        {
            mediaFunction = kCAMediaTimingFunctionEaseIn;
        }
            break;
        case UIViewAnimationCurveEaseOut:
        {
            mediaFunction = kCAMediaTimingFunctionEaseOut;
        }
            break;
        case UIViewAnimationCurveLinear:
        {
            mediaFunction = kCAMediaTimingFunctionLinear;
        }
            break;
        default:
        {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
    }
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:mediaFunction];
    transition.type = kCATransitionFade;
    [self addAnimation:transition forKey:@"calayer.fade"];
}

- (void)sc_removePreviousFadeAnimation {
    [self removeAnimationForKey:@"calayer.fade"];
}

@end

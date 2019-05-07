//
//  UIButton+SCCountDown.m
//  Pods
//
//  Created by Solo on 17/2/11.
//
//

#import "UIButton+SCCountDown.h"
#import "UIView+SCCountDown.h"

@implementation UIButton (SCCountDown)

#pragma mark - Count Down
- (void)sc_changeWithCountDown:(NSInteger)seconds title:(NSString *)title backgroundColor:(UIColor *)backgroundColor finishedTitle:(NSString *)finishedTitle finishedBackgroundColor:(UIColor *)finishedBackgroundColor {
    [self sc_changeWithCountDown:seconds countDownHandler:^(id sender, NSInteger second, BOOL finished) {
        if (finished) {
            self.backgroundColor = finishedBackgroundColor;
            [self setTitle:finishedTitle forState:UIControlStateNormal];
            self.enabled = YES;
        } else {
            self.backgroundColor = backgroundColor;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2ld", (long)second];
            [self setTitle:[NSString stringWithFormat:@"%@(%@S)",title, timeStr] forState:UIControlStateDisabled];
            self.enabled = NO;
        }
    }];
}

@end

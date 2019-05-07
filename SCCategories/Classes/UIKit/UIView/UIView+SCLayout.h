//
//  UIView+SCLayout.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  界面布局处理

#import <UIKit/UIKit.h>

@interface UIView (SCLayout)

@property (nonatomic, assign) CGFloat sc_x;       ///< self.frame.origin.x
@property (nonatomic, assign) CGFloat sc_y;       ///< self.frame.origin.y
@property (nonatomic, assign) CGPoint sc_origin;  ///< self.frame.origin
@property (nonatomic, assign) CGFloat sc_width;   ///< self.frame.size.width
@property (nonatomic, assign) CGFloat sc_height;  ///< self.frame.size.height
@property (nonatomic, assign) CGSize  sc_size;    ///< self.frame.size
@property (nonatomic, assign) CGFloat sc_centerX; ///< self.center.x
@property (nonatomic, assign) CGFloat sc_centerY; ///< self.center.y
@property (nonatomic, assign) CGFloat sc_left;    ///< self.frame.origin.x
@property (nonatomic, assign) CGFloat sc_top;     ///< self.frame.origin.y
@property (nonatomic, assign) CGFloat sc_right;   ///< self.frame.origin.x + self.frame.size.width
@property (nonatomic, assign) CGFloat sc_bottom;  ///< self.frame.origin.y + self.frame.size.height

- (void)sc_originXEqualToView:(UIView *)view;
- (void)sc_originYEqualToView:(UIView *)view;
- (void)sc_originEqualToView:(UIView *)view;

- (void)sc_widthEqualToView:(UIView *)view;
- (void)sc_heightEqualToView:(UIView *)view;
- (void)sc_sizeEqualToView:(UIView *)view;

- (void)sc_centerXEqualToView:(UIView *)view;
- (void)sc_centerYEqualToView:(UIView *)view;
- (void)sc_centerEqualToView:(UIView *)view;

- (void)sc_leftEqualToView:(UIView *)view;
- (void)sc_topEqualToView:(UIView *)view;
- (void)sc_rightEqualToView:(UIView *)view;
- (void)sc_bottomEqualToView:(UIView *)view;

@end

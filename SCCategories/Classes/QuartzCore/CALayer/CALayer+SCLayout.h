//
//  CALayer+SCLayout.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  Layer布局处理

#import <QuartzCore/QuartzCore.h>

@interface CALayer (SCLayout)

@property (nonatomic) CGFloat sc_x;                                                 ///< Layer的x值 -> self.frame.origin.x
@property (nonatomic) CGFloat sc_y;                                                 ///< Layer的y值 -> self.frame.origin.y
@property (nonatomic) CGPoint sc_origin;                                            ///< Layer的origin值 -> self.frame.origin
@property (nonatomic) CGFloat sc_width;                                             ///< Layer的width值 -> self.frame.size.width
@property (nonatomic) CGFloat sc_height;                                            ///< Layer的height值 -> self.frame.size.height
@property (nonatomic, getter=sc_frameSize, setter=setSc_frameSize:) CGSize sc_size; ///< Layer的size值 -> self.frame.size
@property (nonatomic) CGFloat sc_centerX;                                           ///< Layer的center值 -> self.center
@property (nonatomic) CGFloat sc_centerY;                                           ///< Layer的centerX值 -> self.center.x
@property (nonatomic) CGPoint sc_center;                                            ///< Layer的centerY值 -> self.center.y
@property (nonatomic) CGFloat sc_left;                                              ///< self.frame.origin.x
@property (nonatomic) CGFloat sc_top;                                               ///< self.frame.origin.y
@property (nonatomic) CGFloat sc_right;                                             ///< self.frame.origin.x + self.frame.size.width
@property (nonatomic) CGFloat sc_bottom;                                            ///< self.frame.origin.y + self.frame.size.height

@end

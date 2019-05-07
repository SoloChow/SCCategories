//
//  UIControl+SCRepeatClickPrevention.h
//  Pods
//
//  Created by Solo on 17/2/11.
//
//  重复点击保护处理

#import <UIKit/UIKit.h>

@interface UIControl (SCRepeatClickPrevention)

@property (nonatomic, assign) BOOL sc_repeatClickPrevention;         ///< 是否开启重复点击保护, 默认为NO
@property (nonatomic, assign) NSTimeInterval sc_acceptEventInterval; ///< 指定秒数间隔后响应事件, 仅当sc_repeatClickPrevention为YES时有效

@end

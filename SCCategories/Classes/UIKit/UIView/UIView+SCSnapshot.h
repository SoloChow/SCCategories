//
//  UIView+SCSnapshot.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  截图

#import <UIKit/UIKit.h>

@interface UIView (SCSnapshot)

/**
 获取当前View截图
 
 @return 当前View截图
 */
- (UIImage *)sc_snapshotImage;

/**
 获取当前View截图(当前屏幕所有重绘操作完成后截图)
 
 @param afterUpdates 是否在屏幕完成所有重绘操作后截屏
 @return 当前view截图
 */
- (UIImage *)sc_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@end

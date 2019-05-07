//
//  CALayer+SCSnapshot.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  截图

#import <QuartzCore/QuartzCore.h>


@class UIImage;

@interface CALayer (SCSnapshot)

/**
 获取当前layer截图(无视transform, 根据bouns截图)
 
 @return 当前layer截图
 */
- (UIImage *)sc_snapshotImage;

@end

//
//  CALayer+SCTransform.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//  Transform处理

#import <QuartzCore/QuartzCore.h>

@interface CALayer (SCTransform)

@property (nonatomic) CGFloat sc_transformRotation;     ///< transform旋转角度(key path "tranform.rotation")
@property (nonatomic) CGFloat sc_transformRotationX;    ///< transformX轴方向旋转(key path "tranform.rotation.x")
@property (nonatomic) CGFloat sc_transformRotationY;    ///< transformY轴方向旋转(key path "tranform.rotation.y")
@property (nonatomic) CGFloat sc_transformRotationZ;    ///< transformZ轴方向旋转(key path "tranform.rotation.z")
@property (nonatomic) CGFloat sc_transformScale;        ///< transform放大系数(key path "tranform.scale")
@property (nonatomic) CGFloat sc_transformScaleX;       ///< transformX轴方向放大(key path "tranform.scale.x")
@property (nonatomic) CGFloat sc_transformScaleY;       ///< transformY轴方向放大(key path "tranform.scale.y")
@property (nonatomic) CGFloat sc_transformScaleZ;       ///< transformZ轴方向放大(key path "tranform.scale.z")
@property (nonatomic) CGFloat sc_transformTranslationX; ///< transformX轴方向平移(key path "tranform.translation.x")
@property (nonatomic) CGFloat sc_transformTranslationY; ///< transformY轴方向平移(key path "tranform.translation.y")
@property (nonatomic) CGFloat sc_transformTranslationZ; ///< transformZ轴方向平移(key path "tranform.translation.z")
@property (nonatomic) CGFloat sc_transformDepth;        ///< transform透视效果(transform.m34, 可选用-1/1000, 应在其他transform前设置)

@end

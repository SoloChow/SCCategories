//
//  CALayer+SCTransform.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "CALayer+SCTransform.h"

@implementation CALayer (SCTransform)

- (CGFloat)sc_transformRotation {
    NSNumber *value = [self valueForKeyPath:@"transform.rotation"];
    return value.doubleValue;
}

- (void)setSc_transformRotation:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.rotation"];
}

- (CGFloat)sc_transformRotationX {
    NSNumber *value = [self valueForKeyPath:@"transform.rotation.x"];
    return value.doubleValue;
}

- (void)setSc_transformRotationX:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.rotation.x"];
}

- (CGFloat)sc_transformRotationY {
    NSNumber *value = [self valueForKeyPath:@"transform.rotation.y"];
    return value.doubleValue;
}

- (void)setSc_transformRotationY:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.rotation.y"];
}

- (CGFloat)sc_transformRotationZ {
    NSNumber *value = [self valueForKeyPath:@"transform.rotation.z"];
    return value.doubleValue;
}

- (void)setSc_transformRotationZ:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.rotation.z"];
}

- (CGFloat)sc_transformScaleX {
    NSNumber *value = [self valueForKeyPath:@"transform.scale.x"];
    return value.doubleValue;
}

- (void)setSc_transformScaleX:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.scale.x"];
}

- (CGFloat)sc_transformScaleY {
    NSNumber *value = [self valueForKeyPath:@"transform.scale.y"];
    return value.doubleValue;
}

- (void)setSc_transformScaleY:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.scale.y"];
}

- (CGFloat)sc_transformScaleZ {
    NSNumber *value = [self valueForKeyPath:@"transform.scale.z"];
    return value.doubleValue;
}

- (void)setSc_transformScaleZ:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.scale.z"];
}

- (CGFloat)sc_transformScale {
    NSNumber *value = [self valueForKeyPath:@"transform.scale"];
    return value.doubleValue;
}

- (void)setSc_transformScale:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.scale"];
}

- (CGFloat)sc_transformTranslationX {
    NSNumber *value = [self valueForKeyPath:@"transform.translation.x"];
    return value.doubleValue;
}

- (void)setSc_transformTranslationX:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.translation.x"];
}

- (CGFloat)sc_transformTranslationY {
    NSNumber *value = [self valueForKeyPath:@"transform.translation.y"];
    return value.doubleValue;
}

- (void)setSc_transformTranslationY:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.translation.y"];
}

- (CGFloat)sc_transformTranslationZ {
    NSNumber *value = [self valueForKeyPath:@"transform.translation.z"];
    return value.doubleValue;
}

- (void)setSc_transformTranslationZ:(CGFloat)value {
    [self setValue:@(value) forKeyPath:@"transform.translation.z"];
}

- (CGFloat)sc_transformDepth {
    return self.transform.m34;
}

- (void)setSc_transformDepth:(CGFloat)value {
    CATransform3D transform = self.transform;
    transform.m34 = value;
    self.transform = transform;
}

@end

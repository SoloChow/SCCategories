//
//  CALayer+SCBase.m
//  SCCategories
//
//  Created by Solo on 17/1/6.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "CALayer+SCBase.h"
#import "SCCoreGraphicHelper.h"

@implementation CALayer (SCBase)

#pragma mark - Base
- (UIViewContentMode)sc_contentMode {
    return SCCAGravityToUIViewContentMode(self.contentsGravity);
}

- (void)setSc_contentMode:(UIViewContentMode)contentMode {
    self.contentsGravity = SCUIViewContentModeToCAGravity(contentMode);
}

- (void)sc_removeAllSublayers {
    while (self.sublayers.count) {
        [self.sublayers.lastObject removeFromSuperlayer];
    }
}

@end

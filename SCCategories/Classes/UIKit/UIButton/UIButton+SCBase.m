//
//  UIButton+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/12.
//
//

#import "UIButton+SCBase.h"

static const CGFloat SCButtonSpacing = 4.0f;

@implementation UIButton (SCBase)

#pragma mark - Base
- (void)sc_verticalImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}

- (void)sc_verticalImageAndTitle
{
    [self sc_verticalImageAndTitle:SCButtonSpacing];
}

- (void)sc_invertedImageAndTitle:(CGFloat)spacing {
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + spacing/2, 0, -(titleSize.width + spacing/2));
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width + spacing/2), 0, imageSize.width + spacing/2);
}

- (void)sc_invertedImageAndTitle {
    [self sc_invertedImageAndTitle:SCButtonSpacing];
}

@end

//
//  UIBarButtonItem+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UIBarButtonItem+SCBase.h"
#import "NSObject+SCAssociatedValue.h"
#import "UIControl+SCBase.h"
#import "UIGestureRecognizer+SCBase.h"
#import "UIView+SCLayout.h"

static const int SC_BAR_BUTTON_ITEM_BLOCK_KEY;

@interface SCUIBarButtonItemBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation SCUIBarButtonItemBlockTarget

- (id)initWithBlock:(void (^)(id sender))block {
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    !self.block?:self.block(sender);
}

@end


@implementation UIBarButtonItem (SCBase)

#pragma mark - Base
- (void)_sc_setActionBlock:(void (^)(id sender))block {
    SCUIBarButtonItemBlockTarget *target = [[SCUIBarButtonItemBlockTarget alloc] initWithBlock:block];
    [self sc_setAssociatedValue:target withKey:&SC_BAR_BUTTON_ITEM_BLOCK_KEY];
    
    [self setTarget:target];
    [self setAction:@selector(invoke:)];
}

- (void (^)(id sender))_sc_actionBlock {
    SCUIBarButtonItemBlockTarget *target = [self sc_getAssociatedValueForKey:&SC_BAR_BUTTON_ITEM_BLOCK_KEY];
    return target.block;
}

+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithImage:image style:style target:target action:action];
}

+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlock:(void (^)(id sender))actionBlock {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:style target:nil action:NULL];
    
    !actionBlock?:[barButtonItem _sc_setActionBlock:actionBlock];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:target action:action];
}

+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style actionBlock:(void (^)(id sender))actionBlock {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:nil action:NULL];
    
    !actionBlock?:[barButtonItem _sc_setActionBlock:actionBlock];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.opaque = YES;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    button.sc_size = button.currentImage.size; // 避免图片拉伸
    
    return [UIBarButtonItem sc_barButtonItemWithCustomView:button target:target action:action];;
}

+ (UIBarButtonItem *)sc_barButtonItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage actionBlock:(void (^)(id sender))actionBlock {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.opaque = YES;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    button.sc_size = button.currentImage.size; // 避免图片拉伸
    
    return [UIBarButtonItem sc_barButtonItemWithCustomView:button actionBlock:actionBlock];
}

+ (UIBarButtonItem *)sc_barButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
}

+ (UIBarButtonItem *)sc_barButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlock:(void (^)(id sender))actionBlock {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:style target:nil action:NULL];
    
    !actionBlock?:[barButtonItem _sc_setActionBlock:actionBlock];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)sc_barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
}

+ (UIBarButtonItem *)sc_barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem actionBlock:(void (^)(id sender))actionBlock {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:nil action:NULL];
    
    !actionBlock?:[barButtonItem _sc_setActionBlock:actionBlock];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)sc_barButtonItemWithCustomView:(UIView *)customView target:(id)target action:(SEL)action {
    if (!customView) return nil;
    
    if ([customView isKindOfClass:[UIControl class]]) {
        [(UIControl *)customView addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    } else {
        [customView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    }
    
    return  [[UIBarButtonItem alloc] initWithCustomView:customView];
}

+ (UIBarButtonItem *)sc_barButtonItemWithCustomView:(UIView *)customView actionBlock:(void (^)(id sender))actionBlock
{
    if (!customView) return nil;
    
    if ([customView isKindOfClass:[UIControl class]]) {
        [(UIControl *)customView sc_setBlockForTouchUpInsideControlEvent:actionBlock];
    } else {
        [customView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:actionBlock]];
    }
    
    return [[UIBarButtonItem alloc] initWithCustomView:customView];
}



@end

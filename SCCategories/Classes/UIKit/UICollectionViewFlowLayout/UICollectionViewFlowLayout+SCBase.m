//
//  UICollectionViewFlowLayout+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UICollectionViewFlowLayout+SCBase.h"

@implementation UICollectionViewFlowLayout (SCBase)

#pragma mark - Base
- (CGFloat)sc_itemSizeWidth {
    return self.itemSize.width;
}

- (void)setSc_itemSizeWidth:(CGFloat)itemSizeWidth {
    CGSize itemSize = self.itemSize;
    itemSize.width = itemSizeWidth;
    self.itemSize = itemSize;
}

- (CGFloat)sc_itemSizeHeight {
    return self.itemSize.height;
}

- (void)setSc_itemSizeHeight:(CGFloat)itemSizeHeight {
    CGSize itemSize = self.itemSize;
    itemSize.height = itemSizeHeight;
    self.itemSize = itemSize;
}

- (CGFloat)sc_estimatedItemSizeWidth {
    return self.estimatedItemSize.width;
}

- (void)setSc_estimatedItemSizeWidth:(CGFloat)estimatedItemSizeWidth {
    CGSize estimatedItemSize = self.estimatedItemSize;
    estimatedItemSize.width = estimatedItemSizeWidth;
    self.estimatedItemSize = estimatedItemSize;
}

- (CGFloat)sc_estimatedItemSizeHeight {
    return self.estimatedItemSize.height;
}

- (void)setSc_estimatedItemSizeHeight:(CGFloat)estimatedItemSizeHeight {
    CGSize estimatedItemSize = self.estimatedItemSize;
    estimatedItemSize.height = estimatedItemSizeHeight;
    self.estimatedItemSize = estimatedItemSize;
}

- (CGFloat)sc_headerReferenceSizeWidth {
    return self.headerReferenceSize.width;
}

- (void)setSc_headerReferenceSizeWidth:(CGFloat)headerReferenceSizeWidth {
    CGSize headerReferenceSize = self.headerReferenceSize;
    headerReferenceSize.width = headerReferenceSizeWidth;
    self.headerReferenceSize = headerReferenceSize;
}

- (CGFloat)sc_headerReferenceSizeHeight {
    return self.headerReferenceSize.height;
}

- (void)setSc_headerReferenceSizeHeight:(CGFloat)headerReferenceSizeHeight {
    CGSize headerReferenceSize = self.headerReferenceSize;
    headerReferenceSize.height = headerReferenceSizeHeight;
    self.headerReferenceSize = headerReferenceSize;
}

- (CGFloat)sc_footerReferenceSizeWidth {
    return self.footerReferenceSize.width;
}

- (void)setSc_footerReferenceSizeWidth:(CGFloat)footerReferenceSizeWidth {
    CGSize footerReferenceSize = self.footerReferenceSize;
    footerReferenceSize.width = footerReferenceSizeWidth;
    self.footerReferenceSize = footerReferenceSize;
}

- (CGFloat)sc_footerReferenceSizeHeight {
    return self.footerReferenceSize.height;
}

- (void)setSc_footerReferenceSizeHeight:(CGFloat)footerReferenceSizeHeight {
    CGSize footerReferenceSize = self.footerReferenceSize;
    footerReferenceSize.height = footerReferenceSizeHeight;
    self.footerReferenceSize = footerReferenceSize;
}

- (CGFloat)sc_sectionInsetTop {
    return self.sectionInset.top;
}

- (void)setSc_sectionInsetTop:(CGFloat)sectionInsetTop {
    UIEdgeInsets sectionInset = self.sectionInset;
    sectionInset.top = sectionInsetTop;
    self.sectionInset = sectionInset;
}

- (CGFloat)sc_sectionInsetLeft
{
    return self.sectionInset.left;
}

- (void)setSc_sectionInsetLeft:(CGFloat)sectionInsetLeft
{
    UIEdgeInsets sectionInset = self.sectionInset;
    sectionInset.left = sectionInsetLeft;
    self.sectionInset = sectionInset;
}

- (CGFloat)sc_sectionInsetBottom
{
    return self.sectionInset.bottom;
}

- (void)setSc_sectionInsetBottom:(CGFloat)sectionInsetBottom
{
    UIEdgeInsets sectionInset = self.sectionInset;
    sectionInset.bottom = sectionInsetBottom;
    self.sectionInset = sectionInset;
}

- (CGFloat)sc_sectionInsetRight
{
    return self.sectionInset.right;
}

- (void)setSc_sectionInsetRight:(CGFloat)sectionInsetRight
{
    UIEdgeInsets sectionInset = self.sectionInset;
    sectionInset.right = sectionInsetRight;
    self.sectionInset = sectionInset;
}

@end

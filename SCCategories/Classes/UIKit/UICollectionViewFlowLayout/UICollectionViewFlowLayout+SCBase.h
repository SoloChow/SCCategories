//
//  UICollectionViewFlowLayout+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionViewFlowLayout (SCBase)

#pragma mark - Base
@property (nonatomic) CGFloat sc_itemSizeWidth;             ///< itemSize的宽度值 -> self.itemSize.width
@property (nonatomic) CGFloat sc_itemSizeHeight;            ///< itemSize的高度值 -> self.itemSize.height
@property (nonatomic) CGFloat sc_estimatedItemSizeWidth;    ///< estimatedItemSize的宽度值 -> self.estimatedItemSize.width
@property (nonatomic) CGFloat sc_estimatedItemSizeHeight;   ///< estimatedItemSize的高度值 -> self.estimatedItemSize.height
@property (nonatomic) CGFloat sc_headerReferenceSizeWidth;  ///< headerReferenceSize的宽度值 -> self.headerReferenceSize.width
@property (nonatomic) CGFloat sc_headerReferenceSizeHeight; ///< headerReferenceSize的高度值 -> self.headerReferenceSize.height
@property (nonatomic) CGFloat sc_footerReferenceSizeWidth;  ///< footerReferenceSize的宽度值 -> self.footerReferenceSize.width
@property (nonatomic) CGFloat sc_footerReferenceSizeHeight; ///< footerReferenceSize的高度值 -> self.footerReferenceSize.height
@property (nonatomic) CGFloat sc_sectionInsetTop;           ///< sectionInset的上部值 -> self.sectonInset.top
@property (nonatomic) CGFloat sc_sectionInsetLeft;          ///< sectionInset的左部值 -> self.sectonInset.left
@property (nonatomic) CGFloat sc_sectionInsetBottom;        ///< sectionInset的下部值 -> self.sectonInset.bottom
@property (nonatomic) CGFloat sc_sectionInsetRight;         ///< sectionInset的右部值 -> self.sectonInset.right

@end

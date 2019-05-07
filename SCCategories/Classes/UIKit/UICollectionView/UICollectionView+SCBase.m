//
//  UICollectionView+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UICollectionView+SCBase.h"
#import "NSArray+SCSort.h"

@implementation UICollectionView (SCBase)

#pragma mark - Base
- (void)sc_setupDataSourceDelegate:(id)dataSourceDelegate {
    self.dataSource = dataSourceDelegate;
    self.delegate = dataSourceDelegate;
}

- (void)sc_removeDataSourceDelegate {
    self.dataSource = nil;
    self.delegate = nil;
}

- (void)sc_registerNib:(UINib *)nib forHeaderViewWithReuseIdentifier:(NSString *)identifier {
    [self registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
}

- (void)sc_registerNib:(UINib *)nib forFooterViewWithReuseIdentifier:(NSString *)identifier {
    [self registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier];
}

- (void)sc_registerClass:(Class)viewClass forHeaderViewWithReuseIdentifier:(NSString *)identifier {
    [self registerClass:viewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
}

- (void)sc_registerClass:(Class)viewClass forFooterViewWithReuseIdentifier:(NSString *)identifier {
    [self registerClass:viewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier];
}

- (__kindof UICollectionReusableView *)sc_dequeueReusableHeaderViewWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
}

- (__kindof UICollectionReusableView *)sc_dequeueReusableFooterViewWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier forIndexPath:indexPath];
}

#pragma mark - ScrollTo
- (void)sc_scrollToSection:(NSUInteger)section atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated {
    [self sc_scrollToItem:0 inSection:section atScrollPosition:scrollPosition animated:animated];
}

- (void)sc_scrollToItem:(NSUInteger)item inSection:(NSUInteger)section {
    [self sc_scrollToItem:item inSection:section atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

- (void)sc_scrollToItem:(NSUInteger)item inSection:(NSUInteger)section animated:(BOOL)animated {
    [self sc_scrollToItem:item inSection:section atScrollPosition:UICollectionViewScrollPositionTop animated:animated];
}

- (void)sc_scrollToItem:(NSUInteger)item inSection:(NSUInteger)section atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

#pragma mark - Insert
- (void)sc_insertItem:(NSUInteger)item inSection:(NSUInteger)section {
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self sc_insertItemAtIndexPath:toIndexPath];
}

- (void)sc_insertItemAtIndexPath:(NSIndexPath *)indexPath {
    [self insertItemsAtIndexPaths:@[indexPath]];
}

- (void)sc_insertSection:(NSUInteger)section {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self insertSections:sections];
}

#pragma mark - Delete
- (void)sc_deleteItem:(NSUInteger)item inSection:(NSUInteger)section {
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self sc_deleteItemAtIndexPath:toIndexPath];
}

- (void)sc_deleteItemAtIndexPath:(NSIndexPath *)indexPath {
    [self deleteItemsAtIndexPaths:@[indexPath]];
}

- (void)sc_deleteItemsAtIndexPath:(NSArray<NSIndexPath *> *)indexPaths deleteOrder:(SCUICollectionViewDeleteOrder)deleteOrder {
    NSArray *deletedIndexPaths = indexPaths;
    
    if (indexPaths.count > 1 && deleteOrder != SCUICollectionViewDeleteOrderNone) {
        if (deleteOrder == SCUICollectionViewDeleteOrderAscending) { // 正序
            deletedIndexPaths = [deletedIndexPaths sc_sortedArrayInAscending];
        }
        else if (deleteOrder == SCUICollectionViewDeleteOrderDecending) { // 逆序
            deletedIndexPaths = [deletedIndexPaths sc_sortedArrayInDescending];
        }
    }
    [self deleteItemsAtIndexPaths:deletedIndexPaths];
}

- (void)sc_deleteSection:(NSUInteger)section {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self deleteSections:sections];
}

#pragma mark - Reload
- (void)sc_reloadItem:(NSUInteger)item inSection:(NSUInteger)section {
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self sc_reloadItemAtIndexPath:toIndexPath];
}

- (void)sc_reloadItemAtIndexPath:(NSIndexPath *)indexPath {
    [self reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)sc_reloadSection:(NSUInteger)section {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:sections];
}

#pragma mark - Select
- (void)sc_clearSelectedItems:(BOOL)animated {
    NSArray *indexs = [self indexPathsForSelectedItems];
    __weak typeof(self) weakSelf = self;
    [indexs enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
        [weakSelf deselectItemAtIndexPath:indexPath animated:animated];
    }];
}


@end


@implementation NSIndexPath (SCUICollectionView)

- (BOOL)sc_isEqualToItem:(NSIndexPath *)indexPath {
    if (!indexPath) return NO;
    if (![indexPath isKindOfClass:[NSIndexPath class]]) return NO;
    if (self == indexPath) return YES;
    
    return self.item == indexPath.item;
}

- (NSIndexPath *)sc_indexPathByAddingItem:(NSUInteger)item {
    return [NSIndexPath indexPathForItem:self.item+item inSection:self.section];
}

- (NSIndexPath *)sc_indexPathByAddingItem:(NSUInteger)item section:(NSInteger)section {
    return [NSIndexPath indexPathForItem:self.item+item inSection:self.section+section];
}


@end

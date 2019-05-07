//
//  UITableView+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import "UITableView+SCBase.h"
#import "NSArray+SCSort.h"

@implementation UITableView (SCBase)

#pragma mark - Base
- (void)sc_setupDataSourceDelegate:(id)dataSourceDelegate {
    self.dataSource = dataSourceDelegate;
    self.delegate = dataSourceDelegate;
}

- (void)sc_removeDataSourceDelegate {
    self.dataSource = nil;
    self.delegate = nil;
}

- (void)sc_updateWithBlock:(void(^)(UITableView *tableView))block {
    __weak typeof(self) weakSelf = self;
    [self beginUpdates];
    block(weakSelf);
    [self endUpdates];
}

#pragma mark - ScrollTo
- (void)sc_scrollToRow:(NSUInteger)row inSection:(NSUInteger)section {
    [self sc_scrollToRow:row inSection:section atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)sc_scrollToRow:(NSUInteger)row inSection:(NSUInteger)section animated:(BOOL)animated {
    [self sc_scrollToRow:row inSection:section atScrollPosition:UITableViewScrollPositionTop animated:animated];
}

- (void)sc_scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

#pragma mark - Insert
- (void)sc_insertRow:(NSUInteger)row inSection:(NSUInteger)section {
    [self sc_insertRow:row inSection:section withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toInsert = [NSIndexPath indexPathForRow:row inSection:section];
    [self sc_insertRowAtIndexPath:toInsert withRowAnimation:animation];
}

- (void)sc_insertRowAtIndexPath:(NSIndexPath *)indexPath {
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)sc_insertSection:(NSUInteger)section {
    [self sc_insertSection:section withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self insertSections:sections withRowAnimation:animation];
}

#pragma mark - Delete
- (void)sc_deleteRow:(NSUInteger)row inSection:(NSUInteger)section {
    [self sc_deleteRow:row inSection:section withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toDelete = [NSIndexPath indexPathForRow:row inSection:section];
    [self sc_deleteRowAtIndexPath:toDelete withRowAnimation:animation];
}

- (void)sc_deleteRowAtIndexPath:(NSIndexPath *)indexPath {
    [self sc_deleteRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)sc_deleteRowsAtIndexPath:(NSArray<NSIndexPath *> *)indexPaths deleteOrder:(SCUITableViewDeleteOrder)deleteOrder withRowAnimation:(UITableViewRowAnimation)animation {
    NSArray *deletedIndexPaths = indexPaths;
    
    if (indexPaths.count > 1 && deleteOrder != SCUITableViewDeleteOrderNone) {
        if (deleteOrder == SCUITableViewDeleteOrderAscending) { // 正序
            deletedIndexPaths = [deletedIndexPaths sc_sortedArrayInAscending];
        } else if (deleteOrder == SCUITableViewDeleteOrderDecending) { // 逆序
            deletedIndexPaths = [deletedIndexPaths sc_sortedArrayInDescending];
        }
    }
    [self deleteRowsAtIndexPaths:deletedIndexPaths withRowAnimation:animation];
}

- (void)sc_deleteSection:(NSUInteger)section {
    [self sc_deleteSection:section withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self deleteSections:sections withRowAnimation:animation];
}

#pragma mark - Reload
- (void)sc_reloadRow:(NSUInteger)row inSection:(NSUInteger)section {
    [self sc_reloadRow:row inSection:section withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *toReload = [NSIndexPath indexPathForRow:row inSection:section];
    [self sc_reloadRowAtIndexPath:toReload withRowAnimation:animation];
}

- (void)sc_reloadRowAtIndexPath:(NSIndexPath *)indexPath {
    [self sc_reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)sc_reloadVisibleRows {
    [self reloadRowsAtIndexPaths:self.indexPathsForVisibleRows withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_reloadVisibleRowsWithRowAnimation:(UITableViewRowAnimation)animation {
    [self reloadRowsAtIndexPaths:self.indexPathsForVisibleRows withRowAnimation:animation];
}

- (void)sc_reloadSection:(NSUInteger)section {
    [self sc_reloadSection:section withRowAnimation:UITableViewRowAnimationNone];
}

- (void)sc_reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:sections withRowAnimation:animation];
}

#pragma mark - Select
- (void)sc_clearSelectedRows:(BOOL)animated {
    NSArray *indexs = [self indexPathsForSelectedRows];
    [indexs enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
        [self deselectRowAtIndexPath:indexPath animated:animated];
    }];
}

@end


@implementation  NSIndexPath (SCUITableView)

- (BOOL)sc_isEqualToSection:(NSIndexPath *)indexPath {
    if (!indexPath) return NO;
    if (![indexPath isKindOfClass:[NSIndexPath class]]) return NO;
    if (self == indexPath) return YES;
    
    return self.section == indexPath.section;
}

- (BOOL)sc_isEqualToRow:(NSIndexPath *)indexPath {
    if (!indexPath) return NO;
    if (![indexPath isKindOfClass:[NSIndexPath class]]) return NO;
    if (self == indexPath) return YES;
    
    return self.row == indexPath.row;
}

- (NSIndexPath *)sc_indexPathByAddingSection:(NSUInteger)section {
    return [NSIndexPath indexPathForRow:self.row inSection:self.section+section];
}

- (NSIndexPath *)sc_indexPathByAddingRow:(NSUInteger)row {
    return [NSIndexPath indexPathForRow:self.row+row inSection:self.section];
}

- (NSIndexPath *)sc_indexPathByAddingRow:(NSUInteger)row section:(NSInteger)section {
    return [NSIndexPath indexPathForRow:self.row+row inSection:self.section+section];
}


@end

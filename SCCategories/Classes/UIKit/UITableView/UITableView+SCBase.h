//
//  UITableView+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SCUITableViewDeleteOrder) { // 删除顺序
    SCUITableViewDeleteOrderNone = 0,                  // 无序
    SCUITableViewDeleteOrderAscending,                 // 正序
    SCUITableViewDeleteOrderDecending                  // 逆序
};

@interface UITableView (SCBase)

#pragma mark - Base
/**
 设置DataSource和Delegate执行者, 执行者须遵循<UITableViewDataSource, UITableViewDelegate>协议

 @param dataSourceDelegate DataSource和Delegate执行者
 */
- (void)sc_setupDataSourceDelegate:(id)dataSourceDelegate;

/**
 *  移除DataSource和Delegate执行者(nil)
 */
- (void)sc_removeDataSourceDelegate;

/**
 标记一个tableView的动画块,  增、删、选中rows或sections时使用, 协调UITableView的动画效果(在动画块内, 不建议使用reloadData方法, 会影响动画效果)

 @param block 动画块
 */
- (void)sc_updateWithBlock:(void(^)(UITableView *tableView))block;

#pragma mark - ScrollTo
/**
 滑动到指定Section和Row(滑动到Row顶部, 默认动画)

 @param row     Row
 @param section Section
 */
- (void)sc_scrollToRow:(NSUInteger)row inSection:(NSUInteger)section;

/**
 *  滑动到指定Section和Row(滑动到Row顶部)
 *
 *  @param row      Row
 *  @param section  Section
 *  @param animated 动画
 */
- (void)sc_scrollToRow:(NSUInteger)row
             inSection:(NSUInteger)section
              animated:(BOOL)animated;

/**
 滑动到指定Section和Row

 @param row            Row
 @param section        Section
 @param scrollPosition 滑动位置
 @param animated       动画
 */
- (void)sc_scrollToRow:(NSUInteger)row
             inSection:(NSUInteger)section
      atScrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated;

#pragma mark - Insert
/**
 根据指定的Section和Row, 插入Row(无动画)

 @param row     Row
 @param section Section
 */
- (void)sc_insertRow:(NSUInteger)row inSection:(NSUInteger)section;

/**
 *  根据指定的Section和Row, 插入Row
 *
 *  @param row       Row
 *  @param section   Section
 *  @param animation 动画
 */
- (void)sc_insertRow:(NSUInteger)row
           inSection:(NSUInteger)section
    withRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据IndexPath, 插入Row(无动画)

 @param indexPath IndexPath
 */
- (void)sc_insertRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 根据IndexPath, 插入Row

 @param indexPath IndexPath
 @param animation 动画
 */
- (void)sc_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据指定的Section, 插入Section(无动画)

 @param section Section
 */
- (void)sc_insertSection:(NSUInteger)section;

/**
 根据指定的Section, 插入Section

 @param section   Section
 @param animation 动画
 */
- (void)sc_insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

#pragma mark - Delete
/**
 根据指定的Section和Row, 删除Row(无动画)

 @param row     Row
 @param section Section
 */
- (void)sc_deleteRow:(NSUInteger)row inSection:(NSUInteger)section;

/**
 根据指定的Section和Row, 删除Row

 @param row       Row
 @param section   Section
 @param animation 动画
 */
- (void)sc_deleteRow:(NSUInteger)row
           inSection:(NSUInteger)section
    withRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据IndexPath, 删除Row(无动画)

 @param indexPath IndexPath
 */
- (void)sc_deleteRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 根据IndexPath, 删除Row

 @param indexPath IndexPath
 @param animation 动画
 */
- (void)sc_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据一组IndexPaths, 删除指定的Row(无序/正序/逆序删除)

 @param indexPaths  一组IndexPaths
 @param deleteOrder 删除顺序
 @param animation   动画
 */
- (void)sc_deleteRowsAtIndexPath:(NSArray<NSIndexPath *> *)indexPaths
                     deleteOrder:(SCUITableViewDeleteOrder)deleteOrder
                withRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据指定的Section, 删除Section(无动画)

 @param section Section
 */
- (void)sc_deleteSection:(NSUInteger)section;

/**
 根据指定的Section, 删除Section

 @param section   Section
 @param animation 动画
 */
- (void)sc_deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

#pragma mark - Reload
/**
 根据指定的Section和Row, 刷新Row(无动画)

 @param row     Row
 @param section Section
 */
- (void)sc_reloadRow:(NSUInteger)row inSection:(NSUInteger)section;

/**
 根据指定的Section和Row, 刷新Row

 @param row Row
 @param section Section
 @param animation 动画
 */
- (void)sc_reloadRow:(NSUInteger)row
           inSection:(NSUInteger)section
    withRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据指定的IndexPath, 刷新Row(无动画)

 @param indexPath IndexPath
 */
- (void)sc_reloadRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 根据指定的IndexPath, 刷新Row

 @param indexPath IndexPath
 @param animation 动画
 */
- (void)sc_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 刷新当前可见的所有Rows(无动画)
 */
- (void)sc_reloadVisibleRows;

/**
 刷新当前可见的所有Rows

 @param animation 动画
 */
- (void)sc_reloadVisibleRowsWithRowAnimation:(UITableViewRowAnimation)animation;

/**
 根据指定的Section, 刷新Section(无动画)

 @param section Section
 */
- (void)sc_reloadSection:(NSUInteger)section;

/**
 根据指定的Section, 刷新Section

 @param section   Section
 @param animation 动画
 */
- (void)sc_reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

#pragma mark - Select
/**
 清除所有选中Rows的选中状态

 @param animated 动画
 */
- (void)sc_clearSelectedRows:(BOOL)animated;

@end


@interface NSIndexPath (SCUITableView)

/**
 判断两个IndexPath的Section是否相等

 @param indexPath 另一个IndexPath
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToSection:(NSIndexPath *)indexPath;

/**
 判断两个IndexPath的Row是否相等

 @param indexPath 另一个IndexPath
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToRow:(NSIndexPath *)indexPath;

/**
 指定添加Section数, 获取新IndexPath(Row不变)

 @param section 添加Section数
 @return 新IndexPath(Row不变)
 */
- (NSIndexPath *)sc_indexPathByAddingSection:(NSUInteger)section;

/**
 指定添加Row数, 获取新的IndexPath(Section不变)

 @param row 添加Row数
 @return 新IndexPath(Section不变)
 */
- (NSIndexPath *)sc_indexPathByAddingRow:(NSUInteger)row;

/**
 指定添加Row数和Section数, 获取新的IndexPath

 @param row     添加Row数
 @param section 添加Section数
 @return 新IndexPath
 */
- (NSIndexPath *)sc_indexPathByAddingRow:(NSUInteger)row section:(NSInteger)section;

@end

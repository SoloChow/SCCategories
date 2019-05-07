//
//  UICollectionView+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/11.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SCUICollectionViewDeleteOrder) { // 删除顺序
    SCUICollectionViewDeleteOrderNone = 0,                  // 无序
    SCUICollectionViewDeleteOrderAscending,                 // 正序
    SCUICollectionViewDeleteOrderDecending                  // 逆序
};

@interface UICollectionView (SCBase)

#pragma mark - Base
/**
 设置DataSource和Delegate执行者, 执行者须遵循<UICollectionViewDataSource, UICollectionDelegate>协议

 @param dataSourceDelegate DataSource和Delegate执行者
 */
- (void)sc_setupDataSourceDelegate:(id)dataSourceDelegate;

/**
 移除DataSource和Delegate执行者(nil)
 */
- (void)sc_removeDataSourceDelegate;

#pragma mark - Register
/**
 根据Nib文件, 注册HeaderView(SupplementaryView)

 @param nib        Nib文件
 @param identifier 重用标识
 */
- (void)sc_registerNib:(UINib *)nib forHeaderViewWithReuseIdentifier:(NSString *)identifier;

/**
 根据Nib文件, 注册FooterView(SupplementaryView)

 @param nib        Nib文件
 @param identifier 重用标识
 */
- (void)sc_registerNib:(UINib *)nib forFooterViewWithReuseIdentifier:(NSString *)identifier;

/**
 根据View类别, 注册HeaderView(SupplementaryView)

 @param viewClass  View类别
 @param identifier 重用标识
 */
- (void)sc_registerClass:(Class)viewClass forHeaderViewWithReuseIdentifier:(NSString *)identifier;

/**
 根据View类别, 注册FooterView(SupplementaryView)

 @param viewClass  View类别
 @param identifier 重用标识
 */
- (void)sc_registerClass:(Class)viewClass forFooterViewWithReuseIdentifier:(NSString *)identifier;

/**
 根据重用标识和IndexPath，重用HeaderView

 @param identifier 重用标识
 @param indexPath  IndexPath
 @return HeaderView
 */
- (__kindof UICollectionReusableView *)sc_dequeueReusableHeaderViewWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

/**
 根据重用标识和IndexPath，重用FooterView

 @param identifier 重用标识
 @param indexPath  IndexPath
 @return FooterView
 */
- (__kindof UICollectionReusableView *)sc_dequeueReusableFooterViewWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

#pragma mark - ScrollTo
/**
 滑动到指定Section(Item为0)

 @param section        Section
 @param scrollPosition 滑动位置
 @param animated       动画
 */
- (void)sc_scrollToSection:(NSUInteger)section
          atScrollPosition:(UICollectionViewScrollPosition)scrollPosition
                  animated:(BOOL)animated;

/**
 滑动到指定Section和Item(滑动到Item顶部, 默认动画)

 @param item    Item
 @param section 组
 */
- (void)sc_scrollToItem:(NSUInteger)item inSection:(NSUInteger)section;

/**
 滑动到指定Section和Item(滑动到Item顶部)

 @param item     Item
 @param section  Section
 @param animated 动画
 */
- (void)sc_scrollToItem:(NSUInteger)item
              inSection:(NSUInteger)section
               animated:(BOOL)animated;

/**
 滑动到指定Section和Item

 @param item           Item
 @param section        Section
 @param scrollPosition 滑动位置
 @param animated       动画
 */
- (void)sc_scrollToItem:(NSUInteger)item
              inSection:(NSUInteger)section
       atScrollPosition:(UICollectionViewScrollPosition)scrollPosition
               animated:(BOOL)animated;

#pragma mark - Insert
/**
 根据指定的Section和Item, 插入Item

 @param item    Item
 @param section Section
 */
- (void)sc_insertItem:(NSUInteger)item inSection:(NSUInteger)section;

/**
 根据指定的IndexPath, 插入Item

 @param indexPath IndexPath
 */
- (void)sc_insertItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 根据指定的Section, 插入Section

 @param section Section
 */
- (void)sc_insertSection:(NSUInteger)section;

#pragma mark - Delete
/**
 根据指定的Section和Item, 删除Item

 @param item    Item
 @param section Section
 */
- (void)sc_deleteItem:(NSUInteger)item inSection:(NSUInteger)section;

/**
 根据指定的IndexPath, 删除Item

 @param indexPath IndexPath
 */
- (void)sc_deleteItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 根据一组IndexPaths, 删除指定的Item(无序/正序/逆序删除)

 @param indexPaths 一组IndexPaths
 @param deleteOrder 删除顺序
 */
- (void)sc_deleteItemsAtIndexPath:(NSArray<NSIndexPath *> *)indexPaths deleteOrder:(SCUICollectionViewDeleteOrder)deleteOrder;

/**
 根据指定的Section, 删除Section

 @param section Section
 */
- (void)sc_deleteSection:(NSUInteger)section;

#pragma mark - Reload
/**
 根据指定的Section和Item, 刷新Item

 @param item    Item
 @param section Section
 */
- (void)sc_reloadItem:(NSUInteger)item inSection:(NSUInteger)section;

/**
 根据指定的IndexPath, 刷新Item

 @param indexPath IndexPath
 */
- (void)sc_reloadItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 根据指定的Section, 刷新Section

 @param section Section
 */
- (void)sc_reloadSection:(NSUInteger)section;

#pragma mark - Select
/**
 清除所有选中Item的选中状态

 @param animated 动画
 */
- (void)sc_clearSelectedItems:(BOOL)animated;

@end


@interface NSIndexPath (SCUICollectionView)
/**
 判断两个IndexPath的Item是否相等

 @param indexPath 另一个IndexPath
 @return 相等返回YES, 否则返回NO
 */
- (BOOL)sc_isEqualToItem:(NSIndexPath *)indexPath;

/**
 指定添加Item数, 获取新IndexPath(Section不变)

 @param item 添加Item数
 @return 新IndexPath(Section不变)
 */
- (NSIndexPath *)sc_indexPathByAddingItem:(NSUInteger)item;

/**
 指定添加Item数和Section数, 获取新IndexPath

 @param item    添加Item数
 @param section 添加Section数
 @return 新IndexPath
 */
- (NSIndexPath *)sc_indexPathByAddingItem:(NSUInteger)item section:(NSInteger)section;

@end

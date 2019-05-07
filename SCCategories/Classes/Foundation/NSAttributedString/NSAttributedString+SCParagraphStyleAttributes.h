//
//  NSAttributedString+SCParagraphStyleAttributes.h
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (SCParagraphStyleAttributes)

#pragma mark - Line Spacing
/**
 获取索引位置NSAttributedString的ParagraphStyle的行间距, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的行间距, 若无返回默认值
 */
- (CGFloat)sc_lineSpacingAtIndex:(NSUInteger)index;

#pragma mark - Paragraph Spacing
/**
 获取索引位置NSAttributedString的ParagraphStyle的段落间距, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的段落间距, 若无返回默认值
 */
- (CGFloat)sc_paragraphSpacingAtIndex:(NSUInteger)index;

#pragma mark - Alignment
/**
 获取索引位置NSAttributedString的ParagraphStyle的对齐方式, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的对齐方式, 若无返回默认值
 */
- (NSTextAlignment)sc_alignmentAtIndex:(NSUInteger)index;

#pragma mark - Head Indent
/**
 获取索引位置NSAttributedString的ParagraphStyle的整体首部缩进值, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的整体首部缩进值, 若无返回默认值
 */
- (CGFloat)sc_headIndentAtIndex:(NSUInteger)index;

#pragma mark - Tail Indent
/**
 获取索引位置NSAttributedString的ParagraphStyle的整体尾部缩进值, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的整体尾部缩进值, 若无返回默认值
 */
- (CGFloat)sc_tailIndentAtIndex:(NSUInteger)index;

#pragma mark - First Line Head Indent
/**
 获取索引位置NSAttributedString的ParagraphStyle的首行缩进值, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的首行缩进值, 若无返回默认值
 */
- (CGFloat)sc_firstLineHeadIndentAtIndex:(NSUInteger)index;

#pragma mark - MinimumLine Height
/**
 获取索引位置NSAttributedString的ParagraphStyle的最小行高, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的最小行高, 若无返回默认值
 */
- (CGFloat)sc_minimumLineHeightAtIndex:(NSUInteger)index;

#pragma mark - MaximumLine Height
/**
 获取索引位置NSAttributedString的ParagraphStyle的最大行高, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的最大行高, 若无返回默认值
 */
- (CGFloat)sc_maximumLineHeightAtIndex:(NSUInteger)index;

#pragma mark - Line Break Mode
/**
 获取索引位置NSAttributedString的ParagraphStyle的分割模式, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的分割模式, 若无返回默认值
 */
- (NSLineBreakMode)sc_lineBreakModeAtIndex:(NSUInteger)index;

#pragma mark - Base Writing Direction
/**
 获取索引位置NSAttributedString的ParagraphStyle的基础书写方向, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的基础书写方向, 若无返回默认值
 */
- (NSWritingDirection)sc_baseWritingDirectionAtIndex:(NSUInteger)index;

#pragma mark - Line Height Multiple
/**
 获取索引位置NSAttributedString的ParagraphStyle的行高倍数, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的行高倍数, 若无返回默认值
 */
- (CGFloat)sc_lineHeightMultipleAtIndex:(NSUInteger)index;

#pragma mark - Paragraph Spacing Before
/**
 获取索引位置NSAttributedString的ParagraphStyle的段落头部空白, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的段落头部空白, 若无返回默认值
 */
- (CGFloat)sc_paragraphSpacingBeforeAtIndex:(NSUInteger)index;

#pragma mark - Hyphenation Factor
/**
 获取索引位置NSAttributedString的ParagraphStyle的连字系数(0.0/1.0), 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的连字系数(0.0/1.0), 若无返回默认值
 */
- (float)sc_hyphenationFactorAtIndex:(NSUInteger)index;

#pragma mark - Tab Stops
/**
 获取索引位置NSAttributedString的ParagraphStyle的TabStops, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的TabStops, 若无返回默认值
 */
- (NSArray<NSTextTab *> *)sc_tabStopsAtIndex:(NSUInteger)index;

#pragma mark - Default Tab Interval
/**
 获取索引位置NSAttributedString的ParagraphStyle的默认Tab宽度, 若无返回默认值
 
 @param index 索引位置(从0开始)
 @return 索引位置NSAttributedString的ParagraphStyle的默认Tab宽度, 若无返回默认值
 */
- (CGFloat)sc_defaultTabIntervalAtIndex:(NSUInteger)index;

@end


@interface NSMutableAttributedString (SCParagraphStyleAttributes)

#pragma mark - Line Spacing
/**
 根据行间距及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param lineSpacing 行间距
 @param range 设置范围
 */
- (void)sc_setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range;

/**
 根据行间距, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param lineSpacing 行间距
 */
- (void)sc_setLineSpacing:(CGFloat)lineSpacing;

/**
 根据行间距及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param lineSpacing 行间距
 @param range 设置范围
 */
- (void)sc_addLineSpacing:(CGFloat)lineSpacing range:(NSRange)range;

/**
 根据行间距, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param lineSpacing 行间距
 */
- (void)sc_addLineSpacing:(CGFloat)lineSpacing;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的行间距属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeLineSpacingInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的行间距属性(默认值)
 */
- (void)sc_removeLineSpacing;

#pragma mark - Paragraph Spacing
/**
 根据段落间距及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param paragraphSpacing 段落间距
 @param range 设置范围
 */
- (void)sc_setParagraphSpacing:(CGFloat)paragraphSpacing range:(NSRange)range;

/**
 根据段落间距, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param paragraphSpacing 段落间距
 */
- (void)sc_setParagraphSpacing:(CGFloat)paragraphSpacing;

/**
 根据段落间距及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param paragraphSpacing 段落间距
 @param range 设置范围
 */
- (void)sc_addParagraphSpacing:(CGFloat)paragraphSpacing range:(NSRange)range;

/**
 根据段落间距, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param paragraphSpacing 段落间距
 */
- (void)sc_addParagraphSpacing:(CGFloat)paragraphSpacing;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的段落间距属性(默认值)
 
 @param range 设置范围
 */
- (void)sc_removeParagraphSpacingInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的段落间距属性(默认值)
 */
- (void)sc_removeParagraphSpacing;

#pragma mark - Alignment
/**
 根据对齐方式及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param alignment 对齐方式
 @param range 设置范围
 */
- (void)sc_setAlignment:(NSTextAlignment)alignment range:(NSRange)range;

/**
 根据对齐方式, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param alignment 对齐方式
 */
- (void)sc_setAlignment:(NSTextAlignment)alignment;

/**
 根据对齐方式及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param alignment 对齐方式
 @param range 设置范围
 */
- (void)sc_addAlignment:(NSTextAlignment)alignment range:(NSRange)range;

/**
 根据对齐方式, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param alignment 对齐方式
 */
- (void)sc_addAlignment:(NSTextAlignment)alignment;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的对齐方式属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeAlignmentInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的对齐方式属性(默认值)
 */
- (void)sc_removeAlignment;

#pragma mark - Head Indent
/**
 根据整体首部缩进值及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param headIndent 整体首部缩进值
 @param range 设置范围
 */
- (void)sc_setHeadIndent:(CGFloat)headIndent range:(NSRange)range;

/**
 根据整体首部缩进值, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param headIndent 整体首部缩进值
 */
- (void)sc_setHeadIndent:(CGFloat)headIndent;

/**
 根据整体首部缩进值及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param headIndent 整体首部缩进值
 @param range 设置范围
 */
- (void)sc_addHeadIndent:(CGFloat)headIndent range:(NSRange)range;

/**
 根据整体首部缩进值, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param headIndent 整体首部缩进值
 */
- (void)sc_addHeadIndent:(CGFloat)headIndent;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的整体首部缩进属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeHeadIndentInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的整体首部缩进属性(默认值)
 */
- (void)sc_removeHeadIndent;

#pragma mark - Tail Indent
/**
 根据整体尾部缩进值及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param tailIndent 整体尾部缩进值
 @param range 设置范围
 */
- (void)sc_setTailIndent:(CGFloat)tailIndent range:(NSRange)range;

/**
 根据整体尾部缩进值, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param tailIndent 整体尾部缩进值
 */
- (void)sc_setTailIndent:(CGFloat)tailIndent;

/**
 根据整体尾部缩进值及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param tailIndent 整体尾部缩进值
 @param range 设置范围
 */
- (void)sc_addTailIndent:(CGFloat)tailIndent range:(NSRange)range;

/**
 根据整体尾部缩进值, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param tailIndent 整体尾部缩进值
 */
- (void)sc_addTailIndent:(CGFloat)tailIndent;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的整体尾部缩进属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeTailIndentInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的整体尾部缩进属性(默认值)
 */
- (void)sc_removeTailIndent;

#pragma mark - First Line Head Indent
/**
 根据首行缩进值及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param firstLineHeadIndent 首行缩进值
 @param range 设置范围
 */
- (void)sc_setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent range:(NSRange)range;

/**
 根据首行缩进值, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param firstLineHeadIndent 首行缩进值
 */
- (void)sc_setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent;

/**
 根据首行缩进值及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param firstLineHeadIndent 首行缩进值
 @param range 设置范围
 */
- (void)sc_addFirstLineHeadIndent:(CGFloat)firstLineHeadIndent range:(NSRange)range;

/**
 根据首行缩进值, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param firstLineHeadIndent 首行缩进值
 */
- (void)sc_addFirstLineHeadIndent:(CGFloat)firstLineHeadIndent;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的首行缩进属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeFirstLineHeadIndentInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的首行缩进属性(默认值)
 */
- (void)sc_removeFirstLineHeadIndent;

#pragma mark - Minimum Line Height
/**
 根据最小行高及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param minimumLineHeight 最小行高
 @param range 设置范围
 */
- (void)sc_setMinimumLineHeight:(CGFloat)minimumLineHeight range:(NSRange)range;

/**
 根据最小行高, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param minimumLineHeight 最小行高
 */
- (void)sc_setMinimumLineHeight:(CGFloat)minimumLineHeight;

/**
 根据最小行高及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param minimumLineHeight 最小行高
 @param range 设置范围
 */
- (void)sc_addMinimumLineHeight:(CGFloat)minimumLineHeight range:(NSRange)range;

/**
 根据最小行高, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param minimumLineHeight 最小行高
 */
- (void)sc_addMinimumLineHeight:(CGFloat)minimumLineHeight;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的最小行高属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeMinimumLineHeightInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的最小行高属性(默认值)
 */
- (void)sc_removeMinimumLineHeight;

#pragma mark - Maximum Line Height
/**
 根据最大行高及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param maximumLineHeight 最大行高
 @param range 设置范围
 */
- (void)sc_setMaximumLineHeight:(CGFloat)maximumLineHeight range:(NSRange)range;

/**
 根据最大行高, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param maximumLineHeight 最大行高
 */
- (void)sc_setMaximumLineHeight:(CGFloat)maximumLineHeight;

/**
 根据最大行高及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param maximumLineHeight 最大行高
 @param range 设置范围
 */
- (void)sc_addMaximumLineHeight:(CGFloat)maximumLineHeight range:(NSRange)range;

/**
 根据最大行高, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param maximumLineHeight 最大行高
 */
- (void)sc_addMaximumLineHeight:(CGFloat)maximumLineHeight;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的最大行高属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeMaximumLineHeightInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的最大行高属性(默认值)
 */
- (void)sc_removeMaximumLineHeight;

#pragma mark - Line Break Mode
/**
 根据分割模式及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param lineBreakMode 分割模式
 @param range 设置范围
 */
- (void)sc_setLineBreakMode:(NSLineBreakMode)lineBreakMode range:(NSRange)range;

/**
 根据分割模式, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param lineBreakMode 分割模式
 */
- (void)sc_setLineBreakMode:(NSLineBreakMode)lineBreakMode;

/**
 根据分割模式及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param lineBreakMode 分割模式
 @param range 设置范围
 */
- (void)sc_addLineBreakMode:(NSLineBreakMode)lineBreakMode range:(NSRange)range;

/**
 根据分割模式, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param lineBreakMode 分割模式
 */
- (void)sc_addLineBreakMode:(NSLineBreakMode)lineBreakMode;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的分割模式属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeLineBreakModeInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的分割模式属性(默认值)
 */
- (void)sc_removeLineBreakMode;

#pragma mark - Base Writing Direction
/**
 根据基础书写方向及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param baseWritingDirection 基础书写方向
 @param range 设置范围
 */
- (void)sc_setBaseWritingDirection:(NSWritingDirection)baseWritingDirection range:(NSRange)range;

/**
 根据基础书写方向, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param baseWritingDirection 基础书写方向
 */
- (void)sc_setBaseWritingDirection:(NSWritingDirection)baseWritingDirection;

/**
 根据基础书写方向及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param baseWritingDirection 基础书写方向
 @param range 设置范围
 */
- (void)sc_addBaseWritingDirection:(NSWritingDirection)baseWritingDirection range:(NSRange)range;

/**
 根据基础书写方向, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param baseWritingDirection 基础书写方向
 */
- (void)sc_addBaseWritingDirection:(NSWritingDirection)baseWritingDirection;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的基础书写方向属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeBaseWritingDirectionInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的基础书写方向属性(默认值)
 */
- (void)sc_removeBaseWritingDirection;

#pragma mark - Line Height Multiple
/**
 根据行高倍数及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param lineHeightMultiple 行高倍数
 @param range 设置范围
 */
- (void)sc_setLineHeightMultiple:(CGFloat)lineHeightMultiple range:(NSRange)range;

/**
 根据行高倍数, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param lineHeightMultiple 行高倍数
 */
- (void)sc_setLineHeightMultiple:(CGFloat)lineHeightMultiple;

/**
 根据行高倍数及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param lineHeightMultiple 行高倍数
 @param range 设置范围
 */
- (void)sc_addLineHeightMultiple:(CGFloat)lineHeightMultiple range:(NSRange)range;

/**
 根据行高倍数, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param lineHeightMultiple 行高倍数
 */
- (void)sc_addLineHeightMultiple:(CGFloat)lineHeightMultiple;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的行高倍数属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeLineHeightMultipleInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的行高倍数属性(默认值)
 */
- (void)sc_removeLineHeightMultiple;

#pragma mark - Paragraph Spacing Before
/**
 根据段落头部空白及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param paragraphSpacingBefore 段落头部空白
 @param range 设置范围
 */
- (void)sc_setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore range:(NSRange)range;

/**
 根据段落头部空白, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param paragraphSpacingBefore 段落头部空白
 */
- (void)sc_setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore;

/**
 根据段落头部空白及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param paragraphSpacingBefore 段落头部空白
 @param range 设置范围
 */
- (void)sc_addParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore range:(NSRange)range;

/**
 根据段落头部空白, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param paragraphSpacingBefore 段落头部空白
 */
- (void)sc_addParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的段落头部空白属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeParagraphSpacingBeforeInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的段落头部空白属性(默认值)
 */
- (void)sc_removeParagraphSpacingBefore;

#pragma mark - Hyphenation Factor
/**
 根据连字系数(0.0/1.0)及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param hyphenationFactor 连字系数(0.0/1.0)
 @param range 设置范围
 */
- (void)sc_setHyphenationFactor:(float)hyphenationFactor range:(NSRange)range;

/**
 根据连字系数(0.0/1.0), 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param hyphenationFactor 连字系数(0.0/1.0)
 */
- (void)sc_setHyphenationFactor:(float)hyphenationFactor;

/**
 根据连字系数(0.0/1.0)及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param hyphenationFactor 连字系数(0.0/1.0)
 @param range 设置范围
 */
- (void)sc_addHyphenationFactor:(float)hyphenationFactor range:(NSRange)range;

/**
 根据连字系数(0.0/1.0), 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param hyphenationFactor 连字系数(0.0/1.0)
 */
- (void)sc_addHyphenationFactor:(float)hyphenationFactor ;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的连字系数属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeHyphenationFactorInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的连字系数属性(默认值)
 */
- (void)sc_removeHyphenationFactor;

#pragma mark - Tab Stops
/**
 根据TabStops及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param tabStops TabStops
 @param range 设置范围
 */
- (void)sc_setTabStops:(NSArray<NSTextTab *> *)tabStops range:(NSRange)range;

/**
 根据TabStops, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param tabStops TabStops
 */
- (void)sc_setTabStops:(NSArray<NSTextTab *> *)tabStops;

/**
 根据TabStops及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param tabStops TabStops
 @param range 设置范围
 */
- (void)sc_addTabStops:(NSArray<NSTextTab *> *)tabStops range:(NSRange)range;

/**
 根据TabStops, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param tabStops TabStops
 */
- (void)sc_addTabStops:(NSArray<NSTextTab *> *)tabStops;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的TabStops属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeTabStopsInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的TabStops属性(默认值)
 */
- (void)sc_removeTabStops;

#pragma mark - Default Tab Interval
/**
 根据默认Tab宽度及设置范围, 设置NSMutableAttributedString的ParagraphStyle属性(替代编辑)
 
 @param defaultTabInterval 默认Tab宽度
 @param range 设置范围
 */
- (void)sc_setDefaultTabInterval:(CGFloat)defaultTabInterval range:(NSRange)range;

/**
 根据默认Tab宽度, 设置NSMutableAttributedString的ParagraphStyle属性(全范围设置, 替代编辑)
 
 @param defaultTabInterval 默认Tab宽度
 */
- (void)sc_setDefaultTabInterval:(CGFloat)defaultTabInterval;

/**
 根据默认Tab宽度及设置范围, 添加NSMutableAttributedString的ParagraphStyle属性(增量编辑)
 
 @param defaultTabInterval 默认Tab宽度
 @param range 设置范围
 */
- (void)sc_addDefaultTabInterval:(CGFloat)defaultTabInterval range:(NSRange)range;

/**
 根据默认Tab宽度, 添加NSMutableAttributedString的ParagraphStyle属性(全范围设置, 增量编辑)
 
 @param defaultTabInterval 默认Tab宽度
 */
- (void)sc_addDefaultTabInterval:(CGFloat)defaultTabInterval;

/**
 根据移除范围, 移除NSMutableAttributedString的ParagraphStyle的默认Tab宽度属性(默认值)
 
 @param range 移除范围
 */
- (void)sc_removeDefaultTabIntervalInRange:(NSRange)range;

/**
 移除NSMutableAttributedString的ParagraphStyle的默认Tab宽度属性(默认值)
 */
- (void)sc_removeDefaultTabInterval;

@end

//
//  NSAttributedString+SCParagraphStyleAttributes.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSAttributedString+SCParagraphStyleAttributes.h"
#import "NSAttributedString+SCBase.h"

@implementation NSAttributedString (SCParagraphStyleAttributes)

#define SCParagraphStyleAttributeAtIndex(_attr_) \
NSParagraphStyle *paragraphstyle = [self sc_paragraphStyleAtIndex:index]; \
if (!paragraphstyle) paragraphstyle = [NSParagraphStyle defaultParagraphStyle]; \
return paragraphstyle. _attr_; \

#pragma mark - Line Spacing
- (CGFloat)sc_lineSpacingAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(lineSpacing);
}

#pragma mark - Paragraph Spacing
- (CGFloat)sc_paragraphSpacingAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(paragraphSpacing);
}

#pragma mark - Alignment
- (NSTextAlignment)sc_alignmentAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(alignment);
}

#pragma mark - Head Indent
- (CGFloat)sc_headIndentAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(headIndent);
}

#pragma mark - Tail Indent
- (CGFloat)sc_tailIndentAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(tailIndent);
}

#pragma mark - First Line Head Indent
- (CGFloat)sc_firstLineHeadIndentAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(firstLineHeadIndent);
}

#pragma mark - MinimumLine Height
- (CGFloat)sc_minimumLineHeightAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(minimumLineHeight);
}

#pragma mark - MaximumLine Height
- (CGFloat)sc_maximumLineHeightAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(maximumLineHeight);
}

#pragma mark - Line Break Mode
- (NSLineBreakMode)sc_lineBreakModeAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(lineBreakMode);
}

#pragma mark - Base Writing Direction
- (NSWritingDirection)sc_baseWritingDirectionAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(baseWritingDirection);
}

#pragma mark - Line Height Multiple
- (CGFloat)sc_lineHeightMultipleAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(lineHeightMultiple);
}

#pragma mark - Paragraph Spacing Before
- (CGFloat)sc_paragraphSpacingBeforeAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(paragraphSpacingBefore);
}

#pragma mark - Hyphenation Factor
- (float)sc_hyphenationFactorAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(hyphenationFactor);
}

#pragma mark - Tab Stops
- (NSArray<NSTextTab *> *)sc_tabStopsAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(tabStops);
}

#pragma mark - Default Tab Interval
- (CGFloat)sc_defaultTabIntervalAtIndex:(NSUInteger)index {
    SCParagraphStyleAttributeAtIndex(defaultTabInterval);
}

#undef SCParagraphStyleAttributeAtIndex

@end


@implementation NSMutableAttributedString (SCParagraphStyleAttributes)

#define SCParagraphStyleSetAttributeInRange(_attr_) \
NSParagraphStyle *paragraphStyle = [self sc_paragraphStyleInRange:range]; \
NSMutableParagraphStyle *mutableParagraphStyle = nil; \
if (paragraphStyle) { \
if ([paragraphStyle isKindOfClass:[NSMutableParagraphStyle class]]) { \
mutableParagraphStyle = (id)paragraphStyle; \
} else { \
mutableParagraphStyle = paragraphStyle.mutableCopy; \
} \
} else { \
mutableParagraphStyle = [NSParagraphStyle defaultParagraphStyle].mutableCopy; \
} \
if (mutableParagraphStyle. _attr_ != _attr_) mutableParagraphStyle. _attr_ = _attr_; \
[self sc_setParagraphStyle:mutableParagraphStyle range:range];

#define SCParagraphStyleAddAttributeInRange(_attr_) \
[self enumerateAttribute:NSParagraphStyleAttributeName \
inRange:range \
options:kNilOptions usingBlock:^(NSParagraphStyle *paragraphStyle, NSRange subRange, BOOL * _Nonnull stop) { \
NSMutableParagraphStyle *mutableParagraphStyle = nil; \
if (paragraphStyle) { \
if ([paragraphStyle isKindOfClass:[NSMutableParagraphStyle class]]) { \
mutableParagraphStyle = (id)paragraphStyle; \
} else { \
mutableParagraphStyle = paragraphStyle.mutableCopy; \
} \
} else { \
mutableParagraphStyle = [NSParagraphStyle defaultParagraphStyle].mutableCopy; \
} \
if (mutableParagraphStyle. _attr_ != _attr_) mutableParagraphStyle. _attr_ = _attr_; \
[self addAttribute:NSParagraphStyleAttributeName value:mutableParagraphStyle range:range]; \
}];

#define SCParagraphStyleRemoveAttributeInRange(_attr_) \
[self enumerateAttribute:NSParagraphStyleAttributeName \
inRange:range \
options:kNilOptions usingBlock:^(NSParagraphStyle *paragraphStyle, NSRange subRange, BOOL * _Nonnull stop) { \
NSMutableParagraphStyle *mutableParagraphStyle = nil; \
if (paragraphStyle) { \
if ([paragraphStyle isKindOfClass:[NSMutableParagraphStyle class]]) { \
mutableParagraphStyle = (id)paragraphStyle; \
} else { \
mutableParagraphStyle = paragraphStyle.mutableCopy; \
} \
} \
if (mutableParagraphStyle. _attr_ != [NSParagraphStyle defaultParagraphStyle]. _attr_) mutableParagraphStyle. _attr_ = [NSParagraphStyle defaultParagraphStyle]. _attr_; \
[self sc_setParagraphStyle:mutableParagraphStyle range:range]; \
}];

#pragma mark - Line Spacing
- (void)sc_setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(lineSpacing);
}

- (void)sc_setLineSpacing:(CGFloat)lineSpacing {
    [self sc_setLineSpacing:lineSpacing range:self.sc_rangeOfAll];
}

- (void)sc_addLineSpacing:(CGFloat)lineSpacing range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(lineSpacing);
}

- (void)sc_addLineSpacing:(CGFloat)lineSpacing {
    [self sc_addLineSpacing:lineSpacing range:self.sc_rangeOfAll];
}

- (void)sc_removeLineSpacingInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(lineSpacing)
}

- (void)sc_removeLineSpacing {
    [self sc_removeLineSpacingInRange:self.sc_rangeOfAll];
}

#pragma mark - Paragraph Spacing
- (void)sc_setParagraphSpacing:(CGFloat)paragraphSpacing range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(paragraphSpacing);
}

- (void)sc_setParagraphSpacing:(CGFloat)paragraphSpacing {
    [self sc_setParagraphSpacing:paragraphSpacing range:self.sc_rangeOfAll];
}

- (void)sc_addParagraphSpacing:(CGFloat)paragraphSpacing range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(paragraphSpacing);
}

- (void)sc_addParagraphSpacing:(CGFloat)paragraphSpacing {
    [self sc_addParagraphSpacing:paragraphSpacing range:self.sc_rangeOfAll];
}

- (void)sc_removeParagraphSpacingInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(paragraphSpacing)
}

- (void)sc_removeParagraphSpacing {
    [self sc_removeParagraphSpacingInRange:self.sc_rangeOfAll];
}

#pragma mark - Alignment
- (void)sc_setAlignment:(NSTextAlignment)alignment range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(alignment);
}

- (void)sc_setAlignment:(NSTextAlignment)alignment {
    [self sc_setAlignment:alignment range:self.sc_rangeOfAll];
}

- (void)sc_addAlignment:(NSTextAlignment)alignment range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(alignment);
}

- (void)sc_addAlignment:(NSTextAlignment)alignment {
    [self sc_addAlignment:alignment range:self.sc_rangeOfAll];
}

- (void)sc_removeAlignmentInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(alignment)
}

- (void)sc_removeAlignment {
    [self sc_removeAlignmentInRange:self.sc_rangeOfAll];
}

#pragma mark - Head Indent
- (void)sc_setHeadIndent:(CGFloat)headIndent range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(headIndent);
}

- (void)sc_setHeadIndent:(CGFloat)headIndent {
    [self sc_setHeadIndent:headIndent range:self.sc_rangeOfAll];
}

- (void)sc_addHeadIndent:(CGFloat)headIndent range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(headIndent);
}

- (void)sc_addHeadIndent:(CGFloat)headIndent {
    [self sc_addHeadIndent:headIndent range:self.sc_rangeOfAll];
}

- (void)sc_removeHeadIndentInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(headIndent)
}

- (void)sc_removeHeadIndent {
    [self sc_removeHeadIndentInRange:self.sc_rangeOfAll];
}

#pragma mark - Tail Indent
- (void)sc_setTailIndent:(CGFloat)tailIndent range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(tailIndent);
}

- (void)sc_setTailIndent:(CGFloat)tailIndent {
    [self sc_setTailIndent:tailIndent range:self.sc_rangeOfAll];
}

- (void)sc_addTailIndent:(CGFloat)tailIndent range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(tailIndent);
}

- (void)sc_addTailIndent:(CGFloat)tailIndent {
    [self sc_addTailIndent:tailIndent range:self.sc_rangeOfAll];
}

- (void)sc_removeTailIndentInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(tailIndent)
}

- (void)sc_removeTailIndent {
    [self sc_removeTailIndentInRange:self.sc_rangeOfAll];
}

#pragma mark - First Line Head Indent
- (void)sc_setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(firstLineHeadIndent);
}

- (void)sc_setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent {
    [self sc_setFirstLineHeadIndent:firstLineHeadIndent range:self.sc_rangeOfAll];
}

- (void)sc_addFirstLineHeadIndent:(CGFloat)firstLineHeadIndent range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(firstLineHeadIndent);
}

- (void)sc_addFirstLineHeadIndent:(CGFloat)firstLineHeadIndent {
    [self sc_addFirstLineHeadIndent:firstLineHeadIndent range:self.sc_rangeOfAll];
}

- (void)sc_removeFirstLineHeadIndentInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(firstLineHeadIndent)
}

- (void)sc_removeFirstLineHeadIndent {
    [self sc_removeFirstLineHeadIndentInRange:self.sc_rangeOfAll];
}

#pragma mark - Minimum Line Height
- (void)sc_setMinimumLineHeight:(CGFloat)minimumLineHeight range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(minimumLineHeight);
}

- (void)sc_setMinimumLineHeight:(CGFloat)minimumLineHeight {
    [self sc_setMinimumLineHeight:minimumLineHeight range:self.sc_rangeOfAll];
}

- (void)sc_addMinimumLineHeight:(CGFloat)minimumLineHeight range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(minimumLineHeight);
}

- (void)sc_addMinimumLineHeight:(CGFloat)minimumLineHeight {
    [self sc_addMinimumLineHeight:minimumLineHeight range:self.sc_rangeOfAll];
}

- (void)sc_removeMinimumLineHeightInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(minimumLineHeight)
}

- (void)sc_removeMinimumLineHeight {
    [self sc_removeMinimumLineHeightInRange:self.sc_rangeOfAll];
}

#pragma mark - Maximum Line Height
- (void)sc_setMaximumLineHeight:(CGFloat)maximumLineHeight range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(maximumLineHeight);
}

- (void)sc_setMaximumLineHeight:(CGFloat)maximumLineHeight {
    [self sc_setMaximumLineHeight:maximumLineHeight range:self.sc_rangeOfAll];
}

- (void)sc_addMaximumLineHeight:(CGFloat)maximumLineHeight range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(maximumLineHeight);
}

- (void)sc_addMaximumLineHeight:(CGFloat)maximumLineHeight {
    [self sc_addMaximumLineHeight:maximumLineHeight range:self.sc_rangeOfAll];
}

- (void)sc_removeMaximumLineHeightInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(maximumLineHeight)
}

- (void)sc_removeMaximumLineHeight {
    [self sc_removeMaximumLineHeightInRange:self.sc_rangeOfAll];
}

#pragma mark - Line Break Mode
- (void)sc_setLineBreakMode:(NSLineBreakMode)lineBreakMode range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(lineBreakMode);
}

- (void)sc_setLineBreakMode:(NSLineBreakMode)lineBreakMode {
    [self sc_setLineBreakMode:lineBreakMode range:self.sc_rangeOfAll];
}

- (void)sc_addLineBreakMode:(NSLineBreakMode)lineBreakMode range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(lineBreakMode);
}

- (void)sc_addLineBreakMode:(NSLineBreakMode)lineBreakMode {
    [self sc_addLineBreakMode:lineBreakMode range:self.sc_rangeOfAll];
}

- (void)sc_removeLineBreakModeInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(lineBreakMode)
}

- (void)sc_removeLineBreakMode {
    [self sc_removeLineBreakModeInRange:self.sc_rangeOfAll];
}

#pragma mark - Base Writing Direction
- (void)sc_setBaseWritingDirection:(NSWritingDirection)baseWritingDirection range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(baseWritingDirection);
}

- (void)sc_setBaseWritingDirection:(NSWritingDirection)baseWritingDirection {
    [self sc_setBaseWritingDirection:baseWritingDirection range:self.sc_rangeOfAll];
}

- (void)sc_addBaseWritingDirection:(NSWritingDirection)baseWritingDirection range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(baseWritingDirection);
}

- (void)sc_addBaseWritingDirection:(NSWritingDirection)baseWritingDirection {
    [self sc_addBaseWritingDirection:baseWritingDirection range:self.sc_rangeOfAll];
}

- (void)sc_removeBaseWritingDirectionInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(baseWritingDirection)
}

- (void)sc_removeBaseWritingDirection {
    [self sc_removeBaseWritingDirectionInRange:self.sc_rangeOfAll];
}

#pragma mark - Line Height Multiple
- (void)sc_setLineHeightMultiple:(CGFloat)lineHeightMultiple range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(lineHeightMultiple);
}

- (void)sc_setLineHeightMultiple:(CGFloat)lineHeightMultiple {
    [self sc_setLineHeightMultiple:lineHeightMultiple range:self.sc_rangeOfAll];
}

- (void)sc_addLineHeightMultiple:(CGFloat)lineHeightMultiple range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(lineHeightMultiple);
}

- (void)sc_addLineHeightMultiple:(CGFloat)lineHeightMultiple {
    [self sc_addLineHeightMultiple:lineHeightMultiple range:self.sc_rangeOfAll];
}

- (void)sc_removeLineHeightMultipleInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(lineHeightMultiple)
}

- (void)sc_removeLineHeightMultiple {
    [self sc_removeLineHeightMultipleInRange:self.sc_rangeOfAll];
}

#pragma mark - Paragraph Spacing Before
- (void)sc_setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(paragraphSpacingBefore);
}

- (void)sc_setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore {
    [self sc_setParagraphSpacingBefore:paragraphSpacingBefore range:self.sc_rangeOfAll];
}

- (void)sc_addParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(paragraphSpacingBefore);
}

- (void)sc_addParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore {
    [self sc_addParagraphSpacingBefore:paragraphSpacingBefore range:self.sc_rangeOfAll];
}

- (void)sc_removeParagraphSpacingBeforeInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(paragraphSpacingBefore)
}

- (void)sc_removeParagraphSpacingBefore {
    [self sc_removeParagraphSpacingBeforeInRange:self.sc_rangeOfAll];
}

#pragma mark - Hyphenation Factor
- (void)sc_setHyphenationFactor:(float)hyphenationFactor range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(hyphenationFactor);
}

- (void)sc_setHyphenationFactor:(float)hyphenationFactor {
    [self sc_setHyphenationFactor:hyphenationFactor range:self.sc_rangeOfAll];
}

- (void)sc_addHyphenationFactor:(float)hyphenationFactor range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(hyphenationFactor);
}

- (void)sc_addHyphenationFactor:(float)hyphenationFactor {
    [self sc_addHyphenationFactor:hyphenationFactor range:self.sc_rangeOfAll];
}

- (void)sc_removeHyphenationFactorInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(hyphenationFactor)
}

- (void)sc_removeHyphenationFactor {
    [self sc_removeHyphenationFactorInRange:self.sc_rangeOfAll];
}

#pragma mark - Tab Stops
- (void)sc_setTabStops:(NSArray<NSTextTab *> *)tabStops range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(tabStops);
}

- (void)sc_setTabStops:(NSArray<NSTextTab *> *)tabStops {
    [self sc_setTabStops:tabStops range:self.sc_rangeOfAll];
}

- (void)sc_addTabStops:(NSArray<NSTextTab *> *)tabStops range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(tabStops);
}

- (void)sc_addTabStops:(NSArray<NSTextTab *> *)tabStops {
    [self sc_addTabStops:tabStops range:self.sc_rangeOfAll];
}

- (void)sc_removeTabStopsInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(tabStops)
}

- (void)sc_removeTabStops {
    [self sc_removeTabStopsInRange:self.sc_rangeOfAll];
}

#pragma mark - Default Tab Interval
- (void)sc_setDefaultTabInterval:(CGFloat)defaultTabInterval range:(NSRange)range {
    SCParagraphStyleSetAttributeInRange(defaultTabInterval);
}

- (void)sc_setDefaultTabInterval:(CGFloat)defaultTabInterval {
    [self sc_setDefaultTabInterval:defaultTabInterval range:self.sc_rangeOfAll];
}

- (void)sc_addDefaultTabInterval:(CGFloat)defaultTabInterval range:(NSRange)range {
    SCParagraphStyleAddAttributeInRange(defaultTabInterval);
}

- (void)sc_addDefaultTabInterval:(CGFloat)defaultTabInterval {
    [self sc_addDefaultTabInterval:defaultTabInterval range:self.sc_rangeOfAll];
}

- (void)sc_removeDefaultTabIntervalInRange:(NSRange)range {
    SCParagraphStyleRemoveAttributeInRange(tabStops)
}

- (void)sc_removeDefaultTabInterval {
    [self sc_removeDefaultTabIntervalInRange:self.sc_rangeOfAll];
}

#undef SCParagraphStyleSetAttributeInRange
#undef SCParagraphStyleAddAttributeInRange
#undef SCParagraphStyleRemoveAttributeInRange

@end

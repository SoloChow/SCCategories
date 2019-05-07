//
//  NSAttributedString+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/12.
//
//

#import "NSAttributedString+SCBase.h"
#import "NSValue+SCBase.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@implementation NSAttributedString (SCBase)

#pragma mark - Base
- (NSDictionary *)_sc_defaultAttributes {
    static NSDictionary *defaultAttributes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 9.0, *)) {
            defaultAttributes = @{
                                  NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:12.f],
                                  NSParagraphStyleAttributeName:[NSParagraphStyle defaultParagraphStyle],
                                  NSForegroundColorAttributeName:[UIColor blackColor],
                                  // NSBackgroundColorAttributeName // default nil: no background
                                  NSLigatureAttributeName:[NSNumber numberWithInteger:1], // default 1: default ligatures
                                  NSKernAttributeName:[NSNumber numberWithFloat:0],
                                  NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone], // default 0: no underline
                                  NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone], // default 0: no underline
                                  // NSStrokeColorAttributeName // default nil: same as foreground color
                                  NSStrokeWidthAttributeName:[NSNumber numberWithFloat:0], // default 0: no stroke
                                  // NSShadowAttributeName // default nil
                                  // NSTextEffectAttributeName // default nil
                                  // NSAttachmentAttributeName // default nil
                                  // NSLinkAttributeName // default nil
                                  NSBaselineOffsetAttributeName:[NSNumber numberWithFloat:0], // default 0
                                  // NSUnderlineColorAttributeName     // default nil: same as foreground color
                                  // NSStrikethroughColorAttributeName // default nil: same as foreground color
                                  NSObliquenessAttributeName:[NSNumber numberWithFloat:0], // default 0: no skew
                                  NSExpansionAttributeName:[NSNumber numberWithFloat:0], // default 0: no expansion
                                  NSWritingDirectionAttributeName:@[@(NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding)], // LRE
                                  NSVerticalGlyphFormAttributeName:[NSNumber numberWithBool:0] // 0 means horizontal text.
                                  };
        } else {
            defaultAttributes = @{
                                  NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:12.f],
                                  NSParagraphStyleAttributeName:[NSParagraphStyle defaultParagraphStyle],
                                  NSForegroundColorAttributeName:[UIColor blackColor],
                                  // NSBackgroundColorAttributeName // default nil: no background
                                  NSLigatureAttributeName:[NSNumber numberWithInteger:1], // default 1: default ligatures
                                  NSKernAttributeName:[NSNumber numberWithFloat:0],
                                  NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone], // default 0: no underline
                                  NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone], // default 0: no underline
                                  // NSStrokeColorAttributeName // default nil: same as foreground color
                                  NSStrokeWidthAttributeName:[NSNumber numberWithFloat:0], // default 0: no stroke
                                  // NSShadowAttributeName // default nil
                                  // NSTextEffectAttributeName // default nil
                                  // NSAttachmentAttributeName // default nil
                                  // NSLinkAttributeName // default nil
                                  NSBaselineOffsetAttributeName:[NSNumber numberWithFloat:0], // default 0
                                  // NSUnderlineColorAttributeName     // default nil: same as foreground color
                                  // NSStrikethroughColorAttributeName // default nil: same as foreground color
                                  NSObliquenessAttributeName:[NSNumber numberWithFloat:0], // default 0: no skew
                                  NSExpansionAttributeName:[NSNumber numberWithFloat:0], // default 0: no expansion
                                  NSVerticalGlyphFormAttributeName:[NSNumber numberWithBool:0] // 0 means horizontal text.
                                  };
        }
    });
    return defaultAttributes;
}

- (NSRange)sc_rangeOfAll {
    return NSMakeRange(0, self.length);
}

- (NSDictionary<NSString *, id> *)sc_attributesAtIndex:(NSUInteger)index {
    if (index >= self.length || self.length == 0) return nil;
    return [self attributesAtIndex:index effectiveRange:NULL];
}

- (NSDictionary<NSString *, id> *)sc_attributesInRange:(NSRange)range {
    NSAssert(SCNSRangeInRange(range, self.sc_rangeOfAll), @"The range, which to search for continuous presence of attributeName, must not exceed the bounds of the receiver.");
    
    __block NSMutableDictionary *attrs = @{}.mutableCopy;
    [self enumerateAttributesInRange:self.sc_rangeOfAll options:kNilOptions usingBlock:^(NSDictionary<NSString *,id> * _Nonnull subAttrs, NSRange range, BOOL * _Nonnull stop) {
        if (attrs) {
            [attrs addEntriesFromDictionary:subAttrs];
        }
    }];
    
    __weak typeof(attrs) weakAttrs = attrs;
    [attrs enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(NSString *attrName, id attr, BOOL * _Nonnull stop) {
        if (![self sc_attribute:attrName inRange:self.sc_rangeOfAll]) {
            [weakAttrs removeObjectForKey:attrName];
        }
    }];
    
    return attrs.copy;
}

- (NSDictionary<NSString *, id> *)sc_attributes {
    return [self sc_attributesInRange:self.sc_rangeOfAll];
}

- (id)sc_attribute:(NSString *)attrName atIndex:(NSUInteger)index {
    if (!attrName) return nil;
    if (index > self.length || self.length == 0) return nil;
    if (self.length > 0 && index == self.length) index--;
    return [self attribute:attrName atIndex:index effectiveRange:NULL];
}

- (id)sc_attribute:(NSString *)attrName inRange:(NSRange)range {
    if (!attrName) return nil;
    NSAssert(SCNSRangeInRange(range, self.sc_rangeOfAll), @"The range, which to search for continuous presence of attributeName, must not exceed the bounds of the receiver.");
    
    NSRange effectiveRange = SCNSRangeZero;
    id attr = [self attribute:attrName atIndex:range.location longestEffectiveRange:&effectiveRange inRange:range];
    if (!attr) return nil;
    if (!NSEqualRanges(effectiveRange, range)) return nil;
    
    return attr;
}

- (id)sc_attribute:(NSString *)attrName {
    return [self sc_attribute:attrName inRange:self.sc_rangeOfAll];
}

#pragma mark - Attributed Substrings

- (NSAttributedString *)sc_attributedSubstringToIndex:(NSUInteger)to {
    NSRange range = NSMakeRange(0, to);
    return [self attributedSubstringFromRange:range];
}

- (NSAttributedString *)sc_attributedSubstringFromIndex:(NSUInteger)from {
    NSRange range = NSMakeRange(from, self.string.length-from);
    return [self attributedSubstringFromRange:range];
}

#pragma mark - Check
- (BOOL)sc_containsRange:(NSRange)range {
    if (!self.string || !self.length) return NO;
    if (!SCNSRangeInRange(range, self.sc_rangeOfAll)) return NO;
    
    return YES;
}

- (BOOL)sc_isSharedAttributesInAllRange {
    __block BOOL isShared = YES;
    __block NSDictionary *firstAttrs = nil;
    [self enumerateAttributesInRange:self.sc_rangeOfAll options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        if (range.location == 0) {
            firstAttrs = attrs;
        } else {
            if (firstAttrs.count != attrs.count) {
                isShared = NO;
                *stop = YES;
            } else if (firstAttrs) {
                if (![firstAttrs isEqualToDictionary:attrs]) {
                    isShared = NO;
                    *stop = YES;
                }
            }
        }
    }];
    return isShared;
}

#pragma mark - Font
- (UIFont *)sc_fontAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSFontAttributeName atIndex:index];
}

- (UIFont *)sc_fontInRange:(NSRange)range {
    return [self sc_attribute:NSFontAttributeName inRange:range];
}

- (UIFont *)sc_font {
    return [self sc_attribute:NSFontAttributeName];
}

#pragma mark - Paragraph Style
- (NSParagraphStyle *)sc_paragraphStyleAtIndex:(NSUInteger)index {
    NSParagraphStyle *paragraphStyle = [self sc_attribute:NSParagraphStyleAttributeName atIndex:index];
    if (!paragraphStyle) {
        paragraphStyle = [NSParagraphStyle defaultParagraphStyle];
    }
    return paragraphStyle;
}

- (NSParagraphStyle *)sc_paragraphStyleInRange:(NSRange)range {
    return [self sc_attribute:NSParagraphStyleAttributeName inRange:range];
}

- (NSParagraphStyle *)sc_paragraphStyle {
    return [self sc_paragraphStyleInRange:self.sc_rangeOfAll];
}

#pragma mark - Foreground Color
- (UIColor *)sc_foregroundColorAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSForegroundColorAttributeName atIndex:index];
}

- (UIColor *)sc_foregroundColorInRange:(NSRange)range {
    return [self sc_attribute:NSForegroundColorAttributeName inRange:range];
}

- (UIColor *)sc_foregroundColor {
    return [self sc_attribute:NSForegroundColorAttributeName];
}

#pragma mark - Background Color
- (UIColor *)sc_backgroundColorAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSBackgroundColorAttributeName atIndex:index];
}

- (UIColor *)sc_backgroundColorInRange:(NSRange)range {
    return [self sc_attribute:NSBackgroundColorAttributeName inRange:range];
}

- (UIColor *)sc_backgroundColor {
    return [self sc_attribute:NSBackgroundColorAttributeName];
}

#pragma mark - Ligature
- (NSNumber *)sc_ligatureAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSLigatureAttributeName atIndex:index];
}

- (NSNumber *)sc_ligatureInRange:(NSRange)range {
    return [self sc_attribute:NSLigatureAttributeName inRange:range];
}

- (NSNumber *)sc_ligature {
    return [self sc_attribute:NSLigatureAttributeName];
}

#pragma mark - Kern
- (NSNumber *)sc_kernAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSKernAttributeName atIndex:index];
}

- (NSNumber *)sc_kernInRange:(NSRange)range {
    return [self sc_attribute:NSKernAttributeName inRange:range];
}

- (NSNumber *)sc_kern {
    return [self sc_attribute:NSKernAttributeName];
}

#pragma mark - Strikethrough Style
- (NSNumber *)sc_strikethroughStyleAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSStrikethroughStyleAttributeName atIndex:index];
}

- (NSNumber *)sc_strikethroughStyleInRange:(NSRange)range {
    return [self sc_attribute:NSStrikethroughStyleAttributeName inRange:range];
}

- (NSNumber *)sc_strikethroughStyle {
    return [self sc_attribute:NSStrikethroughStyleAttributeName];
}

#pragma mark - Underline Style
- (NSNumber *)sc_underlineStyleAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSUnderlineStyleAttributeName atIndex:index];
}

- (NSNumber *)sc_underlineStyleInRange:(NSRange)range {
    return [self sc_attribute:NSUnderlineStyleAttributeName inRange:range];
}

- (NSNumber *)sc_underlineStyle {
    return [self sc_attribute:NSUnderlineStyleAttributeName];
}

#pragma mark - Stroke Color
- (UIColor *)sc_strokeColorAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSStrokeColorAttributeName atIndex:index];
}

- (UIColor *)sc_strokeColorInRange:(NSRange)range {
    return [self sc_attribute:NSStrokeColorAttributeName inRange:range];
}

- (UIColor *)sc_strokeColor {
    return [self sc_attribute:NSStrokeColorAttributeName];
}

#pragma mark - Stroke Width
- (NSNumber *)sc_strokeWidthAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSStrokeWidthAttributeName atIndex:index];
}

- (NSNumber *)sc_strokeWidthInRange:(NSRange)range {
    return [self sc_attribute:NSStrokeWidthAttributeName inRange:range];
}

- (NSNumber *)sc_strokeWidth {
    return [self sc_attribute:NSStrokeWidthAttributeName];
}

#pragma mark - Shadow
- (NSShadow *)sc_shadowAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSShadowAttributeName atIndex:index];
}

- (NSShadow *)sc_shadowInRange:(NSRange)range {
    return [self sc_attribute:NSShadowAttributeName inRange:range];
}

- (NSShadow *)sc_shadow {
    return [self sc_attribute:NSShadowAttributeName];
}

#pragma mark - Text Effect
- (NSString *)sc_textEffectAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSTextEffectAttributeName atIndex:index];
}

- (NSString *)sc_textEffectInRange:(NSRange)range {
    return [self sc_attribute:NSTextEffectAttributeName inRange:range];
}

- (NSString *)sc_textEffect {
    return [self sc_attribute:NSTextEffectAttributeName];
}

#pragma mark - Attachment
- (NSTextAttachment *)sc_attachmentAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSAttachmentAttributeName atIndex:index];
}

- (NSTextAttachment *)sc_attachmentInRange:(NSRange)range {
    return [self sc_attribute:NSAttachmentAttributeName inRange:range];
}

- (NSTextAttachment *)sc_attachment {
    return [self sc_attribute:NSAttachmentAttributeName];
}

#pragma mark - Link
- (id)sc_linkAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSLinkAttributeName atIndex:index];
}

- (id)sc_linkInRange:(NSRange)range {
    return [self sc_attribute:NSLinkAttributeName inRange:range];
}

- (id)sc_link {
    return [self sc_attribute:NSLinkAttributeName];
}

#pragma mark - Baseline Offset
- (NSNumber *)sc_baselineOffsetAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSBaselineOffsetAttributeName atIndex:index];
}

- (NSNumber *)sc_baselineOffsetInRange:(NSRange)range {
    return [self sc_attribute:NSBaselineOffsetAttributeName inRange:range];
}

- (NSNumber *)sc_baselineOffset {
    return [self sc_attribute:NSBaselineOffsetAttributeName];
}

#pragma mark - Underline Color
- (UIColor *)sc_underlineColorAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSUnderlineColorAttributeName atIndex:index];
}

- (UIColor *)sc_underlineColorInRange:(NSRange)range {
    return [self sc_attribute:NSUnderlineColorAttributeName inRange:range];
}

- (UIColor *)sc_underlineColor {
    return [self sc_attribute:NSUnderlineColorAttributeName];
}

#pragma mark - Strikethrough Color
- (UIColor *)sc_strikethroughColorAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSStrikethroughColorAttributeName atIndex:index];
}

- (UIColor *)sc_strikethroughColorInRange:(NSRange)range {
    return [self sc_attribute:NSStrikethroughColorAttributeName inRange:range];
}

- (UIColor *)sc_strikethroughColor {
    return [self sc_attribute:NSStrikethroughColorAttributeName];
}

#pragma mark - Obliqueness
- (NSNumber *)sc_obliquenessAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSObliquenessAttributeName atIndex:index];
}

- (NSNumber *)sc_obliquenessInRange:(NSRange)range {
    return [self sc_attribute:NSObliquenessAttributeName inRange:range];
}

- (NSNumber *)sc_obliqueness {
    return [self sc_attribute:NSObliquenessAttributeName];
}

#pragma mark - Expansion
- (NSNumber *)sc_expansionAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSExpansionAttributeName atIndex:index];
}

- (NSNumber *)sc_expansionInRange:(NSRange)range {
    return [self sc_attribute:NSExpansionAttributeName inRange:range];
}

- (NSNumber *)sc_expansion {
    return [self sc_attribute:NSExpansionAttributeName];
}

#pragma mark - Writing Direction
- (NSArray<NSNumber *> *)sc_writingDirectionAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSWritingDirectionAttributeName atIndex:index];
}

- (NSArray<NSNumber *> *)sc_writingDirectionInRange:(NSRange)range {
    return [self sc_attribute:NSWritingDirectionAttributeName inRange:range];
}

- (NSArray<NSNumber *> *)sc_writingDirection {
    return [self sc_attribute:NSWritingDirectionAttributeName];
}

#pragma mark - Vertical Glyph Form
- (NSNumber *)sc_verticalGlyphFormAtIndex:(NSUInteger)index {
    return [self sc_attribute:NSVerticalGlyphFormAttributeName atIndex:index];
}

- (NSNumber *)sc_verticalGlyphFormInRange:(NSRange)range {
    return [self sc_attribute:NSVerticalGlyphFormAttributeName inRange:range];
}

- (NSNumber *)sc_verticalGlyphForm {
    return [self sc_attribute:NSVerticalGlyphFormAttributeName];
}

@end


@implementation NSMutableAttributedString (SCBase)

#pragma mark - Base
- (void)sc_setAttribute:(NSString *)name value:(id)value range:(NSRange)range {
    if (!name || [NSNull isEqual:name]) return;
    if (value && ![NSNull isEqual:value]) {
        [self setAttributes:@{name:value} range:range];
    } else {
        [self removeAttribute:name range:range];
    }
}

- (void)sc_setAttribute:(NSString *)name value:(id)value {
    [self sc_setAttribute:name value:(id)value range:self.sc_rangeOfAll];
}

- (void)sc_setAttributes:(NSDictionary<NSString *, id> *)attrs {
    if (attrs == (id)[NSNull null]) attrs = nil;
    [self setAttributes:@{} range:self.sc_rangeOfAll];
    [attrs enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self sc_setAttribute:key value:obj];
    }];
}

- (void)sc_addAttribute:(NSString *)name value:(id)value {
    [self addAttribute:name value:value range:self.sc_rangeOfAll];
}

- (void)sc_addAttributes:(NSDictionary<NSString *, id> *)attrs {
    if (attrs == (id)[NSNull null]) attrs = nil;
    [attrs enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self sc_addAttribute:key value:obj];
    }];
}

- (void)sc_removeAttribute:(NSString *)name {
    [self removeAttribute:name range:self.sc_rangeOfAll];
}

- (void)sc_removeAttributes:(NSArray<NSString *> *)attrNames range:(NSRange)range {
    if (!attrNames || attrNames.count) return;
    
    for (NSString *attrName in attrNames) {
        [self removeAttribute:attrName range:range];
    }
}

- (void)sc_removeAttributes:(NSArray<NSString *> *)attrNames {
    [self sc_removeAttributes:attrNames range:self.sc_rangeOfAll];
}

- (void)sc_removeAttributesInRange:(NSRange)range {
    [self setAttributes:nil range:range];
}

- (void)sc_removeAttributes {
    [self setAttributes:nil range:self.sc_rangeOfAll];
}

- (void)sc_insertString:(NSString *)string atIndex:(NSUInteger)location {
    [self replaceCharactersInRange:NSMakeRange(location, 0) withString:string];
    [self sc_removeDiscontinuousAttributesInRange:NSMakeRange(location, string.length)];
}

- (void)sc_appendString:(NSString *)string {
    NSUInteger length = self.length;
    [self replaceCharactersInRange:NSMakeRange(length, 0) withString:string];
    [self sc_removeDiscontinuousAttributesInRange:NSMakeRange(length, string.length)];
}

- (void)sc_removeDiscontinuousAttributesInRange:(NSRange)range {
    NSArray *keys = [NSMutableAttributedString sc_allDiscontinuousAttributeKeys];
    for (NSString *key in keys) {
        [self removeAttribute:key range:range];
    }
}

+ (NSArray<NSString *> *)sc_allDiscontinuousAttributeKeys {
    static NSMutableArray *keys;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keys = @[(id)kCTSuperscriptAttributeName,
                 (id)kCTRunDelegateAttributeName].mutableCopy;
        float version = [UIDevice currentDevice].systemVersion.floatValue;
        if (version >= 8) {
            [keys addObject:(id)kCTRubyAnnotationAttributeName];
        }
        if (version >= 7) {
            [keys addObject:NSAttachmentAttributeName];
        }
    });
    return keys.copy;
}

#pragma mark - Font
- (void)sc_setFont:(UIFont *)font range:(NSRange)range {
    [self sc_setAttribute:NSFontAttributeName value:font range:range];
}

- (void)sc_setFont:(UIFont *)font {
    [self sc_setAttribute:NSFontAttributeName value:font];
}

- (void)sc_addFont:(UIFont *)font range:(NSRange)range {
    [self addAttribute:NSFontAttributeName value:font range:range];
}

- (void)sc_addFont:(UIFont *)font {
    [self sc_addAttribute:NSFontAttributeName value:font];
}

- (void)sc_removeFontInRange:(NSRange)range {
    [self removeAttribute:NSFontAttributeName range:range];
}

- (void)sc_removeFont {
    [self sc_removeAttribute:NSFontAttributeName];
}
#pragma mark - Paragraph Style
- (void)sc_setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range {
    [self sc_setAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}

- (void)sc_setParagraphStyle:(NSParagraphStyle *)paragraphStyle {
    [self sc_setAttribute:NSParagraphStyleAttributeName value:paragraphStyle];
}

- (void)sc_addParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range {
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}

- (void)sc_addParagraphStyle:(NSParagraphStyle *)paragraphStyle {
    [self sc_addAttribute:NSParagraphStyleAttributeName value:paragraphStyle];
}

- (void)sc_removeParagraphStyleInRange:(NSRange)range {
    [self removeAttribute:NSParagraphStyleAttributeName range:range];
}

- (void)sc_removeParagraphStyle {
    [self sc_removeAttribute:NSParagraphStyleAttributeName];
}

#pragma mark - Foreground Color
- (void)sc_setForegroundColor:(UIColor *)color range:(NSRange)range
{
    [self sc_setAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)sc_setForegroundColor:(UIColor *)color {
    [self sc_setAttribute:NSForegroundColorAttributeName value:color];
}

- (void)sc_addForegroundColor:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)sc_addForegroundColor:(UIColor *)color {
    [self sc_addAttribute:NSForegroundColorAttributeName value:color];
}

- (void)sc_removeForegroundColorInRange:(NSRange)range {
    [self removeAttribute:NSForegroundColorAttributeName range:range];
}

- (void)sc_removeForegroundColor {
    [self sc_removeAttribute:NSForegroundColorAttributeName];
}

#pragma mark - Background Color
- (void)sc_setBackgroundColor:(UIColor *)color range:(NSRange)range {
    [self sc_setAttribute:NSBackgroundColorAttributeName value:color range:range];
}

- (void)sc_setBackgroundColor:(UIColor *)color {
    [self sc_setAttribute:NSBackgroundColorAttributeName value:color];
}

- (void)sc_addBackgroundColor:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
}

- (void)sc_addBackgroundColor:(UIColor *)color {
    [self sc_addAttribute:NSBackgroundColorAttributeName value:color];
}

- (void)sc_removeBackgroundColorInRange:(NSRange)range {
    [self removeAttribute:NSBackgroundColorAttributeName range:range];
}

- (void)sc_removeBackgroundColor {
    [self sc_removeAttribute:NSBackgroundColorAttributeName];
}

#pragma mark - Ligature
- (void)sc_setLigature:(NSNumber *)ligature range:(NSRange)range {
    [self sc_setAttribute:NSLigatureAttributeName value:ligature range:range];
}

- (void)sc_setLigature:(NSNumber *)ligature {
    [self sc_setAttribute:NSLigatureAttributeName value:ligature];
}

- (void)sc_addLigature:(NSNumber *)ligature range:(NSRange)range {
    [self addAttribute:NSLigatureAttributeName value:ligature range:range];
}

- (void)sc_addLigature:(NSNumber *)ligature {
    [self sc_addAttribute:NSLigatureAttributeName value:ligature];
}

- (void)sc_removeLigatureInRange:(NSRange)range {
    [self removeAttribute:NSLigatureAttributeName range:range];
}

- (void)sc_removeLigature {
    [self sc_removeAttribute:NSLigatureAttributeName];
}

#pragma mark - Kern
- (void)sc_setKern:(NSNumber *)kern range:(NSRange)range {
    [self sc_setAttribute:NSKernAttributeName value:kern range:range];
}

- (void)sc_setKern:(NSNumber *)kern {
    [self sc_setAttribute:NSKernAttributeName value:kern];
}

- (void)sc_addKern:(NSNumber *)kern range:(NSRange)range {
    [self addAttribute:NSKernAttributeName value:kern range:range];
}

- (void)sc_addKern:(NSNumber *)kern {
    [self sc_addAttribute:NSKernAttributeName value:kern];
}

- (void)sc_removeKernInRange:(NSRange)range {
    [self removeAttribute:NSKernAttributeName range:range];
}

- (void)sc_removeKern {
    [self sc_removeAttribute:NSKernAttributeName];
}

#pragma mark - Strikethrough Style
- (void)sc_setStrikethroughStyle:(NSNumber *)strikethroughStyle range:(NSRange)range {
    [self sc_setAttribute:NSStrikethroughStyleAttributeName value:strikethroughStyle range:range];
}

- (void)sc_setStrikethroughStyle:(NSNumber *)strikethroughStyle {
    [self sc_setAttribute:NSStrikethroughStyleAttributeName value:strikethroughStyle];
}

- (void)sc_addStrikethroughStyle:(NSNumber *)strikethroughStyle range:(NSRange)range {
    [self addAttribute:NSStrikethroughStyleAttributeName value:strikethroughStyle range:range];
}

- (void)sc_addStrikethroughStyle:(NSNumber *)strikethroughStyle {
    [self sc_addAttribute:NSStrikethroughStyleAttributeName value:strikethroughStyle];
}

- (void)sc_removeStrikethroughStyleInRange:(NSRange)range {
    [self removeAttribute:NSStrikethroughStyleAttributeName range:range];
}

- (void)sc_removeStrikethroughStyle {
    [self sc_removeAttribute:NSStrikethroughStyleAttributeName];
}

#pragma mark - Underline Style
- (void)sc_setUnderlineStyle:(NSNumber *)underlineStyle range:(NSRange)range {
    [self sc_setAttribute:NSUnderlineStyleAttributeName value:underlineStyle range:range];
}

- (void)sc_setUnderlineStyle:(NSNumber *)underlineStyle {
    [self sc_setAttribute:NSUnderlineStyleAttributeName value:underlineStyle];
}

- (void)sc_addUnderlineStyle:(NSNumber *)underlineStyle range:(NSRange)range {
    [self addAttribute:NSUnderlineStyleAttributeName value:underlineStyle range:range];
}

- (void)sc_addUnderlineStyle:(NSNumber *)underlineStyle {
    [self sc_addAttribute:NSUnderlineStyleAttributeName value:underlineStyle];
}

- (void)sc_removeUnderlineStyleInRange:(NSRange)range {
    [self removeAttribute:NSUnderlineStyleAttributeName range:range];
}

- (void)sc_removeUnderlineStyle {
    [self sc_removeAttribute:NSUnderlineStyleAttributeName];
}

#pragma mark - Stroke Color
- (void)sc_setStrokeColor:(UIColor *)color range:(NSRange)range {
    [self sc_setAttribute:NSStrokeColorAttributeName value:color range:range];
}

- (void)sc_setStrokeColor:(UIColor *)color {
    [self sc_setAttribute:NSStrokeColorAttributeName value:color];
}

- (void)sc_addStrokeColor:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSStrokeColorAttributeName value:color range:range];
}

- (void)sc_addStrokeColor:(UIColor *)color {
    [self sc_addAttribute:NSStrokeColorAttributeName value:color];
}

- (void)sc_removeStrokeColorInRange:(NSRange)range {
    [self removeAttribute:NSStrokeColorAttributeName range:range];
}

- (void)sc_removeStrokeColor {
    [self sc_removeAttribute:NSStrokeColorAttributeName];
}

#pragma mark - Stroke Width
- (void)sc_setStrokeWidth:(NSNumber *)strokeWidth range:(NSRange)range {
    [self sc_setAttribute:NSStrokeWidthAttributeName value:strokeWidth range:range];
}

- (void)sc_setStrokeWidth:(NSNumber *)strokeWidth {
    [self sc_setAttribute:NSStrokeWidthAttributeName value:strokeWidth];
}

- (void)sc_addStrokeWidth:(NSNumber *)strokeWidth range:(NSRange)range {
    [self addAttribute:NSStrokeWidthAttributeName value:strokeWidth range:range];
}

- (void)sc_addStrokeWidth:(NSNumber *)strokeWidth {
    [self sc_addAttribute:NSStrokeWidthAttributeName value:strokeWidth];
}

- (void)sc_removeStrokeWidthInRange:(NSRange)range {
    [self removeAttribute:NSStrokeWidthAttributeName range:range];
}

- (void)sc_removeStrokeWidth {
    [self sc_removeAttribute:NSStrokeWidthAttributeName];
}

#pragma mark - Shadow
- (void)sc_setShadow:(NSShadow *)shadow range:(NSRange)range {
    [self sc_setAttribute:NSShadowAttributeName value:shadow range:range];
}

- (void)sc_setShadow:(NSShadow *)shadow {
    [self sc_setAttribute:NSShadowAttributeName value:shadow];
}

- (void)sc_addShadow:(NSShadow *)shadow range:(NSRange)range {
    [self addAttribute:NSShadowAttributeName value:shadow range:range];
}

- (void)sc_addShadow:(NSShadow *)shadow {
    [self sc_addAttribute:NSShadowAttributeName value:shadow];
}

- (void)sc_removeShadowInRange:(NSRange)range {
    [self removeAttribute:NSShadowAttributeName range:range];
}

- (void)sc_removeShadow {
    [self sc_removeAttribute:NSShadowAttributeName];
}

#pragma mark - Text Effect
- (void)sc_setTextEffect:(NSString *)textEffect range:(NSRange)range {
    [self sc_setAttribute:NSTextEffectAttributeName value:textEffect range:range];
}

- (void)sc_setTextEffect:(NSString *)textEffect {
    [self sc_setAttribute:NSTextEffectAttributeName value:textEffect];
}

- (void)sc_addTextEffect:(NSString *)textEffect range:(NSRange)range {
    [self addAttribute:NSTextEffectAttributeName value:textEffect range:range];
}

- (void)sc_addTextEffect:(NSString *)textEffect {
    [self sc_addAttribute:NSTextEffectAttributeName value:textEffect];
}

- (void)sc_removeTextEffectInRange:(NSRange)range {
    [self removeAttribute:NSTextEffectAttributeName range:range];
}

- (void)sc_removeTextEffect {
    [self sc_removeAttribute:NSTextEffectAttributeName];
}

#pragma mark - Attachment
- (void)sc_setAttachment:(NSTextAttachment *)attachment range:(NSRange)range {
    [self sc_setAttribute:NSAttachmentAttributeName value:attachment range:range];
}

- (void)sc_setAttachment:(NSTextAttachment *)attachment {
    [self sc_setAttribute:NSAttachmentAttributeName value:attachment];
}

- (void)sc_addAttachment:(NSTextAttachment *)attachment range:(NSRange)range {
    [self addAttribute:NSAttachmentAttributeName value:attachment range:range];
}

- (void)sc_addAttachment:(NSTextAttachment *)attachment {
    [self sc_addAttribute:NSAttachmentAttributeName value:attachment];
}

- (void)sc_removeAttachmentInRange:(NSRange)range {
    [self removeAttribute:NSAttachmentAttributeName range:range];
}

- (void)sc_removeAttachment {
    [self sc_removeAttribute:NSAttachmentAttributeName];
}

#pragma mark - Link
- (void)sc_setLink:(id)link range:(NSRange)range {
    [self sc_setAttribute:NSLinkAttributeName value:link range:range];
}

- (void)sc_setLink:(id)link {
    [self sc_setAttribute:NSLinkAttributeName value:link];
}

- (void)sc_addLink:(id)link range:(NSRange)range {
    [self addAttribute:NSLinkAttributeName value:link range:range];
}

- (void)sc_addLink:(id)link {
    [self sc_addAttribute:NSLinkAttributeName value:link];
}

- (void)sc_removeLinkInRange:(NSRange)range {
    [self removeAttribute:NSLinkAttributeName range:range];
}

- (void)sc_removeLink {
    [self sc_removeAttribute:NSLinkAttributeName];
}

#pragma mark - Baseline Offset
- (void)sc_setBaselineOffset:(NSNumber *)baselineOffset range:(NSRange)range {
    [self sc_setAttribute:NSBaselineOffsetAttributeName value:baselineOffset range:range];
}

- (void)sc_setBaselineOffset:(NSNumber *)baselineOffset {
    [self sc_setAttribute:NSBaselineOffsetAttributeName value:baselineOffset];
}

- (void)sc_addBaselineOffset:(NSNumber *)baselineOffset range:(NSRange)range {
    [self addAttribute:NSBaselineOffsetAttributeName value:baselineOffset range:range];
}

- (void)sc_addBaselineOffset:(NSNumber *)baselineOffset {
    [self sc_addAttribute:NSBaselineOffsetAttributeName value:baselineOffset];
}

- (void)sc_removeBaselineOffsetInRange:(NSRange)range {
    [self removeAttribute:NSBaselineOffsetAttributeName range:range];
}

- (void)sc_removeBaselineOffset {
    [self sc_removeAttribute:NSBaselineOffsetAttributeName];
}

#pragma mark - Underline Color
- (void)sc_setUnderlineColor:(UIColor *)color range:(NSRange)range {
    [self sc_setAttribute:NSUnderlineColorAttributeName value:color range:range];
}

- (void)sc_setUnderlineColor:(UIColor *)color {
    [self sc_setAttribute:NSUnderlineColorAttributeName value:color];
}

- (void)sc_addUnderlineColor:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
}

- (void)sc_addUnderlineColor:(UIColor *)color {
    [self sc_addAttribute:NSUnderlineColorAttributeName value:color];
}

- (void)sc_removeUnderlineColorInRange:(NSRange)range {
    [self removeAttribute:NSUnderlineColorAttributeName range:range];
}

- (void)sc_removeUnderlineColor {
    [self sc_removeAttribute:NSUnderlineColorAttributeName];
}

#pragma mark - Strikethrough Color
- (void)sc_setStrikethroughColor:(UIColor *)color range:(NSRange)range {
    [self sc_setAttribute:NSStrikethroughColorAttributeName value:color range:range];
}

- (void)sc_setStrikethroughColor:(UIColor *)color {
    [self sc_setAttribute:NSStrikethroughColorAttributeName value:color];
}

- (void)sc_addStrikethroughColor:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
}

- (void)sc_addStrikethroughColor:(UIColor *)color {
    [self sc_addAttribute:NSStrikethroughColorAttributeName value:color];
}

- (void)sc_removeStrikethroughColorInRange:(NSRange)range {
    [self removeAttribute:NSStrikethroughColorAttributeName range:range];
}

- (void)sc_removeStrikethroughColor {
    [self sc_removeAttribute:NSStrikethroughColorAttributeName];
}

#pragma mark - Obliqueness
- (void)sc_setObliqueness:(NSNumber *)obliqueness range:(NSRange)range {
    [self sc_setAttribute:NSObliquenessAttributeName value:obliqueness range:range];
}

- (void)sc_setObliqueness:(NSNumber *)obliqueness {
    [self sc_setAttribute:NSObliquenessAttributeName value:obliqueness];
}

- (void)sc_addObliqueness:(NSNumber *)obliqueness range:(NSRange)range {
    [self addAttribute:NSObliquenessAttributeName value:obliqueness range:range];
}

- (void)sc_addObliqueness:(NSNumber *)obliqueness {
    [self sc_addAttribute:NSObliquenessAttributeName value:obliqueness];
}

- (void)sc_removeObliquenessInRange:(NSRange)range {
    [self removeAttribute:NSObliquenessAttributeName range:range];
}

- (void)sc_removeObliqueness {
    [self sc_removeAttribute:NSObliquenessAttributeName];
}

#pragma mark - Expansion
- (void)sc_setExpansion:(NSNumber *)expansion range:(NSRange)range {
    [self sc_setAttribute:NSExpansionAttributeName value:expansion range:range];
}

- (void)sc_setExpansion:(NSNumber *)expansion {
    [self sc_setAttribute:NSExpansionAttributeName value:expansion];
}

- (void)sc_addExpansion:(NSNumber *)expansion range:(NSRange)range {
    [self addAttribute:NSExpansionAttributeName value:expansion range:range];
}

- (void)sc_addExpansion:(NSNumber *)expansion {
    [self sc_addAttribute:NSExpansionAttributeName value:expansion];
}

- (void)sc_removeExpansionInRange:(NSRange)range {
    [self removeAttribute:NSExpansionAttributeName range:range];
}

- (void)sc_removeExpansion {
    [self sc_removeAttribute:NSExpansionAttributeName];
}

#pragma mark - Writing Direction
- (void)sc_setWritingDirection:(NSArray<NSNumber *> *)writingDirection range:(NSRange)range {
    [self sc_setAttribute:NSWritingDirectionAttributeName value:writingDirection range:range];
}

- (void)sc_setWritingDirection:(NSArray<NSNumber *> *)writingDirection {
    [self sc_setAttribute:NSWritingDirectionAttributeName value:writingDirection];
}

- (void)sc_addWritingDirection:(NSArray<NSNumber *> *)writingDirection range:(NSRange)range {
    [self addAttribute:NSWritingDirectionAttributeName value:writingDirection range:range];
}

- (void)sc_addWritingDirection:(NSArray<NSNumber *> *)writingDirection {
    [self sc_addAttribute:NSWritingDirectionAttributeName value:writingDirection];
}

- (void)sc_removeWritingDirectionInRange:(NSRange)range {
    [self removeAttribute:NSWritingDirectionAttributeName range:range];
}

- (void)sc_removeWritingDirection {
    [self sc_removeAttribute:NSWritingDirectionAttributeName];
}

#pragma mark - Vertical Glyph Form
- (void)sc_setVerticalGlyphForm:(NSNumber *)verticalGlyphForm range:(NSRange)range {
    [self sc_setAttribute:NSVerticalGlyphFormAttributeName value:verticalGlyphForm range:range];
}

- (void)sc_setVerticalGlyphForm:(NSNumber *)verticalGlyphForm {
    [self sc_setAttribute:NSVerticalGlyphFormAttributeName value:verticalGlyphForm];
}

- (void)sc_addVerticalGlyphForm:(NSNumber *)verticalGlyphForm range:(NSRange)range {
    [self addAttribute:NSVerticalGlyphFormAttributeName value:verticalGlyphForm range:range];
}

- (void)sc_addVerticalGlyphForm:(NSNumber *)verticalGlyphForm {
    [self sc_addAttribute:NSVerticalGlyphFormAttributeName value:verticalGlyphForm];
}

- (void)sc_removeVerticalGlyphFormInRange:(NSRange)range {
    [self removeAttribute:NSVerticalGlyphFormAttributeName range:range];
}

- (void)sc_removeVerticalGlyphForm {
    [self sc_removeAttribute:NSVerticalGlyphFormAttributeName];
}

@end

//
//  UIFont+SCBase.m
//  Pods
//
//  Created by Solo on 17/1/10.
//  Copyright © 2017年 SC. All rights reserved.
//

#import "UIFont+SCBase.h"
#import <CoreText/CoreText.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation UIFont (SCBase)

#pragma mark - Base
- (CGFloat)sc_fontWeight {
    NSDictionary *traits = [self.fontDescriptor objectForKey:UIFontDescriptorTraitsAttribute];
    return [traits[UIFontWeightTrait] floatValue];
}

- (UIFont *)sc_fontWithBold {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return self;
    return [UIFont fontWithDescriptor:[self.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold] size:self.pointSize];
}

- (UIFont *)sc_fontWithItalic {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return self;
    return [UIFont fontWithDescriptor:[self.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitItalic] size:self.pointSize];
}

- (UIFont *)sc_fontWithBoldItalic {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return self;
    return [UIFont fontWithDescriptor:[self.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic] size:self.pointSize];
}

- (UIFont *)sc_fontWithNormal {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return self;
    return [UIFont fontWithDescriptor:[self.fontDescriptor fontDescriptorWithSymbolicTraits:0] size:self.pointSize];
}

+ (UIFont *)sc_fontWithCTFont:(CTFontRef)CTFont {
    if (!CTFont) return nil;
    CFStringRef name = CTFontCopyPostScriptName(CTFont);
    if (!name) return nil;
    CGFloat size = CTFontGetSize(CTFont);
    UIFont *font = [self fontWithName:(__bridge NSString *)(name) size:size];
    CFRelease(name);
    return font;
}

+ (UIFont *)sc_fontWithCGFont:(CGFontRef)CGFont size:(CGFloat)size {
    if (!CGFont) return nil;
    CFStringRef name = CGFontCopyPostScriptName(CGFont);
    if (!name) return nil;
    UIFont *font = [self fontWithName:(__bridge NSString *)(name) size:size];
    CFRelease(name);
    return font;
}

- (CTFontRef)sc_CTFontRef CF_RETURNS_RETAINED  { // Name CTFontRef <-> CTFontRef
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)self.fontName, self.pointSize, NULL);
    return font;
}

- (CGFontRef)sc_CGFontRef CF_RETURNS_RETAINED {
    CGFontRef font = CGFontCreateWithFontName((__bridge CFStringRef)self.fontName);
    return font;
}

#pragma mark - Check
- (BOOL)sc_isBold {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO; // fontDescriptor:文字描述符
    return (self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) > 0; 
}

- (BOOL)sc_isItalic {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic) > 0;
}

- (BOOL)sc_isMonoSpace {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitMonoSpace) > 0;
}

- (BOOL)sc_isColorGlyphs {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (CTFontGetSymbolicTraits((__bridge CTFontRef)self) & kCTFontTraitColorGlyphs) != 0;
}

#pragma mark - Load & Unload 
+ (BOOL)sc_loadFontFromPath:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    CFErrorRef error;
    BOOL suc = CTFontManagerRegisterFontsForURL((__bridge CFTypeRef)url, kCTFontManagerScopeNone, &error); // 加载字体
    if (!suc) {
        NSLog(@"Failed to load font: %@", error);
    }
    return suc;
}

+ (void)sc_unloadFontFromPath:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    CTFontManagerUnregisterFontsForURL((__bridge CFTypeRef)url, kCTFontManagerScopeNone, NULL);
}

+ (UIFont *)sc_loadFontFromData:(NSData *)data {
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    if (!provider) return nil;
    CGFontRef fontRef = CGFontCreateWithDataProvider(provider);
    CGDataProviderRelease(provider);
    if (!fontRef) return nil;
    
    CFErrorRef errorRef;
    BOOL suc = CTFontManagerRegisterGraphicsFont(fontRef, &errorRef);
    if (!suc) {
        CFRelease(fontRef);
        NSLog(@"%@", errorRef);
        return nil;
    } else {
        CFStringRef fontName = CGFontCopyPostScriptName(fontRef);
        UIFont *font = [UIFont fontWithName:(__bridge NSString *)(fontName) size:[UIFont systemFontSize]];
        if (fontName) CFRelease(fontName);
        CGFontRelease(fontRef);
        return font;
    }
}

+ (BOOL)sc_unloadFontFromData:(UIFont *)font {
    CGFontRef fontRef = CGFontCreateWithFontName((__bridge CFStringRef)font.fontName);
    if (!fontRef) return NO;
    CFErrorRef errorRef;
    BOOL suc = CTFontManagerUnregisterGraphicsFont(fontRef, &errorRef);
    CFRelease(fontRef);
    if (!suc) NSLog(@"%@", errorRef);
    return suc;
}

#pragma mark - Font Data
+ (NSData *)sc_dataFromFont:(UIFont *)font {
    CGFontRef cgFont = font.sc_CGFontRef;
    NSData *data = [self sc_dataFromCGFont:cgFont];
    CGFontRelease(cgFont);
    return data;
}

typedef struct SCFontHeader {
    int32_t fVersion;
    uint16_t fNumTables;
    uint16_t fSearchRange;
    uint16_t fEntrySelector;
    uint16_t fRangeShift;
} SCFontHeader;

typedef struct SCTableEntry {
    uint32_t fTag;
    uint32_t fCheckSum;
    uint32_t fOffset;
    uint32_t fLength;
} SCTableEntry;

static uint32_t SCCalcTableCheckSum(const uint32_t *table, uint32_t numberOfBytesInTable)
{
    uint32_t sum = 0;
    uint32_t nLongs = (numberOfBytesInTable + 3) / 4;
    while (nLongs-- > 0) {
        sum += CFSwapInt32HostToBig(*table++);
    }
    return sum;
}

//Reference:
//https://github.com/google/skia/blob/master/src%2Fports%2FSkFontHost_mac.cpp
+ (NSData *)sc_dataFromCGFont:(CGFontRef)cgFont {
    if (!cgFont) return nil;
    
    CFRetain(cgFont);
    
    CFArrayRef tags = CGFontCopyTableTags(cgFont);
    if (!tags) return nil;
    CFIndex tableCount = CFArrayGetCount(tags);
    
    size_t *tableSizes = malloc(sizeof(size_t) * tableCount);
    memset(tableSizes, 0, sizeof(size_t) * tableCount);
    
    BOOL containsCFFTable = NO;
    
    size_t totalSize = sizeof(SCFontHeader) + sizeof(SCTableEntry) * tableCount;
    
    for (CFIndex index = 0; index < tableCount; index++) {
        size_t tableSize = 0;
        uint32_t aTag = (uint32_t)CFArrayGetValueAtIndex(tags, index);
        if (aTag == kCTFontTableCFF && !containsCFFTable) {
            containsCFFTable = YES;
        }
        CFDataRef tableDataRef = CGFontCopyTableForTag(cgFont, aTag);
        if (tableDataRef) {
            tableSize = CFDataGetLength(tableDataRef);
            CFRelease(tableDataRef);
        }
        totalSize += (tableSize + 3) & ~3;
        tableSizes[index] = tableSize;
    }
    
    unsigned char *stream = malloc(totalSize);
    memset(stream, 0, totalSize);
    char *dataStart = (char *)stream;
    char *dataPtr = dataStart;
    
    // compute font header entries
    uint16_t entrySelector = 0;
    uint16_t searchRange = 1;
    while (searchRange < tableCount >> 1) {
        entrySelector++;
        searchRange <<= 1;
    }
    searchRange <<= 4;
    
    uint16_t rangeShift = (tableCount << 4) - searchRange;
    
    // write font header (also called sfnt header, offset subtable)
    SCFontHeader *offsetTable = (SCFontHeader *)dataPtr;
    
    //OpenType Font contains CFF Table use 'OTTO' as version, and with .otf extension
    //otherwise 0001 0000
    offsetTable->fVersion = containsCFFTable ? 'OTTO' : CFSwapInt16HostToBig(1);
    offsetTable->fNumTables = CFSwapInt16HostToBig((uint16_t)tableCount);
    offsetTable->fSearchRange = CFSwapInt16HostToBig((uint16_t)searchRange);
    offsetTable->fEntrySelector = CFSwapInt16HostToBig((uint16_t)entrySelector);
    offsetTable->fRangeShift = CFSwapInt16HostToBig((uint16_t)rangeShift);
    
    dataPtr += sizeof(SCFontHeader);
    
    // write tables
    SCTableEntry *entry = (SCTableEntry *)dataPtr;
    dataPtr += sizeof(SCTableEntry) * tableCount;
    
    for (int index = 0; index < tableCount; ++index) {
        uint32_t aTag = (uint32_t)CFArrayGetValueAtIndex(tags, index);
        CFDataRef tableDataRef = CGFontCopyTableForTag(cgFont, aTag);
        size_t tableSize = CFDataGetLength(tableDataRef);
        
        memcpy(dataPtr, CFDataGetBytePtr(tableDataRef), tableSize);
        
        entry->fTag = CFSwapInt32HostToBig((uint32_t)aTag);
        entry->fCheckSum = CFSwapInt32HostToBig(SCCalcTableCheckSum((uint32_t *)dataPtr, (uint32_t)tableSize));
        
        uint32_t offset = (uint32_t)dataPtr - (uint32_t)dataStart;
        entry->fOffset = CFSwapInt32HostToBig((uint32_t)offset);
        entry->fLength = CFSwapInt32HostToBig((uint32_t)tableSize);
        dataPtr += (tableSize + 3) & ~3;
        ++entry;
        CFRelease(tableDataRef);
    }
    
    CFRelease(cgFont);
    CFRelease(tags);
    free(tableSizes);
    NSData *fontData = [NSData dataWithBytesNoCopy:stream length:totalSize freeWhenDone:YES];
    return fontData;
}

@end

#pragma clang diagnostic pop

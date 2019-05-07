//
//  NSAttributedString+SCCreation.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSAttributedString+SCCreation.h"
#import "NSAttributedString+SCBase.h"
#import <UIKit/UIKit.h>

@implementation NSAttributedString (SCCreation)

+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string textColor:(UIColor *)textColor {
    return [self sc_attributedStringWithString:string textColor:textColor backgroundColor:nil font:nil paragraphStyle:nil];
}

+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string backgroundColor:(UIColor *)backgroundColor {
    return [self sc_attributedStringWithString:string textColor:nil backgroundColor:backgroundColor font:nil paragraphStyle:nil];
}

+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string font:(UIFont *)font {
    return [self sc_attributedStringWithString:string textColor:nil backgroundColor:nil font:font paragraphStyle:nil];
}

+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string paragraphStyle:(NSParagraphStyle *)paragraphStyle {
    return [self sc_attributedStringWithString:string textColor:nil backgroundColor:nil font:nil paragraphStyle:paragraphStyle];
}

+ (NSAttributedString *)sc_attributedStringWithString:(NSString *)string textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font paragraphStyle:(NSParagraphStyle *)paragraphStyle {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:string];
    if (textColor) {
        [mutableAttributedString sc_addForegroundColor:textColor];
    }
    if (backgroundColor) {
        [mutableAttributedString sc_addBackgroundColor:backgroundColor];
    }
    if (font) {
        [mutableAttributedString sc_addFont:font];
    }
    if (paragraphStyle) {
        [mutableAttributedString sc_addParagraphStyle:paragraphStyle];
    }
    return mutableAttributedString.copy;
}

@end

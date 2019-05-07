//
//  NSParagraphStyle+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreText/CTParagraphStyle.h>

@interface NSParagraphStyle (SCBase)

/**
 根据CTParagraphStyleRef, 创建NSParagraphStyle
 
 @param CTParagraphStyle CTParagraphStyleRef
 
 @return NSParagraphStyle对象
 */
+ (NSParagraphStyle *)sc_paragraphstyleWithCTParagraphStyle:(CTParagraphStyleRef)CTParagraphStyle;

/**
 创建CTParagraphStyleRef(需调用CFRelease()方法释放)

 @return CTParagraphStyleRef
 */
- (CTParagraphStyleRef)sc_CTParagraphStyle CF_RETURNS_RETAINED;

@end

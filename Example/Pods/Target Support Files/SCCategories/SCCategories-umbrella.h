#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SCCategories.h"
#import "SCCoreGraphicHelper.h"
#import "NSArray+SCCategories.h"
#import "NSArray+SCBase.h"
#import "NSArray+SCPropertyList.h"
#import "NSArray+SCSort.h"
#import "NSAttributedString+SCCategories.h"
#import "NSAttributedString+SCBase.h"
#import "NSAttributedString+SCCreation.h"
#import "NSAttributedString+SCMask.h"
#import "NSAttributedString+SCParagraphStyleAttributes.h"
#import "NSBundle+SCCategories.h"
#import "NSBundle+SCBase.h"
#import "NSCalendar+SCCategories.h"
#import "NSCalendar+SCBase.h"
#import "NSData+SCCategories.h"
#import "NSData+SCBase.h"
#import "NSData+SCBase64.h"
#import "NSData+SCEncryptAndDecrypt.h"
#import "NSData+SCHash.h"
#import "NSData+SCPackAndUnpack.h"
#import "NSDate+SCCategories.h"
#import "NSDate+SCBase.h"
#import "NSDate+SCDateFormat.h"
#import "NSDecimalNumber+SCCategories.h"
#import "NSDecimalNumber+SCBase.h"
#import "NSDecimalNumber+SCRoundNumber.h"
#import "NSDictionary+SCCategories.h"
#import "NSDictionary+SCBase.h"
#import "NSDictionary+SCPropertyList.h"
#import "NSFileManager+SCCategories.h"
#import "NSFileManager+SCBase.h"
#import "NSIndexPath+SCCategories.h"
#import "NSIndexPath+SCBase.h"
#import "NSKeyedArchiver+SCCategories.h"
#import "NSKeyedArchiver+SCBase.h"
#import "NSNotificationCenter+SCCategories.h"
#import "NSNotificationCenter+SCBase.h"
#import "NSNumber+SCCategories.h"
#import "NSNumber+SCBase.h"
#import "NSObject+SCCategories.h"
#import "NSObject+SCAssociatedValue.h"
#import "NSObject+SCBase.h"
#import "NSObject+SCKeyValueCoding.h"
#import "NSObject+SCKeyValueObserving.h"
#import "NSObject+SCSwizzleMethod.h"
#import "NSParagraphStyle+SCCategories.h"
#import "NSParagraphStyle+SCBase.h"
#import "NSSet+SCCategories.h"
#import "NSSet+SCBase.h"
#import "NSString+SCCategories.h"
#import "NSString+SCBase.h"
#import "NSString+SCBase64String.h"
#import "NSString+SCCheck.h"
#import "NSString+SCChinese.h"
#import "NSString+SCDrawing.h"
#import "NSString+SCEmoji.h"
#import "NSString+SCHashString.h"
#import "NSString+SCNumberValue.h"
#import "NSString+SCPathString.h"
#import "NSString+SCPinyin.h"
#import "NSString+SCRegularExpression.h"
#import "NSString+SCRoundNumberString.h"
#import "NSString+SCSecurityString.h"
#import "NSString+SCTrimming.h"
#import "NSString+SCURLString.h"
#import "NSString+SCUTF32String.h"
#import "NSString+SCUUIDString.h"
#import "NSThread+SCCategories.h"
#import "NSThread+SCBase.h"
#import "NSTimer+SCCategories.h"
#import "NSTimer+SCBase.h"
#import "NSURLComponents+SCCategories.h"
#import "NSURLComponents+SCBase.h"
#import "NSValue+SCCategories.h"
#import "NSValue+SCBase.h"
#import "SCAudioMarco.h"
#import "SCMacroHelper.h"
#import "SCUIMarco.h"
#import "CALayer+SCCategories.h"
#import "CALayer+SCBase.h"
#import "CALayer+SCFadeAnimation.h"
#import "CALayer+SCLayout.h"
#import "CALayer+SCShadow.h"
#import "CALayer+SCSnapshot.h"
#import "CALayer+SCTransform.h"
#import "UIApplication+SCCategories.h"
#import "UIApplication+SCBase.h"
#import "UIApplication+SCNetworkActivityIndicator.h"
#import "UIApplication+SCTopViewController.h"
#import "UIBarButtonItem+SCCategories.h"
#import "UIBarButtonItem+SCBase.h"
#import "UIBezierPath+SCCategories.h"
#import "UIBezierPath+SCBase.h"
#import "UIButton+SCCategories.h"
#import "UIButton+SCBase.h"
#import "UIButton+SCConfigureForState.h"
#import "UIButton+SCCountDown.h"
#import "UICollectionView+SCCategories.h"
#import "UICollectionView+SCBase.h"
#import "UICollectionViewFlowLayout+SCCategories.h"
#import "UICollectionViewFlowLayout+SCBase.h"
#import "UIColor+SCCategories.h"
#import "UIColor+SCBase.h"
#import "UIColor+SCCMYKColor.h"
#import "UIColor+SCColorConvert.h"
#import "UIColor+SCHSBColor.h"
#import "UIColor+SCHSLColor.h"
#import "UIControl+SCCategories.h"
#import "UIControl+SCBase.h"
#import "UIControl+SCRepeatClickPrevention.h"
#import "UIDevice+SCCategories.h"
#import "UIDevice+SCBase.h"
#import "UIDevice+SCCPUInfo.h"
#import "UIDevice+SCDiskInfo.h"
#import "UIDevice+SCMemoryInfo.h"
#import "UIDevice+SCNetworkInfo.h"
#import "UIDevice+SCSIMInfo.h"
#import "UIFont+SCCategories.h"
#import "UIFont+SCBase.h"
#import "UIGestureRecognizer+SCCategories.h"
#import "UIGestureRecognizer+SCBase.h"
#import "UIImage+SCCategories.h"
#import "UIImage+SCBase.h"
#import "UIImage+SCBlurredImage.h"
#import "UIImage+SCColoredImage.h"
#import "UIImage+SCEmojiImage.h"
#import "UIImage+SCGIFImage.h"
#import "UIImage+SCGradientImage.h"
#import "UIImage+SCImageBorder.h"
#import "UIImage+SCImageCompression.h"
#import "UIImage+SCImageCropped.h"
#import "UIImage+SCImageFixed.h"
#import "UIImage+SCImageRotation.h"
#import "UIImage+SCRoundedImage.h"
#import "UINavigationBar+SCCategories.h"
#import "UINavigationBar+SCBase.h"
#import "UINavigationController+SCCategories.h"
#import "UINavigationController+SCBase.h"
#import "UIScreen+SCCategories.h"
#import "UIScreen+SCBase.h"
#import "UIScrollView+SCCategories.h"
#import "UIScrollView+SCBase.h"
#import "UISlider+SCCategories.h"
#import "UISlider+SCBase.h"
#import "UISwipeGestureRecognizer+SCCategories.h"
#import "UISwipeGestureRecognizer+SCBase.h"
#import "UITabBar+SCCategories.h"
#import "UITabBar+SCBase.h"
#import "UITableView+SCCategories.h"
#import "UITableView+SCBase.h"
#import "UITableViewCell+SCCategories.h"
#import "UITableViewCell+SCBase.h"
#import "UITextField+SCCategories.h"
#import "UITextField+SCBase.h"
#import "UITextView+SCCategories.h"
#import "UITextView+SCBase.h"
#import "UIView+SCCategories.h"
#import "UIView+SCBase.h"
#import "UIView+SCCountDown.h"
#import "UIView+SCLayout.h"
#import "UIView+SCNibView.h"
#import "UIView+SCShadow.h"
#import "UIView+SCShakeAnimation.h"
#import "UIView+SCSnapshot.h"
#import "UIView+SCTouchInset.h"
#import "UIViewController+SCCategories.h"
#import "UIViewController+SCBase.h"

FOUNDATION_EXPORT double SCCategoriesVersionNumber;
FOUNDATION_EXPORT const unsigned char SCCategoriesVersionString[];


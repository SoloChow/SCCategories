//
//  UIDevice+SCSIMInfo.h
//  Pods
//
//  Created by Solo on 17/6/2.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (SCSIMInfo)

@property (nonatomic, readonly) NSString *sc_SIMCarrierName; ///< 获取设备SIM卡运营商名字

@end

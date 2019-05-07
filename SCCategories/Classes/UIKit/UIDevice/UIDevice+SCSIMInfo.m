//
//  UIDevice+SCSIMInfo.m
//  Pods
//
//  Created by Solo on 17/6/2.
//
//

#import "UIDevice+SCSIMInfo.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation UIDevice (SCSIMInfo)

- (NSString *)sc_SIMCarrierName {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    return info.subscriberCellularProvider.carrierName;
}


@end

//
//  UIDevice+SCBase.h
//  Pods
//
//  Created by Solo on 17/1/9.
//  Copyright © 2017年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (SCBase)

#pragma mark - Base
+ (NSString *)sc_deviceModel;

+ (BOOL)sc_isIPad;
+ (BOOL)sc_isIPod;
+ (BOOL)sc_isIPhone;
+ (BOOL)sc_isSimulator;

@end

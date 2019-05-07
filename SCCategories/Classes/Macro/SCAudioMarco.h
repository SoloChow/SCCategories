//
//  ONAudioMarco.h
//  ONCategories
//
//  Created by solo on 2019/1/29.
//

#ifndef ONAudioMarco_h
#define ONAudioMarco_h

#import "AudioToolbox/AudioToolbox.h"

#pragma mark - Taptic Engine

// 主体视觉色

/// Taptic Engine Peek 震动
#define ONTapticPeek AudioServicesPlaySystemSound(1519);

/// Taptic Engine Pop 强震动
#define ONTapticPop AudioServicesPlaySystemSound(1520);

/// Taptic Engine 震动两次
#define ONTapticDouble AudioServicesPlaySystemSound(1521);


#endif /* ONAudioMarco_h */

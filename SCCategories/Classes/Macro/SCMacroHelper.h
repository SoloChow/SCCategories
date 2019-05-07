//
//  SCMacroHelper.h
//  Pods
//
//  Created by Solo on 17/1/10.
//
//
#import <pthread.h>

#ifndef SCMacroHelper_h
#define SCMacroHelper_h

/**
 创建RGB颜色
 */
#ifndef SCRGB
#define SCRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#endif

/**
 创建RGBA颜色
 */
#ifndef SCRGBA
#define SCRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]
#endif

/**
 创建随机RGB颜色
 */
#ifndef SCRandomColor
#define SCRandomColor SCRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif

/**
 将X的值限定在[low, high]范围内
 */
#ifndef sc_CLAMP_VALUES
#define sc_CLAMP_VALUES(_x_, _low_, _high_)  (((_x_) > (_high_)) ? (_high_) : (((_x_) < (_low_)) ? (_low_) : (_x_)))
#endif

/**
 交换两个Value
 */
#ifndef sc_SWAP_VALUES
#define sc_SWAP_VALUES(_A_, _B_)  do { __typeof__(_A_) _tmp_ = (_A_); (_A_) = (_B_); (_B_) = _tmp_; } while (0)
#endif

#pragma mark - Queue
/**
 当前线程是否为主线程
 */
static inline bool sc_dispatch_is_main_queue() {
    return pthread_main_np() != 0;
}

/**
 异步到主线程
 */
static inline void sc_dispatch_async_on_main_queue(void (^block)()) {
    if (pthread_main_np()) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

/**
 同步到主线程
 */
static inline void sc_dispatch_sync_on_main_queue(void (^block)()) {
    if (pthread_main_np()) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

#endif /* SCMacroHelper_h */

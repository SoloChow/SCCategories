//
//  NSData+SCJSONValue.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSData+SCJSONValue.h"

@implementation NSData (SCJSONValue)

- (id)sc_JSONValueDecoded {
    NSError *error = nil;
    id value = [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:&error];
    if (error) {
        NSLog(@"JSONValueDecoded error:%@", error);
    }
    return value;
}

@end

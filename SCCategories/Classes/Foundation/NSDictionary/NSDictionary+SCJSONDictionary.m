//
//  NSDictionary+SCJSONDictionary.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSDictionary+SCJSONDictionary.h"

@implementation NSDictionary (SCJSONDictionary)

- (NSString *)sc_JSONStringEncode {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        if (!error) return JSONString;
    }
    return nil;
}

- (NSString *)sc_JSONPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        if (!error) return JSONString;
    }
    return nil;
}

@end

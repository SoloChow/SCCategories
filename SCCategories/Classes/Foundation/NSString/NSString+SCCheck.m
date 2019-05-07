//
//  NSString+SCCheck.m
//  Pods
//
//  Created by Solo on 17/2/10.
//
//

#import "NSString+SCCheck.h"
#import "NSString+SCBase.h"
#import "NSString+SCRegularExpression.h"
#import "NSDictionary+SCBase.h"

@implementation NSString (SCCheck)

- (BOOL)sc_isDecimalNumber {
    if (!self.length) return NO;
    
    return self.sc_isPureInt;
}

- (BOOL)sc_isLetter {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^[A-Za-z]+$";
    });
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)sc_isLowercaseLetter {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^[a-z]+$";
    });
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)sc_isUppercaseLetter {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^[A-Z]+$";
    });
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)sc_isAlphanumericCharacter {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^[0-9A-Za-z]+$";
    });
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)sc_isEmail {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex =
        @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    });
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:[self lowercaseString]];
}

- (BOOL)sc_isMobilePhone {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
    });
    
    NSPredicate *mobilePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [mobilePredicate evaluateWithObject:self];
}

- (BOOL)sc_isTelNumber {
    if (!self.length) return NO;
    
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    });
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)_sc_isAreaCodeFromCardIDOfPRC {
    static NSMutableDictionary *dict;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict =  [[NSMutableDictionary alloc] init];
        [dict setObject:@"北京" forKey:@"11"];
        [dict setObject:@"天津" forKey:@"12"];
        [dict setObject:@"河北" forKey:@"13"];
        [dict setObject:@"山西" forKey:@"14"];
        [dict setObject:@"内蒙古" forKey:@"15"];
        [dict setObject:@"辽宁" forKey:@"21"];
        [dict setObject:@"吉林" forKey:@"22"];
        [dict setObject:@"黑龙江" forKey:@"23"];
        [dict setObject:@"上海" forKey:@"31"];
        [dict setObject:@"江苏" forKey:@"32"];
        [dict setObject:@"浙江" forKey:@"33"];
        [dict setObject:@"安徽" forKey:@"34"];
        [dict setObject:@"福建" forKey:@"35"];
        [dict setObject:@"江西" forKey:@"36"];
        [dict setObject:@"山东" forKey:@"37"];
        [dict setObject:@"河南" forKey:@"41"];
        [dict setObject:@"湖北" forKey:@"42"];
        [dict setObject:@"湖南" forKey:@"43"];
        [dict setObject:@"广东" forKey:@"44"];
        [dict setObject:@"广西" forKey:@"45"];
        [dict setObject:@"海南" forKey:@"46"];
        [dict setObject:@"重庆" forKey:@"50"];
        [dict setObject:@"四川" forKey:@"51"];
        [dict setObject:@"贵州" forKey:@"52"];
        [dict setObject:@"云南" forKey:@"53"];
        [dict setObject:@"西藏" forKey:@"54"];
        [dict setObject:@"陕西" forKey:@"61"];
        [dict setObject:@"甘肃" forKey:@"62"];
        [dict setObject:@"青海" forKey:@"63"];
        [dict setObject:@"宁夏" forKey:@"64"];
        [dict setObject:@"新疆" forKey:@"65"];
        [dict setObject:@"台湾" forKey:@"71"];
        [dict setObject:@"香港" forKey:@"81"];
        [dict setObject:@"澳门" forKey:@"82"];
        [dict setObject:@"国外" forKey:@"91"];
    });
    
    return [dict sc_containsObjectForKey:self];
}

- (BOOL)sc_isValidCardIDOfPRC {
    if (!self.length) return NO;
    if (self.length != 15 && self.length != 18) return NO;
    
    NSString *cardID = self;
    long lSumQT = 0;
    // 加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    // 校验码
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    // 将15位身份证号转换成18位
    NSMutableString *mString = [NSMutableString stringWithString:self];
    if (self.length == 15) {
        [mString insertString:@"19" atIndex:6];
        long p = 0;
        const char *pid = [mString UTF8String];
        
        for (int i = 0; i<= 16; i++) {
            p += (pid[i] - 48) * R[i];
        }
        
        int o = p % 11;
        NSString *stringContent = [NSString stringWithFormat:@"%c", sChecker[o]];
        [mString insertString:stringContent atIndex:[mString length]];
        cardID = mString.copy;
    }
    
    // 判断地区码
    NSString * sProvince = [cardID substringToIndex:2];
    if (![sProvince _sc_isAreaCodeFromCardIDOfPRC]) return NO;
    
    // 判断年月日是否有效
    // 年份
    int strYear = [[cardID substringWithRange:NSMakeRange(6, 4)] intValue];
    // 月份
    int strMonth = [[cardID substringWithRange:NSMakeRange(10, 2)] intValue];
    // 日
    int strDay = [[cardID substringWithRange:NSMakeRange(12, 2)] intValue];
    
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01", strYear, strMonth, strDay]];
    
    if (date == nil) return NO;
    
    const char *PaperId  = [cardID UTF8String];
    // 检验长度
    if(18 != strlen(PaperId)) return NO;
    
    // 校验数字
    for (int i = 0; i < 18; i++) {
        if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) ) {
            return NO;
        }
    }
    
    // 验证最末的校验码
    for (int i=0; i<=16; i++) {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    
    if (sChecker[lSumQT%11] != PaperId[17] ) return NO;
    
    return YES;
}

- (BOOL)sc_isValidCardIDOfHK {
    if (!self.length) return NO;
    
    //规则:http://shenfenzheng.bajiu.cn/?rid=40
    static NSString *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = @"^[A-Za-z]\\d{6}\\((\\d|[Aa])\\)";
    });
    BOOL validate = [self sc_matchesRegex:regex options:0];
    
    if (validate) {
        //计算
        
        //首字母
        NSString *initial = [self substringToIndex:1];
        NSInteger asciiCode = [initial characterAtIndex:0];
        
        NSInteger num1;
        if (asciiCode>=65 && asciiCode<=90) {
            num1 = asciiCode - 65 + 1;
        } else {
            num1 = asciiCode - 97 +1;
        }
        NSInteger num2 = [[self substringWithRange:NSMakeRange(1, 1)] integerValue];
        NSInteger num3 = [[self substringWithRange:NSMakeRange(2, 1)] integerValue];
        NSInteger num4 = [[self substringWithRange:NSMakeRange(3, 1)] integerValue];
        NSInteger num5 = [[self substringWithRange:NSMakeRange(4, 1)] integerValue];
        NSInteger num6 = [[self substringWithRange:NSMakeRange(5, 1)] integerValue];
        NSInteger num7 = [[self substringWithRange:NSMakeRange(6, 1)] integerValue];
        
        NSInteger result = num1*8 + num2*7 + num3*6 + num4*5 + num5*4 + num6*3 + num7*2;
        
        NSInteger remainder = result%11;
        
        NSString *lastCode = [self substringWithRange:NSMakeRange(8, 1)];
        if (remainder == 10) {
            validate = [lastCode sc_matchesRegex:@"^[Aa]" options:0];
        } else {
            if ([lastCode sc_matchesRegex:@"^[Aa]" options:0]) {
                validate = NO;
            } else {
                NSInteger num8 = [[self substringWithRange:NSMakeRange(8, 1)] integerValue];
                validate = (remainder == num8);
            }
        }
    }
    
    return validate;
}

@end

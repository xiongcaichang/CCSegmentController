//
//  UIColor+Extension.m
//  
//
//  Created by bear on 16/4/14.
//
//



#import "UIColor+Extension.h"
#define RGBHex(RGB) [UIColor colorWithHexString:RGB]


@implementation UIColor (Extension)
+ (instancetype)colorWithHexString: (NSString *)hex
{
    //去掉前后空格换行符
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    if ([cString length] < 6) return [UIColor whiteColor];

    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    } else if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }

    if ([cString length] != 6) return [UIColor whiteColor];

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

+ (NSArray* )colors {
    return @[
             RGBHex(@"#A0F4B2"),
             RGBHex(@"#9FF2F4"),
             RGBHex(@"#A5CAF7"),
             RGBHex(@"#A3B2F6"),
             RGBHex(@"#EEE2AA"),
             RGBHex(@"#DECC85"),
             RGBHex(@"#BEC3C7"),
             RGBHex(@"#F4C600"),
             RGBHex(@"#EA7E00"),
             RGBHex(@"#B8BC00"),
             RGBHex(@"#75C5D6"),
             RGBHex(@"#306056"),
             ];
}
@end

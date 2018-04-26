//
//  UIColor+SH_HexRGB.m
//  NewLive
//
//  Created by wangsh on 2018/1/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIColor+SH_HexRGB.h"

@implementation UIColor (SH_HexRGB)

+ (UIColor *)sh_colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

+ (UIColor *)sh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (UIColor *)sh_colorWithHexString:(NSString *)color {
    if ([color hasPrefix:@"0X"]) {
        color = [color substringFromIndex:2];
    }
    
    if ([color hasPrefix:@"#"]) {
        color = [color substringFromIndex:1];
    }
    
    if([color length] == 8) {
        NSRange range;
        range.location = 0;
        range.length = 2;
        
        NSString *aString = [color substringWithRange:range];
        unsigned int a;
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        float alpha = (float)a / 255.0f;
        color = [color substringFromIndex:2];
        return [self sh_colorWithHexString:color alpha:alpha];
    }
    
    else {
        return [self sh_colorWithHexString:color alpha:1.0f];
    }
}

+ (UIColor *)sh_colorWithFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor proportion:(CGFloat)proportion
{
    if (proportion <= 0.f) {
        return fromColor;
    }
    
    if (proportion >= 1.f) {
        return toColor;
    }
    
    CGFloat fromRed, fromGreen, fromBlue, fromAlpha, toRed, toGreen, toBlue, toAlpha;
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    
    CGFloat r = toRed*proportion + fromRed*(1-proportion);
    CGFloat g = toGreen*proportion + fromGreen*(1-proportion);
    CGFloat b = toBlue*proportion + fromBlue*(1-proportion);
    CGFloat a = toAlpha*proportion + fromAlpha*(1-proportion);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}
@end

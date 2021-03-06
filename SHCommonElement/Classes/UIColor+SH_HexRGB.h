//
//  UIColor+SH_HexRGB.h
//  NewLive
//
//  Created by wangsh on 2018/1/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SH_HexRGB)

+ (UIColor *)sh_colorFromHexRGB:(NSString *)inColorString;

+ (UIColor *)sh_colorWithHexString:(NSString *)color;

+ (UIColor *)sh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)sh_colorWithFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor proportion:(CGFloat)proportion;


/** 4.19 新增 */

+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
- (NSString *)HEXString;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;

/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)sh_colorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)sh_colorWithLightColorString:(NSString *)lightColor DarkColorString:(NSString *)darkColor;
@end

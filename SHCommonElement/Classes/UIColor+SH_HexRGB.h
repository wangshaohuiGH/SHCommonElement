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
@end

//
//  UIColor+SH_HexRGB.h
//  NewLive
//
//  Created by wangsh on 2018/1/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SH_HexRGB)

+ (UIColor *)SH_colorFromHexRGB:(NSString *)inColorString;

+ (UIColor *)SH_colorWithHexString:(NSString *)color;

+ (UIColor *)SH_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)SH_colorWithFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor proportion:(CGFloat)proportion;
@end

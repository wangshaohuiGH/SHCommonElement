//
//  UIView+Extension.h
//  Orange1314
//
//  Created by wangsh on 16/9/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SHExtension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat max_X;
@property (nonatomic, assign) CGFloat max_Y;




/**
 *  边角半径
 */
@property (nonatomic, assign) CGFloat layerCornerRadius;
/**
 *  边线宽度
 */
@property (nonatomic, assign) CGFloat layerBorderWidth;
/**
 *  边线颜色
 */
@property (nonatomic, strong) UIColor *layerBorderColor;


/**设置圆角*/
- (void)sh_setCornerRadius:(CGFloat )radius;

/**
 设置圆角
 
 @param cornerRadius 圆角半径
 @param borderWidth 切线宽度
 @param borderColor 切线颜色
 */
- (void)sh_setLayerCornerRadius:(CGFloat)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor;




/**设置圆角和边框*/
- (void)sh_setCornerRadius:(CGFloat)radius BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat )borderWidth;

/**设置任意圆角*/
- (void)sh_setRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/**设置任意圆角和边框*/
- (void)sh_setRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat )borderWidth;

@end

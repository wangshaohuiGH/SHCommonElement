//
//  UIView+SHExtension.m
//  Orange1314
//
//  Created by wangsh on 16/9/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIView+SHExtension.h"

@implementation UIView (SHExtension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setMax_X:(CGFloat)max_X {
    
}
- (CGFloat)max_X {
    return CGRectGetMaxX(self.frame);
}
- (void)setMax_Y:(CGFloat)max_Y {
    
}
- (CGFloat)max_Y {
    return CGRectGetMaxY(self.frame);
}


- (void)sh_setLayerCornerRadius:(CGFloat)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = YES;
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
    [self _config];
}

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderWidth:(CGFloat)layerBorderWidth {
    self.layer.borderWidth = layerBorderWidth;
    [self _config];
}

- (CGFloat)layerBorderWidth {
    return self.layer.borderWidth;
}

- (void)setLayerCornerRadius:(CGFloat)layerCornerRadius {
    self.layer.cornerRadius = layerCornerRadius;
    [self _config];
}

- (CGFloat)layerCornerRadius {
    return self.layer.cornerRadius;
}

- (void)_config {
    
    self.layer.masksToBounds = YES;
    // 栅格化 - 提高性能
    // 设置栅格化后，图层会被渲染成图片，并且缓存，再次使用时，不会重新渲染
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

- (void)sh_setCornerRadius:(CGFloat)radius {
    [self sh_setCornerRadius:radius BorderColor:nil BorderWidth:0];
}


- (void)sh_setCornerRadius:(CGFloat)radius BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth {
    [self sh_setRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight radius:radius borderColor:borderColor borderWidth:borderWidth];
}


- (void)sh_setRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    [self sh_setRoundingCorners:corners radius:radius borderColor:nil borderWidth:0];
}


- (void)sh_setRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    
    
    CGSize viewSize = self.frame.size;
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, viewSize.width, viewSize.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    if (borderWidth) {
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = CGRectMake(0, 0, viewSize.width, viewSize.height);
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = borderColor.CGColor;
        shapeLayer.lineWidth = borderWidth;
        shapeLayer.path = path.CGPath;
        [self.layer addSublayer:shapeLayer];
    }
    
    maskLayer.path = path.CGPath;
    [self.layer setMask:maskLayer];
}
@end

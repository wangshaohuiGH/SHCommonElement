//
//  UIImage+SHAdd.h
//  DLKJ
//
//  Created by wangsh on 2018/1/23.
//  Copyright © 2018年 wangsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SHAdd)

/**
 通过颜色获取一张宽高都为1px的图片

 @param color color
 @return image
 */
+ (UIImage *)sh_imageWithColor:(UIColor *)color;


/**
 通过颜色获取一张规定尺寸的图片

 @param color color
 @param size size
 @return image
 */
+ (UIImage *)sh_imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 将图片裁剪成一张圆形图片

 @param borderWidth  description
 @param borderColor  description
 @return image
 */
- (UIImage *)sh_clipCircleImageWithBorder:(CGFloat)borderWidth withColor:(UIColor *)borderColor;

/**
 将图片压缩到指定宽度

 @param width 宽
 @return image
 */
- (UIImage *)sh_compressWithWidth:(CGFloat)width;



/**
 将图片在子线程中压缩，block在主线层回调，保证压缩到指定文件大小，尽量减少失真

 @param length length
 @param block block
 */
- (void)sh_compressToDataLength:(NSInteger)length withBlock:(void(^)(NSData *data))block;


/**
 尽量将图片压缩到指定大小，不一定满足条件

 @param length length
 @param block block
 */
- (void)sh_tryCompressToDataLength:(NSInteger)length withBlock:(void(^)(NSData *data))block;


/**
 快速将图片压缩到指定大小，失真严重

 @param length length
 @param block block
 */
- (void)sh_fastCompressToDataLength:(NSInteger)length withBlock:(void(^)(NSData *data))block;


/**
 通过修改r.g.b像素点来处理图片

 @param Fliterblock Fliterblock 
 @param success success
 */
- (void)sh_fliterImageWithFliterBlock:(void(^)(int *red, int *green, int *blue))Fliterblock success:(void(^)(UIImage *image))success;
/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 *
 *  @return 生成的高清的UIImage
 */
+ (UIImage *)sh_creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size;

/**
 生成二维码

 @param string 字符串
 @param imagesize 二维码size
 @return 二维码
 */
+ (UIImage *)sh_QRCodeImageForString:(NSString *)string ImageSize:(CGFloat)imagesize;


/**
 二维码 + logo

 @param string 字符串
 @param imagesize 二维码size
 @param logoImage logoImage
 @param logoSize logoSize
 @return 二维码
 */
+ (UIImage *)sh_QRCodeImageForString:(NSString *)string ImageSize:(CGFloat)imagesize LogoImage:(UIImage *)logoImage LogoSize:(CGFloat)logoSize;

/**
 动态更换tabbar icon
 
 @param imageUrl imageUrl
 @return image
 */
+ (UIImage *)tabBarItemImageUrl:(NSString *)imageUrl;
@end

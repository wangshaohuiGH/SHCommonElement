//
//  UIImage+SHAdd.h
//  DLKJ
//
//  Created by wangsh on 2018/1/23.
//  Copyright © 2018年 wangsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SHAdd)

#pragma mark - Create image
///=============================================================================
/// @name Create image
///=============================================================================

/**
 Create an animated image with GIF data. After created, you can access
 the images via property '.images'. If the data is not animated gif, this
 function is same as [UIImage imageWithData:data scale:scale];
 
 @discussion     It has a better display performance, but costs more memory
 (width * height * frames Bytes). It only suited to display small
 gif such as animated emoticon. If you want to display large gif,
 see `YYImage`.
 
 @param data     GIF data.
 
 @param scale    The scale factor
 
 @return A new image created from GIF, or nil when an error occurs.
 */
+ (nullable UIImage *)imageWithSmallGIFData:(NSData *_Nullable)data scale:(CGFloat)scale;

/**
 Whether the data is animated GIF.
 
 @param data Image data
 
 @return Returns YES only if the data is gif and contains more than one frame,
 otherwise returns NO.
 */
+ (BOOL)isAnimatedGIFData:(NSData *_Nullable)data;

/**
 Whether the file in the specified path is GIF.
 
 @param path An absolute file path.
 
 @return Returns YES if the file is gif, otherwise returns NO.
 */
+ (BOOL)isAnimatedGIFFile:(NSString *_Nullable)path;

/**
 Create an image from a PDF file data or path.
 
 @discussion If the PDF has multiple page, is just return's the first page's
 content. Image's scale is equal to current screen's scale, size is same as
 PDF's origin size.
 
 @param dataOrPath PDF data in `NSData`, or PDF file path in `NSString`.
 
 @return A new image create from PDF, or nil when an error occurs.
 */
+ (nullable UIImage *)imageWithPDF:(id _Nullable)dataOrPath;

/**
 Create an image from a PDF file data or path.
 
 @discussion If the PDF has multiple page, is just return's the first page's
 content. Image's scale is equal to current screen's scale.
 
 @param dataOrPath  PDF data in `NSData`, or PDF file path in `NSString`.
 
 @param size     The new image's size, PDF's content will be stretched as needed.
 
 @return A new image create from PDF, or nil when an error occurs.
 */
+ (nullable UIImage *)imageWithPDF:(id _Nullable )dataOrPath size:(CGSize)size;

/**
 Create a square image from apple emoji.
 
 @discussion It creates a square image from apple emoji, image's scale is equal
 to current screen's scale. The original emoji image in `AppleColorEmoji` font
 is in size 160*160 px.
 
 @param emoji single emoji, such as @"😄".
 
 @param size  image's size.
 
 @return Image from emoji, or nil when an error occurs.
 */
+ (nullable UIImage *)imageWithEmoji:(NSString *_Nullable)emoji size:(CGFloat)size;

/**
 Create and return a 1x1 point size image with the given color.
 
 @param color  The color.
 */
+ (nullable UIImage *)imageWithColor:(UIColor *_Nonnull)color;

/**
 Create and return a pure color image with the given color and size.
 
 @param color  The color.
 @param size   New image's type.
 */
+ (nullable UIImage *)imageWithColor:(UIColor *_Nullable)color size:(CGSize)size;

/**
 Create and return an image with custom draw code.
 
 @param size      The image size.
 @param drawBlock The draw block.
 
 @return The new image.
 */
+ (nullable UIImage *)imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock;

/**
 通过颜色获取一张宽高都为1px的图片

 @param color color
 @return image
 */
+ (UIImage *_Nullable)sh_imageWithColor:(UIColor *_Nullable)color;


/**
 通过颜色获取一张规定尺寸的图片

 @param color color
 @param size size
 @return image
 */
+ (UIImage *_Nullable)sh_imageWithColor:(UIColor *_Nullable)color size:(CGSize)size;


/**
 将图片裁剪成一张圆形图片

 @param borderWidth  description
 @param borderColor  description
 @return image
 */
- (UIImage *_Nullable)sh_clipCircleImageWithBorder:(CGFloat)borderWidth withColor:(UIColor *_Nullable)borderColor;

/**
 将图片压缩到指定宽度

 @param width 宽
 @return image
 */
- (UIImage *_Nullable)sh_compressWithWidth:(CGFloat)width;



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
+ (UIImage *_Nullable)sh_creatNonInterpolatedUIImageFormCIImage:(CIImage *_Nullable)image withSize:(CGFloat)size;

/**
 生成二维码

 @param string 字符串
 @param imagesize 二维码size
 @return 二维码
 */
+ (UIImage *_Nullable)sh_QRCodeImageForString:(NSString *_Nullable)string ImageSize:(CGFloat)imagesize;


/**
 二维码 + logo

 @param string 字符串
 @param imagesize 二维码size
 @param logoImage logoImage
 @param logoSize logoSize
 @return 二维码
 */
+ (UIImage *_Nullable)sh_QRCodeImageForString:(NSString *_Nullable)string ImageSize:(CGFloat)imagesize LogoImage:(UIImage *_Nullable)logoImage LogoSize:(CGFloat)logoSize;


/**
 动态更换tabbar icon
 
 @param imageUrl imageUrl
 @return image
 */
+ (UIImage *_Nullable)tabBarItemImageUrl:(NSString *_Nullable)imageUrl;
@end

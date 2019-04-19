//
//  UIFont+Addition.h
//  DLKJ
//
//  Created by wangsh on 2018/11/27.
//  Copyright © 2018年 李宇廷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Addition)

/** 默认字体 PingFangSC-Regular */
+ (UIFont *)dl_fontWithSize:(CGFloat )size;
/**  PingFangSC-Semibold */
+ (UIFont *)dl_boldFontWithSize:(CGFloat )size;
/**  PingFangSC-Medium */
+ (UIFont *)dl_mediumFontWithSize:(CGFloat )size;
/**  PingFangSC-Semibold */
+ (UIFont *)dl_semiboldFontWithSize:(CGFloat )size;

/**
 设置字体

 @param name 字体名字
 @param size 字体大小
 @return font
 */
+ (UIFont *)dl_mainFontWithName:(NSString *)name Size:(CGFloat )size;
@end

NS_ASSUME_NONNULL_END


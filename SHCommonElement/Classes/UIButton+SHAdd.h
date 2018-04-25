//
//  UIButton+SHAdd.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, SHButtonEdgeInsetsStyle) {
    SHButtonEdgeInsetsStyleTop, // image在上，label在下
    SHButtonEdgeInsetsStyleLeft, // image在左，label在右
    SHButtonEdgeInsetsStyleBottom, // image在下，label在上
    SHButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (SHAdd)


/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(SHButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

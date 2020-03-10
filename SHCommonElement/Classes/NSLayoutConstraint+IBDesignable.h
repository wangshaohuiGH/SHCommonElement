//
//  NSLayoutConstraint+IBDesignable.h
//  JustMeal
//
//  Created by wangsh on 2019/11/15.
//  Copyright © 2019 TongMing. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (IBDesignable)

@property (nonatomic,assign)IBInspectable BOOL fitScreenW;

@property (nonatomic,assign)IBInspectable BOOL fitScreenH;



@end

NS_ASSUME_NONNULL_END

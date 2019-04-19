//
//  UIViewController+RemoveAlartView.h
//  SimpleShop
//
//  Created by wangsh on 2019/4/10.
//  Copyright © 2019 神廷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (RemoveAlartView)


/**
 更换APP图标 age:TempIcon
 
 设置为原主图标 设置为 nil 或者 @""

 @param iconName name
 */
- (void)changeAppIconWithName:(NSString *)iconName;
@end

NS_ASSUME_NONNULL_END

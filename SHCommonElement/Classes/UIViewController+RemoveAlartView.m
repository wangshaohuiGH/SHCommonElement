//
//  UIViewController+RemoveAlartView.m
//  SimpleShop
//
//  Created by wangsh on 2019/4/10.
//  Copyright © 2019 神廷. All rights reserved.
//

#import "UIViewController+RemoveAlartView.h"
#import <objc/runtime.h>
@implementation UIViewController (RemoveAlartView)

#warning make  ------   运行时  移除在更换APP图标时候的系统提示框


+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(dl_presentViewController:animated:completion:));

        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}
- (void)dl_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {

    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {

        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil && alertController.preferredStyle == UIAlertControllerStyleAlert) {
            return;
        }
    }

    [self dl_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)changeAppIconWithName:(NSString *)iconName {
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}
@end

//
//  UIViewController+ChangeAppIcon.m
//  SimpleShop
//
//  Created by wangsh on 2019/4/10.
//  Copyright © 2019 神廷. All rights reserved.
//

#import "UIViewController+ChangeAppIcon.h"
#import <objc/runtime.h>
@implementation UIViewController (ChangeAppIcon)

#warning make  ------   运行时  移除在更换APP图标时候的系统提示框


+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(sh_presentViewController:animated:completion:));

        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}
- (void)sh_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {

    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {

        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil && alertController.preferredStyle == UIAlertControllerStyleAlert) {
            return;
        }
    }

    [self sh_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)changeAppIconWithName:(NSString *)iconName {
    if (@available(iOS 10.3, *)) {
        if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
            return;
        }
    } else {
        // Fallback on earlier versions
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    if (@available(iOS 10.3, *)) {
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换app图标发生错误了 ： %@",error);
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}
@end

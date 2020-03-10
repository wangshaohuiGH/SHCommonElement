//
//  NSLayoutConstraint+IBDesignable.m
//  JustMeal
//
//  Created by wangsh on 2019/11/15.
//  Copyright © 2019 TongMing. All rights reserved.
//

#import "NSLayoutConstraint+IBDesignable.h"
#import <objc/runtime.h>

#define kRefereWidth 375.0
#define kRefereHeigth 667.0

#define AdaptW(floatValue) (floatValue*[[UIScreen mainScreen]bounds].size.width/kRefereWidth)

#define AdaptH(floatValue) (floatValue*[[UIScreen mainScreen]bounds].size.height/kRefereHeigth)



@implementation NSLayoutConstraint (IBDesignable)

static char *AdapterScreenW = "AdapterScreenW";

static char *AdapterScreenH = "AdapterScreenH";


- (BOOL)fitScreenW {
    NSNumber *number = objc_getAssociatedObject(self, AdapterScreenW);
    return number.boolValue;
}
- (void)setFitScreenW:(BOOL)fitScreenW {
    NSNumber *number = @(fitScreenW);
    objc_setAssociatedObject(self, AdapterScreenW, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (fitScreenW) {
        self.constant = AdaptW(self.constant);
    }
}


- (BOOL)fitScreenH {
    NSNumber *number = objc_getAssociatedObject(self, AdapterScreenH);
    return number.boolValue;
}

- (void)setFitScreenH:(BOOL)fitScreenH {
    NSNumber *number = @(fitScreenH);
    objc_setAssociatedObject(self, AdapterScreenH, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (fitScreenH) {
        self.constant = AdaptH(self.constant);
    }
}

@end

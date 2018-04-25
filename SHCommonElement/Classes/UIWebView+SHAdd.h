//
//  UIWebView+SHAdd.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHWebViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIWebView (SHAdd)<SHWebViewProtocol>
/**
 *  setting UIWebViewDelegate to a class
 *
 */
- (void) setDelegateViews: (id <UIWebViewDelegate>) delegateView;

@end

NS_ASSUME_NONNULL_END

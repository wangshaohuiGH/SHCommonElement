//
//  WKWebView+SHAdd.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <WebKit/WebKit.h>

#import "SHWebViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (SHAdd) <SHWebViewProtocol>

/**
 *  setting WKUIDelegate and WKNavigationDelegate to the same class
 *
 */
- (void) setDelegateViews: (id <WKNavigationDelegate, WKUIDelegate>) delegateView;

@end

NS_ASSUME_NONNULL_END

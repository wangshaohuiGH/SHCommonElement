//
//  UIWebView+SHAdd.m
//  LotteryPlay
//
//  Created by wangsh on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "UIWebView+SHAdd.h"

@implementation UIWebView (SHAdd)

- (void) setDelegateViews: (id <UIWebViewDelegate>) delegateView
{
    [self setDelegate: delegateView];
}


- (void) loadRequestFromString: (NSString *) urlNameAsString
{
    [self loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString: urlNameAsString]]];
}


- (void) evaluateJavaScript: (NSString *) javaScriptString completionHandler: (void (^)(id, NSError *)) completionHandler
{
    NSString *string = [self stringByEvaluatingJavaScriptFromString: javaScriptString];
    
    if (completionHandler) {
        completionHandler(string, nil);
    }
}

- (void) setScalesPagesToFit: (BOOL) setPages
{
    self.scalesPageToFit = setPages;
}

- (BOOL)canGoToBack
{
    return [self canGoBack];
}

- (void)goToBack
{
    [self goBack];
}

- (BOOL)canGoToForward
{
    return [self canGoForward];
}
- (void)goToForward
{
    [self goForward];
}
@end

//
//  SHWebViewProtocol.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SHWebViewProtocol <NSObject>

@property (nonatomic, strong) NSURLRequest *request;

/*
 *  设置webview的代理.
 */
- (void) setDelegateViews: (id) delegateView;

/*
 * Load an NSURLRequest in the active webview.
 */
- (void) loadRequest: (NSURLRequest *) request;

/*
 * Convenience method to load a request from a string.
 */
- (void) loadRequestFromString: (NSString *) urlNameAsString;

- (BOOL) canGoToBack;
- (void) goToBack;

- (BOOL) canGoToForward;
- (void) goToForward;

- (void) evaluateJavaScript: (NSString *) javaScriptString completionHandler: (void (^)(id, NSError *)) completionHandler;

@end

//
//  NSNumber+SHAdd.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/9.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (SHAdd)
#pragma mark - NumberWithString
///=============================================================================
/// @name numberWithString
///=============================================================================

/**
 * 字符串转换为 NSNumber，转换失败返回nil
 */
+ (nullable NSNumber *)numberWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

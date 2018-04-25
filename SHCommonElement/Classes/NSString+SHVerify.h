//
//  NSString+SHVerify.h
//  BrightProject
//
//  Created by wangsh on 2017/10/19.
//  Copyright © 2017年 yinsenlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHVerify)

#pragma mark --------------字符串是否为空

/**
 *  字符串是否为空
 *
 *  @param string  输入内容
 *
 *  @return YES Or NO
 */
+(BOOL)isBlankString:(NSString *)string;

#pragma mark --------------MD5加密

/**
 *  MD5加密
 *
 *  @return 加密字符串
 */
- (NSString *)MD5;

#pragma mark --------------邮箱判断

/**
 *  邮箱判断
 *
 *  @return YES or NO
 */
- (BOOL)isValidateEmail;

#pragma mark -------------- 网址判断

/**
 *  网址判断
 *
 *  @return YES or NO
 */
- (BOOL)isValidateUrl;

#pragma mark --------------数字和字母

/**
 *  数字和字母
 *
 *  @return YES or NO
 */
- (BOOL)isValidateNumAndAz;

#pragma mark --------------手机号码合法性判断

/**
 *  手机号码合法性判断
 *
 *  @return YES or NO
 */
-(BOOL)isValidateMobile;

#pragma mark --------------密码数字字母验证

/**
 *  密码数字字母验证
 *
 *  @return YES or NO
 */
-(BOOL)isValidatePassword;

#pragma mark --------------是否为6位数字
/**
 *  是否为6位数字
 *
 *  @return YES or NO
 */
-(BOOL)isValidatePhoneCode;

#pragma mark --------------认证使用

- (NSString *)Base64EncodedStringFromString:(NSString *)string;

#pragma mark --------------身份证合法性判断最终版

/**
 *  身份证合法性判断最终版;
 *
 *  @return YES or NO
 */
+ (BOOL)isValidateTruePeopleIDCode:(NSString *)identityCard;

#pragma mark --------------是否有中文

/**
 *  是否有中文
 *
 *  @return YES or NO
 */
- (BOOL)isValidateChinese;

#pragma mark --------------字符串内容是否是有效数字

/**
 *  『正则表达式；推荐使用，不用循环遍历，控制更灵活』判断字符串内容是否是有效数字
 *
 *  @return 字符串内容是否是有效数字
 */
- (BOOL)isValidateNumberByRegExp;

@end

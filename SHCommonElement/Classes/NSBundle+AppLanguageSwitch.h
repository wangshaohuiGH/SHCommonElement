//
//  NSBundle+AppLanguageSwitch.h
//  https://github.com/zengqingf/iOSAppLanguageSwitch
//
//  Created by zengqingfu on 2017/6/13.
//  Copyright © 2017年 zengqingfu. All rights reserved.
//

#import <Foundation/Foundation.h>
//语言改变通知
FOUNDATION_EXPORT NSString * const DLAppLanguageChangeNotification;

typedef NS_ENUM(NSUInteger,Language){
    Language_system = 0,  //跟随系统
    Language_zh_Hans,  //中文
    Language_en,       //英文
    Language_ko,       //韩文
};

@interface NSBundle (AppLanguageSwitch)

/**
 设置语言

 @param language 参数为语言包的前缀，比如Base.lproj 传入Base、
 中文语言包zh-Hans.lproj传入zh-Hans，前提是工程中已经提前加入了语言包
 */
+ (void)setCusLanguage:(Language)language;


/**
 获取当前的自定义语言，如果使用的是跟随系统语言出参为nil

 @return 语言类型
 */
+ (Language)getCusLanguage;


/**
 恢复成跟随系统语言
 */
+ (void)restoreSysLanguage;
@end

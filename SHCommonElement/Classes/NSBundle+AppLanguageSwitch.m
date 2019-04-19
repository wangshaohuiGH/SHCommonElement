//
//  NSBundle+AppLanguageSwitch.m
//  https://github.com/zengqingf/iOSAppLanguageSwitch
//
//  Created by zengqingfu on 2017/6/13.
//  Copyright © 2017年 zengqingfu. All rights reserved.
//

#import "NSBundle+AppLanguageSwitch.h"
#import <objc/runtime.h>


NSString * const DLAppLanguageChangeNotification = @"cc.devfu.languagedidchange";

static const char kBundleKey = 0;
@interface ZZBundleEx : NSBundle

@end

@implementation ZZBundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSBundle *bundle = objc_getAssociatedObject(self, &kBundleKey);
    if (bundle) {
        return [bundle localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}
@end


static NSString *AppLanguageSwitchKey = @"App_Language_Switch_Key";
@implementation NSBundle (AppLanguageSwitch)
+ (void)setCusLanguage:(Language)language {
    id value = nil;
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSString  *languageString = [self getStringWithLanguage:language];
    if (languageString) {
        value = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:languageString ofType:@"lproj"]];
        NSAssert(value != nil, @"value不能为空,请检查参数是否正确");
        [df setObject:@(language) forKey:AppLanguageSwitchKey];
        [df synchronize];
    } else {
        [df removeObjectForKey:AppLanguageSwitchKey];
        [df synchronize];
    }
    objc_setAssociatedObject([NSBundle mainBundle], &kBundleKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [[NSNotificationCenter defaultCenter] postNotificationName:DLAppLanguageChangeNotification object:nil];
}

+ (Language)getCusLanguage {
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    NSNumber *language = [df objectForKey:AppLanguageSwitchKey];
    return [language integerValue];
}

+ (void)restoreSysLanguage {
    [self setCusLanguage:0];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle],[ZZBundleEx class]);
        [self setCusLanguage:[self getCusLanguage]];
    });
}
+ (NSString*)getStringWithLanguage:(Language)language{
    switch (language) {
        case Language_zh_Hans:
            return @"zh-Hans";
            break;
        case  Language_en:
            return @"en";
        case  Language_ko:
            return @"ko";
        default:
            return nil;
            break;
    }
}
@end

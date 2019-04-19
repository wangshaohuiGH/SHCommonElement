//
//  UIFont+Addition.m
//  DLKJ
//
//  Created by wangsh on 2018/11/27.
//  Copyright © 2018年 李宇廷. All rights reserved.
//

#import "UIFont+Addition.h"

@implementation UIFont (Addition)


+ (UIFont *)dl_fontWithSize:(CGFloat)size {
    
   
    return [self dl_mainFontWithName:[self dl_mainFontName] Size:size];
    
}
+ (UIFont *)dl_boldFontWithSize:(CGFloat )size {
    
    return [self dl_mainFontWithName:[self dl_mainBoldFontName] Size:size];
}
+ (UIFont *)dl_mediumFontWithSize:(CGFloat )size {
    
    return [self dl_mainFontWithName:[self dl_mainMediumFontName] Size:size];
}

+ (UIFont *)dl_semiboldFontWithSize:(CGFloat )size {
    
    return [self dl_mainFontWithName:[self dl_mainSemiboldFontName] Size:size];
}

+ (UIFont *)dl_mainFontWithName:(NSString *)name Size:(CGFloat )size {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    if (w == 414) {
        size = size + 1;
    }else if (w == 320) {
        size = size - 1;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        UIFont *font = [UIFont fontWithName:name size:size];
        if (!font) {
            if ([name isEqualToString:[self dl_mainBoldFontName]]) {
                font = [UIFont boldSystemFontOfSize:size];
            }else {
                font =[UIFont systemFontOfSize:size];
            }
        }
        return font;
    }else {
        if ([name isEqualToString:[self dl_mainBoldFontName]]) {
            return [UIFont boldSystemFontOfSize:size];
        }else {
            return [UIFont systemFontOfSize:size];
        }
        
    }
}

+ (NSString *)dl_mainFontName {
    return @"PingFangSC-Regular";
}
+ (NSString *)dl_mainBoldFontName {
    return @"PingFang-SC-Semibold";
}
+ (NSString *)dl_mainMediumFontName {
    return @"PingFang-SC-Medium";
}
+ (NSString *)dl_mainSemiboldFontName {
    return @"PingFang-SC-Semibold";
}
+ (void)allFontFamily {
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }

}
@end

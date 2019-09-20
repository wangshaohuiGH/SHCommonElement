//
//  UIFont+SHAdd.m
//  DLKJ
//
//  Created by wangsh on 2018/11/27.
//  Copyright © 2018年 李宇廷. All rights reserved.
//

#import "UIFont+SHAdd.h"

@implementation UIFont (SHAdd)


+ (UIFont *)sh_fontWithSize:(CGFloat)size {
    
   
    return [self sh_mainFontWithName:[self sh_mainFontName] Size:size];
    
}
+ (UIFont *)sh_boldFontWithSize:(CGFloat )size {
    
    return [self sh_mainFontWithName:[self sh_mainBoldFontName] Size:size];
}
+ (UIFont *)sh_mediumFontWithSize:(CGFloat )size {
    
    return [self sh_mainFontWithName:[self sh_mainMediumFontName] Size:size];
}

+ (UIFont *)sh_semiboldFontWithSize:(CGFloat )size {
    
    return [self sh_mainFontWithName:[self sh_mainSemiboldFontName] Size:size];
}

+ (UIFont *)sh_mainFontWithName:(NSString *)name Size:(CGFloat )size {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    if (w == 414) {
        size = size + 1;
    }else if (w == 320) {
        size = size - 1;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        UIFont *font = [UIFont fontWithName:name size:size];
        if (!font) {
            if ([name isEqualToString:[self sh_mainBoldFontName]]) {
                font = [UIFont boldSystemFontOfSize:size];
            }else {
                font =[UIFont systemFontOfSize:size];
            }
        }
        return font;
    }else {
        if ([name isEqualToString:[self sh_mainBoldFontName]]) {
            return [UIFont boldSystemFontOfSize:size];
        }else {
            return [UIFont systemFontOfSize:size];
        }
        
    }
}

+ (NSString *)sh_mainFontName {
    return @"PingFangSC-Regular";
}
+ (NSString *)sh_mainBoldFontName {
    return @"PingFang-SC-Bold";
}
+ (NSString *)sh_mainMediumFontName {
    return @"PingFang-SC-Medium";
}
+ (NSString *)sh_mainSemiboldFontName {
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

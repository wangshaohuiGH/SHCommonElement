//
//  CommonUtils.h
//  LotteryPlay
//
//  Created by wangsh on 2018/4/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef CommonUtils_h
#define CommonUtils_h


//色值
#define SH_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define SH_RGB(r,g,b) RGBA(r,g,b,1.0f)

#define SH_HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

/** 弱引用 */
#define SH_WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/** 返回主线程 */
#define sh_dispatch_main_async_safe(block)                                                                            \
if ([NSThread isMainThread]) {                                                                                     \
    block();                                                                                                       \
} else {                                                                                                           \
    dispatch_async(dispatch_get_main_queue(), block);                                                              \
}

#define SH_Window [[UIApplication sharedApplication].delegate window]

/** 屏幕宽度 */
#define SH_ScreenW [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define SH_ScreenH [UIScreen mainScreen].bounds.size.height

// 判断设备型号

#define SH_iPhoneSE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 568), [UIScreen mainScreen].bounds.size) : NO)

#define SH_iPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 667), [UIScreen mainScreen].bounds.size) : NO)

#define SH_iPhone8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414, 736), [UIScreen mainScreen].bounds.size) : NO)

#define SH_iPhoneX_S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 812), [UIScreen mainScreen].bounds.size) : NO)

#define SH_iPhoneXR_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414, 896), [UIScreen mainScreen].bounds.size) : NO)

#define SH_IPad [[UIDevice currentDevice].model containsString:@"iPad"]

/** iphoneX及以后的手机  */
#define SH_iPhoneX (UIScreen.mainScreen.bounds.size.width >= 375.f && UIScreen.mainScreen.bounds.size.height >= 812.f)

/** 逐一设备适配 */
#define SH_FitiPhone_SE_8_8P_X_M_O(x,y,n,m,k,j)   (iPhoneXR_Max ? k : (iPhoneX_S ? m : (iPhone8P ? n : (iPhone8 ? y : (iPhoneSE ? x : j)))))

/** 根据iPhone8进行比例缩放 */
#define SH_FitScaleW(width) (width*SH_ScreenW/375)

#define SH_TempH (SH_iPhoneX ? SH_ScreenH-44-34:SH_ScreenH)

#define SH_FitScaleH(height) (height*SH_TempH/667)

///适配暗黑模式   lightColor：白天模式颜色  darkColor：暗黑模式颜色
#define SH_CustomAdjustColor(lightColor, darkColor) [UIColor sh_colorWithLightColor:lightColor DarkColor:darkColor]

/** 状态栏高度 */
#define SH_StatusBarH CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)


#define SH_NavigationHeight (SH_StatusBarH + 44)


#define SH_BottomSafeH SH_iPhoneX ? 34:0
/*TabBar高度*/
#define SH_TabBarHeight (CGFloat)(SH_iPhoneX?(49.0 + 34.0):(49.0))

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

#endif /* CommonUtils_h */

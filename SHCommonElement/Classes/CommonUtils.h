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

#define kWindow [[UIApplication sharedApplication].delegate window]

/** 屏幕宽度 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define kScreenH [UIScreen mainScreen].bounds.size.height

// 判断设备型号

#define iPhoneSE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 568), [UIScreen mainScreen].bounds.size) : NO)

#define iPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 667), [UIScreen mainScreen].bounds.size) : NO)

#define iPhone8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414, 736), [UIScreen mainScreen].bounds.size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 812), [UIScreen mainScreen].bounds.size) : NO)


/** 逐一设备适配 */
#define kFitiPhone_SE_8_8P_X_O(x,y,n,m,k)   (iPhoneX ? m : (iPhone8P ? n : (iPhone8 ? y : (iPhoneSE ? x : k))))

/** 根据iPhone8进行比例缩放 */
#define kFitScaleW(width) (width*kScreenW/375)

#define kFitScaleH(height) (height*kScreenH/667)

/** 状态栏高度 */
#define kStatusBarH CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)


#define kNavigationHeight (kStatusBarH + 44)

#endif /* CommonUtils_h */

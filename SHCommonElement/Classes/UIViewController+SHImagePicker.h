//
//  UIViewController+SHImagePicker.h
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/10/12.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SHImagePickerCompleted)(NSDictionary * _Nonnull info);

@interface UIViewController (SHImagePicker)

/**
 调起相册或者相机
 
 @param completed 完成回调
 */
- (void)sh_photoLibraryOrCameraWithAllowsEditing:(BOOL)allowsEditing completed:(SHImagePickerCompleted)completed;

/**
 调起相册
 
 @param completed 完成回调
 */
- (void)sh_photoLibraryWithAllowsEditing:(BOOL)allowsEditing completed:(SHImagePickerCompleted)completed;


/**
 调起相机
 
 @param completed 完成回调
 */
- (void)sh_cameraWithAllowsEditing:(BOOL)allowsEditing completed:(SHImagePickerCompleted)completed;



/// 获取当前控制器
- (UIViewController *)getCurrentViewController;

@end

NS_ASSUME_NONNULL_END

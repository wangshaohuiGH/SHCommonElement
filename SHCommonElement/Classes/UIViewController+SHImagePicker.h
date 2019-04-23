//
//  UIViewController+SHImagePicker.h
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/4/23.
//

#import <UIKit/UIKit.h>

typedef void (^SHImagePickerCompleted)(NSDictionary * _Nonnull info);

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END

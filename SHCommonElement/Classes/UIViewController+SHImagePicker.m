//
//  UIViewController+SHImagePicker.m
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/4/23.
//

#import "UIViewController+SHImagePicker.h"
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>
#import "UIView+SH_Toast.h"
@interface SHImagePickerDelegate : NSObject <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, copy) SHImagePickerCompleted pickCompleted;
@property (nonatomic, assign) BOOL allowsEditing;

@end

@implementation SHImagePickerDelegate

#pragma mark - Public Methods

/**调起相册*/
- (void)showPhotoLibrary
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing = self.allowsEditing;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.viewController presentViewController:imagePickerController animated:YES completion:nil];
    }];
}

/**调起相机*/
- (void)showCamera
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.allowsEditing = self.allowsEditing;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.viewController presentViewController:imagePickerController animated:YES completion:nil];
    }];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 取消
    if(buttonIndex == actionSheet.cancelButtonIndex) {
        self.pickCompleted = nil;
        return;
    }
    // 选择相册
    if(buttonIndex == 0) {
        [self showPhotoLibrary];
    }
    // 选择拍照
    else if(buttonIndex == 1) {
        [self showCamera];
    }
}

#pragma mark - ImagePicker Controller Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
        if (image) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        }
    }
    
    if (self.pickCompleted) {
        self.pickCompleted(info);
        self.pickCompleted = nil;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if (self.pickCompleted) {
        self.pickCompleted(nil);
        self.pickCompleted = nil;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end

typedef void (^_SHPickCompleted)(UIImage *img, NSData *data);

@interface UIViewController ()

@property (nonatomic, strong) SHImagePickerDelegate *sh_imagePickerDelegate;

@end

@implementation UIViewController (SHImagePicker)

- (SHImagePickerDelegate *)sh_imagePickerDelegate
{
    SHImagePickerDelegate *imagePickerDelegate = objc_getAssociatedObject(self, _cmd);
    if (imagePickerDelegate == nil) {
        imagePickerDelegate = [[SHImagePickerDelegate alloc] init];
        imagePickerDelegate.viewController = self;
        objc_setAssociatedObject(self, @selector(sh_imagePickerDelegate), imagePickerDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return imagePickerDelegate;
}

- (void)sh_photoLibraryOrCameraWithAllowsEditing:(BOOL)allowsEditing completed:(SHImagePickerCompleted)completed
{
    self.sh_imagePickerDelegate.pickCompleted = completed;
    self.sh_imagePickerDelegate.allowsEditing = allowsEditing;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self.sh_imagePickerDelegate cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"手机相册获取", @"打开照相机", nil];
        [sheet showInView:self.view];
    }
    else {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self.sh_imagePickerDelegate cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"手机相册获取", nil];
        [sheet showInView:self.view];
    }
}

- (void)sh_photoLibraryWithAllowsEditing:(BOOL)allowsEditing completed:(SHImagePickerCompleted)completed
{
    self.sh_imagePickerDelegate.pickCompleted = completed;
    self.sh_imagePickerDelegate.allowsEditing = allowsEditing;
    [self.sh_imagePickerDelegate showPhotoLibrary];
}

- (void)sh_cameraWithAllowsEditing:(BOOL)allowsEditing completed:(SHImagePickerCompleted)completed
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            [self.view makeToast:@"您未授权相机功能，请到设置中启用"];
        } else {
            self.sh_imagePickerDelegate.pickCompleted = completed;
            self.sh_imagePickerDelegate.allowsEditing = allowsEditing;
            [self.sh_imagePickerDelegate showCamera];
        }
    }
    else {
        [self.view makeToast:@"您的设备不支持相机功能"];
    }
}

@end

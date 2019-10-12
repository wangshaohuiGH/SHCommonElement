//
//  UIViewController+SHImagePicker.m
//  Pods-SHCommonElement_Example
//
//  Created by wangsh on 2019/10/12.
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
- (void)showPhotoLibrary {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing = self.allowsEditing;
    imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
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
    imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
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
    if(buttonIndex == 1) {
        [self showPhotoLibrary];
        
    }
    // 选择拍照
    else if(buttonIndex == 0) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
            if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
                //[KDLWINDOW makeToast:@"您未授权相机功能，请到设置中启用"];
                NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
                NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
                UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"未获得授权使用相机" message:[NSString stringWithFormat:@"请在iPhone的“设置”-“隐私”-“相机”功能中，找到“%@”打开相机访问权限",app_Name] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
                UIAlertAction *action2= [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    NSURL *qxUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    
                    if([[UIApplication sharedApplication] canOpenURL:qxUrl]) { //跳转到本应用APP的权限界面
                        
                        NSURL*url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                        [[UIApplication sharedApplication] openURL:url];
                        
                    }
                }];
                [alertControl addAction:action1];
                [alertControl addAction:action2];
                [self.viewController presentViewController:alertControl animated:YES completion:nil];
                
            } else {
                [self showCamera];
            }
        }else {
            [self.viewController.view makeToast:@"您的设备不支持拍照功能"];
        }
        
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
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self.sh_imagePickerDelegate cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"从相册选择", nil];
    [sheet showInView:self.view];
    //    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    //        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self.sh_imagePickerDelegate cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"从相册选择", nil];
    //        [sheet showInView:self.view];
    //    }
    //    else {
    //        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self.sh_imagePickerDelegate cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册选择", nil];
    //
    //        [sheet showInView:self.view];
    //    }
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
            NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
            NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
            UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"未获得授权使用相机" message:[NSString stringWithFormat:@"请在iPhone的“设置”-“隐私”-“相机”功能中，找到“%@”打开相机访问权限",app_Name] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            UIAlertAction *action2= [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                NSURL *qxUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                
                if([[UIApplication sharedApplication] canOpenURL:qxUrl]) { //跳转到本应用APP的权限界面
                    
                    NSURL*url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    [[UIApplication sharedApplication] openURL:url];
                    
                }
            }];
            [alertControl addAction:action1];
            [alertControl addAction:action2];
            [self presentViewController:alertControl animated:YES completion:nil];
        } else {
            self.sh_imagePickerDelegate.pickCompleted = completed;
            self.sh_imagePickerDelegate.allowsEditing = allowsEditing;
            [self.sh_imagePickerDelegate showCamera];
        }
    }
    else {
        [self.view makeToast:@"您的设备不支持拍照功能"];
    }
}


- (UIViewController *)getCurrentViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    NSLog(@"当前控制器为:%@",currentVC);
    return currentVC;
}


- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    //NSLog(@"%@",rootVC);
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [self getCurrentVCFrom:rootVC.presentedViewController];
        //NSLog(@"%@",rootVC);
        
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        //NSLog(@"%@",currentVC);
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        //NSLog(@"%@",currentVC);
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
        //NSLog(@"%@",currentVC);
        
    }
    return currentVC;
}

// 可能不准确 先放这了
+ (UIViewController *)getCurrentViewController {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    //NSLog(@"%@",result);
    return result;
}
@end


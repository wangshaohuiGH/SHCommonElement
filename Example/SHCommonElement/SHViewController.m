//
//  SHViewController.m
//  SHCommonElement
//
//  Created by wangsh on 04/25/2018.
//  Copyright (c) 2018 wangsh. All rights reserved.
//

#import "SHViewController.h"
#import "CommonElement.h"

@interface SHViewController ()

@end

@implementation SHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"当前设备屏幕宽高：%@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

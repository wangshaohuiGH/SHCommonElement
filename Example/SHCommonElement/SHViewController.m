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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor orangeColor];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.sh_badgeView.badgeValue = 9;
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)click {
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

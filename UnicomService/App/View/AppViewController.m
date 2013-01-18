//
//  AppViewController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "AppViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController

@synthesize hudProgress = _hudProgress;

- (id)init
{
    self=[super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_hudProgress];
	// Do any additional setup after loading the view.
}

- (void)showLoading:(NSString *) text
{
    _hudProgress.delegate = self;
    _hudProgress.labelText = text;
    [_hudProgress show:YES];
}

- (void)hideLoading
{
    [_hudProgress hide:YES];
}

- (void)toast:(NSString *)text
{
    _hudProgress.mode = MBProgressHUDModeText;
    _hudProgress.labelText = text;
    _hudProgress.margin = 10.f;
    _hudProgress.yOffset = 150.f;
    _hudProgress.removeFromSuperViewOnHide = YES;
    [_hudProgress hide:YES afterDelay:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  AppViewController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "AppViewController.h"
#import "AppDelegate.h"

@interface AppViewController ()

@end

@implementation AppViewController

@synthesize hudProgress = _hudProgress;
@synthesize topBar = _topBar;
@synthesize topBarText = _topBarText;
@synthesize backBtn = _backBtn;

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

    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    
    //loading动画注册
    _hudProgress = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_hudProgress];
    
    //顶部导航栏
    _topBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
    [_topBar setImage:[UIImage imageNamed:@"topBar.png"]];
    
    //顶部导航栏文字
    _topBarText=[[UILabel alloc] initWithFrame:_topBar.frame];
    [_topBarText setTextAlignment:NSTextAlignmentCenter];
    [_topBarText setBackgroundColor:[UIColor clearColor]];
    [_topBarText setTextColor:[UIColor whiteColor]];
    [_topBarText setFont:[app getGlobalFont:18]];
    [_topBarText setText:@"移动客户端"];
    [_topBar addSubview:_topBarText];
    [self.view addSubview:_topBar];
    
    //如果不是主页，则添加返回按钮
    if(![NSStringFromClass(self.class) isEqualToString:@"MainViewController"])
    {
        //返回按钮
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, (_topBar.frame.size.height-29)/2, 50, 29)];
        [_backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateHighlighted];
        [_backBtn addTarget:self action:@selector(backBtnTap) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backBtn];
    }
}

- (void)showLoading:(NSString *)text
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
    _hudProgress.yOffset = 10.f;
    _hudProgress.removeFromSuperViewOnHide = YES;
    [_hudProgress hide:YES afterDelay:3];
}

-(void)backBtnTap
{
    NSLog(@"backbtnTap");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

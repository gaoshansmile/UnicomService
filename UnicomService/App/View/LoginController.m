//
//  LoginController.m
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//
#import "LoginController.h"
#import "AppDelegate.h"

@interface LoginController ()

@end

@implementation LoginController

- (id)init
{
    [self loadAllView];
    return self;
}

-(void)loadAllView
{
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    
    //Top Red Area
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 255)];
    [headView setBackgroundColor:[UIColor colorWithHexString:@"#c61111"]];
    
    //Login Form 用户登陆
    UITextView *userLoginText=[[UITextView alloc] initWithFrame:CGRectMake(20, 45, 100, 30)];
    [userLoginText setText:@"用户登录"];
    [userLoginText setBackgroundColor:[UIColor clearColor]];
    [userLoginText setTextColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    [userLoginText setFont:[app getGlobalFont:18]];
    
    //用户名
    USFieldArea *nameFieldArea = [[USFieldArea alloc] initWithFrame:CGRectMake(25, 80, 275, 40) withText:@"用户名: "];
    [nameFieldArea setTextFieldTag:TAG_LOGIN_TF_USERNAME];
    [nameFieldArea setTextFieldDelegate:self];
    [nameFieldArea initView];
    
    //密码
    USFieldArea *passFieldArea = [[USFieldArea alloc] initWithFrame:CGRectMake(25, 121, 275, 40) withText:@"密  码: "];
    [passFieldArea setSecureTextEntry:YES];
    [passFieldArea setTextFieldTag:TAG_LOGIN_TF_USERPWD];
    [passFieldArea setTextFieldDelegate:self];
    [passFieldArea setTextReturnKeyType:UIReturnKeyDone];
    [passFieldArea initView];
    
    //是否记住用户名
    USFieldArea *rememberNameArea = [[USFieldArea alloc] initWithFrame:CGRectMake(25, 161, 275, 40) withText:@"记住用户名"];
    [rememberNameArea setCheckBoxEntry:YES];
    [rememberNameArea setBackGroundColor:[UIColor blackColor]];
    [rememberNameArea setFontColor:@"#ffffff"];
    [rememberNameArea initView];
    
    [headView addSubview:userLoginText];
    [headView addSubview:passFieldArea];
    [headView addSubview:nameFieldArea];
    [headView addSubview:rememberNameArea];
    
    //登陆按钮
    UIImageView *loginBtn = [[UIImageView alloc] initWithFrame:CGRectMake(130, 230, 59, 55)];
    [loginBtn setImage:[UIImage imageNamed:@"loginBtn.png"]];
    
    [self.view addSubview:headView];
    [self.view addSubview:loginBtn];
}


//点击屏幕其它地方，关闭软键盘
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField *tfUserName = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERNAME];
    if ([tfUserName isFirstResponder]) {
        [tfUserName resignFirstResponder];
    }
    
    UITextField *tfUserPwd = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERPWD];
    if ([tfUserPwd isFirstResponder]) {
        [tfUserPwd resignFirstResponder];
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    UITextField *tfUserName = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERNAME];
    NSString *strUsername = [tfUserName text];
    UITextField *tfUserPwd = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERPWD];
    NSString *strUserpwd = [tfUserPwd text];
    
    if ([textField tag] == TAG_LOGIN_TF_USERNAME) {
        [tfUserName resignFirstResponder];
        [tfUserPwd becomeFirstResponder];
        return YES;
    }
    else if ([strUsername length]==0 || [strUserpwd length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"账户名或者密码为空！请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return NO;
    }
    
    [tfUserName resignFirstResponder];
    [tfUserPwd resignFirstResponder];
    
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

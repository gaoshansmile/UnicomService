//
//  LoginController.m
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//
#import "LoginController.h"
#import "HttpService.h"
#import "Const.h"
#import "AppDelegate.h"
#import "MainViewController.h"

static BOOL rememberName = YES;

@interface LoginController ()

@end

@implementation LoginController
@synthesize strUsername = _strUsername;
@synthesize strUserpwd = _strUserpwd;

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

    //顶部红色区域
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    [headView setBackgroundColor:[UIColor colorWithHexString:@"#c61111"]];
    
    //用户登陆表单
    UITextView *userLoginText=[[UITextView alloc] initWithFrame:CGRectMake(20, 45, 100, 30)];
    [userLoginText setText:@"用户登录"];
    [userLoginText setBackgroundColor:[UIColor clearColor]];
    [userLoginText setTextColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    [userLoginText setFont:[UIFont fontWithName:FONT_FAMILY size:18]];
    
    //用户名区域
    USFieldArea *nameFieldArea = [[USFieldArea alloc] initWithFrame:CGRectMake(25, 80, 275, 40) withText:@"用户名: "];
    [nameFieldArea setTextFieldTag:TAG_LOGIN_TF_USERNAME];
    [nameFieldArea setTextFieldDelegate:self];
    [nameFieldArea initView];
    
    //密码区域
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
    [rememberNameArea setTextFieldTag:TAG_LOGIN_TF_REM];
    [rememberNameArea addTarget:self action:@selector(toggleRem) forControlEvents:UIControlEventTouchUpInside];
    [rememberNameArea initView];
    
    [headView addSubview:userLoginText];
    [headView addSubview:passFieldArea];
    [headView addSubview:nameFieldArea];
    [headView addSubview:rememberNameArea];
    
    //登陆按钮
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(135, 225, 59, 55)];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn.png"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"loginBtn.png"] forState:UIControlStateHighlighted];
    [loginBtn addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    
    //联通logo
    UIImageView *ucView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, 320, 226)];
    [ucView setImage:[UIImage imageNamed:@"shadow.png"]];
    
    //手机门户logo
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 320, 173, 70)];
    [logoView setImage:[UIImage imageNamed:@"it.png"]];
    
    [self.view addSubview:headView];
    [self.view addSubview:ucView];
    [self.view addSubview:loginBtn];
    [self.view addSubview:logoView];
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

//监听键盘回车按钮
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    UITextField *tfUserName = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERNAME];
    _strUsername = [tfUserName text];
    UITextField *tfUserPwd = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERPWD];
    _strUserpwd = [tfUserPwd text];
    
    if ([textField tag] == TAG_LOGIN_TF_USERNAME) {
        [tfUserName resignFirstResponder];
        [tfUserPwd becomeFirstResponder];
        return YES;
    }
    else
    {
        [self doLogin];
    }
    
    [tfUserName resignFirstResponder];
    [tfUserPwd resignFirstResponder];
    
    return YES;
}


//用户登录
-(void) doLogin
{
    UITextField *tfUserName = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERNAME];
    _strUsername = [tfUserName text];
    UITextField *tfUserPwd = (UITextField *)[self.view viewWithTag:TAG_LOGIN_TF_USERPWD];
    _strUserpwd = [tfUserPwd text];
    
    if ([_strUsername length]==0 || [_strUserpwd length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"用户名和密码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }else{
        [self showLoading:@"登录中，请稍候"];
        [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];
    }
}

//异步登录请求
-(void) asynGetRequest
{
    NSString *url=[Const loginUrl];
    User *user=[[HttpService sharedInstance] doLoginRequest:url];
    [self performSelectorOnMainThread:@selector(requestFinished:) withObject:user waitUntilDone:YES];
}

//用户登录请求成功，返回数据
- (void)requestFinished:(User *)user
{
    if (user) {
        [user setName:_strUsername];
        [user setPassword:_strUserpwd];
        NSError *error=nil;
        AppDelegate *app = [[UIApplication sharedApplication] delegate];
        [[app managedObjectContext] save:&error];
        [self hideLoading];
        //跳转到主页
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:YES];
        MainViewController *mainController=[[MainViewController alloc] init];
        [app.navController pushViewController:mainController animated:NO];
        [UIView commitAnimations];
    }
    else
    {
        [self toast:@"登录失败，请重试"];
    }
}

//记住用户名开关
-(void) toggleRem
{
    UIImageView *remImage = (UIImageView *)[self.view viewWithTag:TAG_LOGIN_TF_REM];
    if (rememberName) {
        [remImage setImage:nil];
        rememberName=NO;
    }
    else
    {
        [remImage setImage:[UIImage imageNamed:@"check.png"]];
        rememberName=YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  AppViewController.h
//  UnicomService
//  所有ViewController的父类
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIColor-RGB.h"
#import "HttpService.h"
#import "Const.h"

@interface AppViewController : UIViewController<MBProgressHUDDelegate>

//顶部状态条
@property UIImageView *topBar;
//顶部状态文字
@property UILabel *topBarText;
//返回按钮
@property UIButton *backBtn;

@property MBProgressHUD *hudProgress;

- (void)showLoading:(NSString *) text;
- (void)hideLoading;
- (void)toast:(NSString *)text;
- (void)backBtnTap;

@end

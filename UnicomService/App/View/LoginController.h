//
//  LoginController.h
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor-RGB.h"
#import "USFieldArea.h"
#import "ASIHTTPRequest.h"
#import "MBProgressHUD.h"

@interface LoginController : UIViewController <UITextFieldDelegate,MBProgressHUDDelegate>

@property ASIHTTPRequest *request;
@property MBProgressHUD *hudProgress;
@property NSString *strUsername;
@property NSString *strUserpwd;

@end

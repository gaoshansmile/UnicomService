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
#import "AppViewController.h"

@interface LoginController : AppViewController <UITextFieldDelegate>

@property NSString *strUsername;
@property NSString *strUserpwd;

@end

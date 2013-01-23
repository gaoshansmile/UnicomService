//
//  AppViewController.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIColor-RGB.h"

@interface AppViewController : UIViewController<MBProgressHUDDelegate>

@property MBProgressHUD *hudProgress;

- (void)showLoading:(NSString *) text;
- (void)hideLoading;
- (void)toast:(NSString *)text;

@end

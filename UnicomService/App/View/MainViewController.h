//
//  MainViewController.h
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AppViewController.h"
#import "ImageFlowView.h"
#import "GridView.h"

@interface MainViewController : AppViewController<GridAdapter>

@property ImageFlowView *flowView;
@property NSMutableArray *gridItems;
@end

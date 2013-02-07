//
//  SystemController.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppViewController.h"
#import "USSelectField.h"

@interface SystemController : AppViewController<UITableViewDelegate,UITableViewDataSource>

@property UITableView *tableView;
@property USSelectField *selectField;
@property NSMutableArray *systemStats;

@end

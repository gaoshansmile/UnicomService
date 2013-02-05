//
//  SystemController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "SystemController.h"
#import "USSelectField.h"

@interface SystemController ()

@end

@implementation SystemController
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topBarText setText:@"系统运行状态"];

    USSelectField *selectField = [[USSelectField alloc] initWithFrame:CGRectMake(0, self.topBar.frame.size.height, self.view.frame.size.width, 35)];
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, selectField.frame.size.height+self.topBar.frame.size.height, self.view.frame.size.width, 300) style:UITableViewStylePlain];
    
    [self.view addSubview:selectField];
    [self.view addSubview:_tableView];
    
    NSMutableArray *selectDataArray = [[NSMutableArray alloc] initWithObjects:@"总部系统运行状态",@"集团系统运行状态",nil];
    [selectField initView:selectDataArray];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

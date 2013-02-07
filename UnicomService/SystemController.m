//
//  SystemController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "SystemController.h"

@interface SystemController ()

@end

@implementation SystemController
@synthesize tableView = _tableView;
@synthesize selectField = _selectField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topBarText setText:@"系统运行状态"];

    _selectField = [[USSelectField alloc] initWithFrame:CGRectMake(0, self.topBar.frame.size.height, self.view.frame.size.width, 35)];
    [_selectField addTarget:self action:@selector(toggleSelectField) forControlEvents:UIControlEventTouchUpInside];
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, _selectField.frame.size.height+self.topBar.frame.size.height, self.view.frame.size.width, 300) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    [self.view addSubview:_selectField];
    
    //弹出选择框的数据
    NSMutableArray *selectDataArray = [[NSMutableArray alloc] initWithObjects:@"总部系统运行状态",@"集团系统运行状态",nil];
    [_selectField initView:selectDataArray];
    [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];
}

//异步获取数据
-(void) asynGetRequest
{
    NSString *url=[Const systemUrl];
    NSMutableArray *system=[[HttpService sharedInstance] doSystemRequest:url];
    [self performSelectorOnMainThread:@selector(requestFinished:) withObject:system waitUntilDone:YES];
}

//获取顶部大图成功
-(void) requestFinished:(NSMutableArray *)system
{
    NSLog(@"imageLinks%d",[imageLinks count]);
    if([imageLinks count]>0)
    {
        [_flowView reloadView:imageLinks];
        [self hideLoading];
    }
    else
    {
        [self toast:@"更新首页大图失败"];
    }
    
}

-(void)toggleSelectField
{
    NSLog(@"toggleSelectField");
    [_selectField togglePopUpView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

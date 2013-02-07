//
//  SystemController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "SystemController.h"
#import "SystemStat.h"

@interface SystemController ()

@end

@implementation SystemController
@synthesize tableView = _tableView;
@synthesize selectField = _selectField;
@synthesize systemStats = _systemStats;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topBarText setText:@"系统运行状态"];

    _selectField = [[USSelectField alloc] initWithFrame:CGRectMake(0, self.topBar.frame.size.height, self.view.frame.size.width, 35)];
    [_selectField addTarget:self action:@selector(toggleSelectField) forControlEvents:UIControlEventTouchUpInside];
    
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, _selectField.frame.size.height+self.topBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-_selectField.frame.size.height-self.topBar.frame.size.height-10) style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
    [self.view addSubview:_tableView];
    [self.view addSubview:_selectField];
    
    //弹出选择框的数据
    NSMutableArray *selectDataArray = [[NSMutableArray alloc] initWithObjects:@"总部系统运行状态",@"集团系统运行状态",nil];
    [_selectField initView:selectDataArray];
    [self showLoading:@"获取数据中"];
    [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];
}

//异步获取数据
-(void) asynGetRequest
{
    NSString *url=[[Const systemUrl] stringByAppendingString:@"&domain=省分"];
    _systemStats=[[HttpService sharedInstance] doSystemRequest:url];
    [self performSelectorOnMainThread:@selector(requestFinished) withObject:nil waitUntilDone:YES];
}

//获取数据成功
-(void) requestFinished
{
    NSLog(@"_systemStats%d",[_systemStats count]);
    if([_systemStats count]>0)
    {
        [_tableView reloadData];
        [self hideLoading];
    }
    else
    {
        [self toast:@"获取数据为空"];
    }
}

-(void)toggleSelectField
{
    NSLog(@"toggleSelectField");
    [_selectField togglePopUpView];
}

#pragma mark - Table View Methods
//下面都是实现UITableViewDelegate,UITableViewDataSource两个协议中定义的方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回行数
    return [_systemStats count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回一行的视图
    NSUInteger row=[indexPath row];
    NSString * tableIdentifier=@"sys table";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if(cell==nil)
    {
        //当没有可复用的空闲的cell资源时(第一次载入,没翻页)
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    SystemStat *ss=[_systemStats objectAtIndex:row];
    cell.textLabel.text=ss.sys;//设置文字
    cell.textLabel.font = [UIFont fontWithName:FONT_FAMILY size:14];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = UITextAlignmentLeft;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回每行的高度
    return 50;
}

#pragma mark - Super Methods
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

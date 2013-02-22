//
//  CommonController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-2-12.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "CommonController.h"

@interface CommonController ()

@end

@implementation CommonController
@synthesize tableView = _tableView;
@synthesize tableData = _tableData;
@synthesize tableCellHeight = _tableCellHeight;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _tableCellHeight=50;
    //展示数据的列表
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 35+self.topBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-self.topBar.frame.size.height-35) style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
}

//异步获取数据
-(void) asynGetRequest
{
    NSString *url=[self getDataUrl];
    _tableData=[[HttpService sharedInstance] doHttpRequest:url];
    [self performSelectorOnMainThread:@selector(requestFinished) withObject:nil waitUntilDone:YES];
}

//获取数据成功
-(void) requestFinished
{
    NSLog(@"_tableData%d",[_tableData count]);
    if([_tableData count]>0)
    {
        [_tableView reloadData];
        [self hideLoading];
    }
    else
    {
        [self toast:@"获取数据为空"];
    }
}

#pragma mark - Table View Methods
//下面都是实现UITableViewDelegate,UITableViewDataSource两个协议中定义的方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回行数
    return [_tableData count];
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
    NSMutableDictionary *data=[_tableData objectAtIndex:row];
    [self buildTableCell:cell withData:data];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //0.2秒后取消选中的背景
    [self performSelector:@selector(deselect:) withObject:tableView afterDelay:0.2f];
}

- (void)deselect:(UITableView *)tableView
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回每行的高度
    return _tableCellHeight;
}

#pragma mark - SelectFieldAdapter Method
- (void)selectField:(USSelectField *)selectField didSelectItemAtIndex:(NSUInteger)index;
{
    [self showLoading:@"获取数据中"];
    [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];
}

-(void)hideOtherPopView:(USSelectField *)selectField
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

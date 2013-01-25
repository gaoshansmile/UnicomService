//
//  MainViewController.m
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "AppContext.h"
#import "User.h"
#import "Const.h"
#import "HttpService.h"
#import "GridView.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize flowView=_flowView;
@synthesize gridItems = _gridItems;

- (id)init
{
    self=[super init];
    if (self) {
        [self createGridItems];
    }
    return self;
}

-(void)createGridItems
{
    _gridItems = [[NSMutableArray alloc] init]; 
    GridItem *item1 = [[GridItem alloc] initWithTitle:@"系统运行状态" image:[UIImage imageNamed:@"RunStatus.png"]];
	[_gridItems addObject:item1];
    GridItem *item2 = [[GridItem alloc] initWithTitle:@"当前告警列表" image:[UIImage imageNamed:@"WarnList.png"]];
	[_gridItems addObject:item2];
    GridItem *item3 = [[GridItem alloc] initWithTitle:@"待办事项" image:[UIImage imageNamed:@"ToDo.png"]];
	[_gridItems addObject:item3];
    GridItem *item4 = [[GridItem alloc] initWithTitle:@"告警排名" image:[UIImage imageNamed:@"WarnRank.png"]];
	[_gridItems addObject:item4];
    GridItem *item5 = [[GridItem alloc] initWithTitle:@"省分告警统计" image:[UIImage imageNamed:@"WarnTrend.png"]];
	[_gridItems addObject:item5];
    GridItem *item6 = [[GridItem alloc] initWithTitle:@"总部告警趋势" image:[UIImage imageNamed:@"WarnStat.png"]];
	[_gridItems addObject:item6];
    NSLog(@"_gridItems%d",_gridItems.count);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.topBarText setText:@"IT服务支撑平台"];
     NSMutableArray *imageLinks=nil;
    _flowView = [[ImageFlowView alloc] initWithFrame:CGRectMake(0,self.topBar.frame.size.height, 320, 135) withImageLinks:imageLinks];
    GridView *gridView = [[GridView alloc] initWithFrame:CGRectMake(0,self.topBar.frame.size.height+135, 320, 300)];
    gridView.adapter=self;
    [gridView initView];
    [self.view addSubview:_flowView];
    [self.view addSubview:gridView];
    [self showLoading:@"获取大图中"];
    [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];    
}


//异步获取首页顶部大图
-(void) asynGetRequest
{
    NSString *url=[Const topImageUrl];
    NSMutableArray *imageLinks=[[HttpService sharedInstance] doTopImagesRequest:url];
    [self performSelectorOnMainThread:@selector(requestFinished:) withObject:imageLinks waitUntilDone:YES];
}

//获取顶部大图成功
-(void) requestFinished:(NSMutableArray *)imageLinks
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

#pragma mark - GridAdapter Methods
- (NSUInteger)gridViewNumberOfItems:(GridView *)gridView
{
    NSLog(@"_gridItems%d",_gridItems.count);
    return _gridItems.count;
}
- (GridItem *)gridView:(GridView *)gridView itemForIndex:(NSUInteger)index
{
    return [_gridItems objectAtIndex:index];
}

- (void)gridView:(GridView *)menuView didSelectItemAtIndex:(NSUInteger)index
{
    
}


#pragma mark - Super Methods
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

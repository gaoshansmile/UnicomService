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
#import "SystemController.h"
#import "ToDoController.h"
#import "TopTenController.h"
#import "WarnListController.h"
#import "WarnStatController.h"
#import "WarnTrendController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize flowView=_flowView;
@synthesize gridItems = _gridItems;

- (id)init
{
    self=[super init];
    if (self) {
        _gridItems = [[NSMutableArray alloc] init];
        [self createGridItems];
    }
    return self;
}

-(void)createGridItems
{
    //初始化GridView每一项的数据
    NSMutableArray *menuItemArray = [[NSMutableArray alloc] initWithObjects:
                  [[NSMutableArray alloc] initWithObjects:@"系统运行状态",@"RunStatus.png",@"SystemController",nil],
                  [[NSMutableArray alloc] initWithObjects:@"当前告警列表",@"WarnList.png",@"WarnListController",nil],
                  [[NSMutableArray alloc] initWithObjects:@"待办事项",@"ToDo.png",@"ToDoController",nil],
                  [[NSMutableArray alloc] initWithObjects:@"告警排名",@"WarnRank.png",@"TopTenController",nil],
                  [[NSMutableArray alloc] initWithObjects:@"省分告警统计",@"WarnTrend.png",@"WarnStatController",nil],
                  [[NSMutableArray alloc] initWithObjects:@"总部告警趋势",@"WarnStat.png",@"WarnTrendController",nil],
                  nil];
    
    //添加GridView每一项的数据
    for (int i=0; i<menuItemArray.count; i++) {
        NSMutableArray *menuItem = [menuItemArray objectAtIndex:i];
        GridItem *item = [[GridItem alloc] initWithTitle:[menuItem objectAtIndex:0] image:[UIImage imageNamed:[menuItem objectAtIndex:1]] ctrlName:[menuItem objectAtIndex:2]];
        [_gridItems addObject:item];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.topBarText setText:@"IT服务支撑平台"];
    
    //顶部大图
     NSMutableArray *imageLinks=nil;
    _flowView = [[ImageFlowView alloc] initWithFrame:CGRectMake(0,self.topBar.frame.size.height, 320, 135) withImageLinks:imageLinks];
    
    //九宫格
    GridView *gridView = [[GridView alloc] initWithFrame:CGRectMake(0,self.topBar.frame.size.height+_flowView.frame.size.height, 320, 300)];
    [gridView setAdapter:self];
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
//获取girdview的item数量
- (NSUInteger)gridViewNumberOfItems:(GridView *)gridView
{
    NSLog(@"_gridItems%d",_gridItems.count);
    return _gridItems.count;
}

//通过索引获取girdview的item
- (GridItem *)gridView:(GridView *)gridView itemForIndex:(NSUInteger)index
{
    return [_gridItems objectAtIndex:index];
}

//通过选中gridview的某一项
- (void)gridView:(GridView *)menuView didSelectItemAtIndex:(NSUInteger)index
{
    NSString *ctrName = [[_gridItems objectAtIndex:index] ctrlName];
    //根据获取到的名字创建Contoller实例
    UIViewController *viewController=[[NSClassFromString(ctrName) alloc] init];
	[self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - Super Methods
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

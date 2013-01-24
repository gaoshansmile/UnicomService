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

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize flowView=_flowView;

- (id)init
{
    self=[super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.topBarText setText:@"IT服务支撑平台"];
     NSMutableArray *imageLinks=nil;
    _flowView = [[ImageFlowView alloc] initWithFrame:CGRectMake(0,self.topBar.frame.size.height, 320, 135) withImageLinks:imageLinks];
    [self.view addSubview:_flowView];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

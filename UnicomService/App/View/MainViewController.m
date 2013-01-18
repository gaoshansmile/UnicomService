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
#import "ImageFlowView.h"
#import "Const.h"
#import "HttpService.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    User *user = [AppContext getBean:@"CurrentUser"];
    NSLog(@"name%@",[user name]);
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

-(void) requestFinished:(NSMutableArray *)imageLinks
{
    ImageFlowView *flowView = [[ImageFlowView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) withImageLinks:imageLinks];
    [self.view addSubview:flowView];
    [self hideLoading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

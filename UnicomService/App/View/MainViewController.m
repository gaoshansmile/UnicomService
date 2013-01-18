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

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self=[super init];
    if (self) {
        [self loadAllView];
    }
    return self;
}

-(void)loadAllView
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    User *user = [AppContext getBean:@"CurrentUser"];
    NSLog(@"name%@",[user name]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

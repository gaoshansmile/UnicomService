//
//  WarnTrendController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "WarnTrendController.h"

@interface WarnTrendController ()

@end

@implementation WarnTrendController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topBarText setText:@"总部告警趋势"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

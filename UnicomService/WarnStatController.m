//
//  WarnStatController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "WarnStatController.h"

@interface WarnStatController ()

@end

@implementation WarnStatController

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
    [self.topBarText setText:@"省分告警统计"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

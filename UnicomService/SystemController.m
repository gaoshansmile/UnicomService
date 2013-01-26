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
    [self.topBarText setText:@"系统运行状态"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

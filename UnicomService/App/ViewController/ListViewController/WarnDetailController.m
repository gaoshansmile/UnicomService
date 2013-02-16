//
//  WarnDetailController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-2-16.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "WarnDetailController.h"

@interface WarnDetailController ()

@end

@implementation WarnDetailController
@synthesize data = _data;

-(id)initWithData:data
{
    self=[super init];
    if (self) {
        _data=data;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topBarText setText:@"告警详情"];
    UIView *viewLayout = [[UIView alloc] initWithFrame:CGRectMake(0, self.topBar.frame.size.height, self.view.bounds.size.width, self.view.frame.size.height-200)];
    viewLayout.backgroundColor = [UIColor whiteColor];
    
    //标题
    UITextView *title = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, viewLayout.frame.size.width, 30)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    title.font = [UIFont fontWithName:FONT_FAMILY size:16];
    title.text = [_data objectForKey:@"eventtyp"];
    title.textAlignment = UITextAlignmentCenter;
    title.editable=NO;
    
    //时间
    UITextView *time = [[UITextView alloc] initWithFrame:CGRectMake(0, title.frame.size.height, viewLayout.frame.size.width, 25)];
    time.backgroundColor = [UIColor clearColor];
    time.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    time.font = [UIFont fontWithName:FONT_FAMILY size:14];
    time.text = [NSString stringWithFormat:@"产生时间：%@",[_data objectForKey:@"time"]];
    time.editable=NO;
    
    //归属地
    UITextView *area = [[UITextView alloc] initWithFrame:CGRectMake(0, time.frame.origin.y+time.frame.size.height, viewLayout.frame.size.width/2, 25)];
    area.backgroundColor = [UIColor clearColor];
    area.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    area.font = [UIFont fontWithName:FONT_FAMILY size:14];
    area.text = [NSString stringWithFormat:@"归属地：%@",[_data objectForKey:@"area"]];
    area.editable=NO;
    
    //归属域
    UITextView *sys = [[UITextView alloc] initWithFrame:CGRectMake(viewLayout.frame.size.width/2, time.frame.origin.y+time.frame.size.height, viewLayout.frame.size.width/2, 25)];
    sys.backgroundColor = [UIColor clearColor];
    sys.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    sys.font = [UIFont fontWithName:FONT_FAMILY size:14];
    sys.text = [NSString stringWithFormat:@"归属域：%@",[_data objectForKey:@"domain"]];
    sys.editable=NO;
    
    // 事件描述
    UITextView *content = [[UITextView alloc] initWithFrame:CGRectMake(0, sys.frame.origin.y+sys.frame.size.height, viewLayout.frame.size.width, 50)];
    content.backgroundColor = [UIColor clearColor];
    content.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    content.font = [UIFont fontWithName:FONT_FAMILY size:14];
    content.text = [NSString stringWithFormat:@"事件描述：%@",[_data objectForKey:@"content"]];
    content.editable=NO;
    
    // 事件级别
    UITextView *level = [[UITextView alloc] initWithFrame:CGRectMake(0, content.frame.origin.y+content.frame.size.height, viewLayout.frame.size.width, 25)];
    level.backgroundColor = [UIColor clearColor];
    level.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    level.font = [UIFont fontWithName:FONT_FAMILY size:14];
    level.text = [NSString stringWithFormat:@"事件级别：%@",[_data objectForKey:@"elevel"]];
    level.editable=NO;
    
    // 事件范围
    UITextView *range = [[UITextView alloc] initWithFrame:CGRectMake(0, level.frame.origin.y+level.frame.size.height, viewLayout.frame.size.width, 25)];
    range.backgroundColor = [UIColor clearColor];
    range.textColor = [UIColor colorWithHexString:FONT_GRAY_COLOR];
    range.font = [UIFont fontWithName:FONT_FAMILY size:14];
    range.text = [NSString stringWithFormat:@"事件范围：%@",[_data objectForKey:@"range"]];
    range.editable=NO;
    
    [viewLayout addSubview:title];
    [viewLayout addSubview:time];
    [viewLayout addSubview:area];
    [viewLayout addSubview:sys];
    [viewLayout addSubview:content];
    [viewLayout addSubview:level];
    [viewLayout addSubview:range];
    
    UIImageView *borderImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, viewLayout.frame.origin.y+viewLayout.frame.size.height, viewLayout.frame.size.width, 12.5)];
    [borderImage setImage:[UIImage imageNamed:@"bg_border.png"]];
    
    [self.view addSubview:viewLayout];
    [self.view addSubview:borderImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

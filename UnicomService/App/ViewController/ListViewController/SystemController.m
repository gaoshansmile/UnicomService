//
//  SystemController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "SystemController.h"
#import "SystemStat.h"

@interface SystemController ()

@end

@implementation SystemController
@synthesize selectField = _selectField;
@synthesize selectData = _selectData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topBarText setText:@"系统运行状态"];
    
    currentType=@"总部";

    _selectField = [[USSelectField alloc] initWithFrame:CGRectMake(0, self.topBar.frame.size.height, self.view.frame.size.width, 35)];
    [_selectField setDelegate:self];
    [self.view addSubview:_selectField];
    
    //弹出选择框的数据
    _selectData = [[NSMutableArray alloc] initWithObjects:
                   [[NSMutableArray alloc] initWithObjects:@"总部系统运行状态",@"总部",nil],
                   [[NSMutableArray alloc] initWithObjects:@"省分系统运行状态",@"省分",nil],
                   nil];
    [_selectField initView:_selectData];
    [self showLoading:@"获取数据中"];
    [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];
}

#pragma mark - Common Controller Delegate Methods
//返回Http Url地址
-(NSString *)getDataUrl;
{
    return [[Const systemUrl] stringByAppendingFormat:@"&domain=%@",currentType];
}

//构建Table Cell的模板
-(void)buildTableCell:(UITableViewCell *)cell withData:(NSMutableDictionary *)data;
{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, cell.frame.size.width, 20)];
    title.text=[data objectForKey:@"sys"];//设置文字
    title.font = [UIFont fontWithName:FONT_FAMILY size:14];
    title.textColor = [UIColor blackColor];
    title.textAlignment = UITextAlignmentLeft;
    [cell addSubview:title];
    
    UILabel *domain = [[UILabel alloc] initWithFrame:CGRectMake(10, title.frame.size.height+7, cell.frame.size.width/2, 18)];
    domain.text=[NSString stringWithFormat:@"域：%@",[data objectForKey:@"domain"]];
    domain.font = [UIFont fontWithName:FONT_FAMILY size:12];
    domain.textColor = [UIColor grayColor];
    domain.textAlignment = UITextAlignmentLeft;
    [cell addSubview:domain];
    
    UILabel *total = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/2, title.frame.size.height+7, cell.frame.size.width/2-15, 18)];
    total.text=[NSString stringWithFormat:@"总数：%@",[data objectForKey:@"total"]];
    total.font = [UIFont fontWithName:FONT_FAMILY size:12];
    total.textColor = [UIColor grayColor];
    total.textAlignment = UITextAlignmentLeft;
    [cell addSubview:total];
}


#pragma mark - Super Methods
- (void)selectField:(USSelectField *)selectField didSelectItemAtIndex:(NSUInteger)index;
{
    currentType = [[[self selectData] objectAtIndex:index] objectAtIndex:1];
    [super selectField:selectField didSelectItemAtIndex:index];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

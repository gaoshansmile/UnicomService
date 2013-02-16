//
//  WarnListController.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "WarnListController.h"
#import "Warn.h"
#import "WarnDetailController.h"

@interface WarnListController ()

@end

@implementation WarnListController

@synthesize levelField = _levelField;
@synthesize domainField = _domainField;
@synthesize areaField = _areaField;
@synthesize levelData = _levelData;
@synthesize domainData = _domainData;
@synthesize areaData = _areaData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //覆盖父类的属性
    [self.topBarText setText:@"当前告警列表"];
    [self setTableCellHeight:70];
    
    //初始化
    currentLevel=@"all";
    currentDomain=@"总部";
    currentArea=@"all";

    float bodyWidth = self.view.bounds.size.width;
    
    //级别选择菜单
    _levelField = [[USSelectField alloc] initWithFrame:CGRectMake(0, self.topBar.frame.size.height, bodyWidth/3, 35)];
    [_levelField setDelegate:self];
    [_levelField setTag:LEVELTAG];
    _levelData = [[NSMutableArray alloc] initWithObjects:
                  [[NSMutableArray alloc] initWithObjects:@"全部",@"all",nil],
                  [[NSMutableArray alloc] initWithObjects:@"重要",@"4",nil],
                  [[NSMutableArray alloc] initWithObjects:@"紧急",@"5",nil],
                  nil];
    
    //域选择菜单
    _domainField = [[USSelectField alloc] initWithFrame:CGRectMake(bodyWidth/3, self.topBar.frame.size.height, bodyWidth/3, 35)];
    [_domainField setDelegate:self];
    [_domainField setTag:DOMAINTAG];
    _domainData = [[NSMutableArray alloc] initWithObjects:
                  [[NSMutableArray alloc] initWithObjects:@"全部",@"all",nil],
                  [[NSMutableArray alloc] initWithObjects:@"BSS域",@"BSS",nil],
                  [[NSMutableArray alloc] initWithObjects:@"OSS域",@"OSS",nil],
                  [[NSMutableArray alloc] initWithObjects:@"MSS域",@"MSS",nil],
                  [[NSMutableArray alloc] initWithObjects:@"DSS域",@"DSS",nil],
                  nil];
    
    //地区选择菜单
    _areaField = [[USSelectField alloc] initWithFrame:CGRectMake(bodyWidth*2/3, self.topBar.frame.size.height, bodyWidth/3, 35)];
    [_areaField setDelegate:self];
    [_areaField setTag:AREATAG];
    _areaData = [[NSMutableArray alloc] initWithObjects:
                   [[NSMutableArray alloc] initWithObjects:@"总部",@"总部",nil],
                   [[NSMutableArray alloc] initWithObjects:@"省分",@"省分",nil],
                   nil];
   

    [self.view addSubview:_levelField];
    [self.view addSubview:_areaField];
    [self.view addSubview:_domainField];
    
    [_levelField initView:_levelData];
    [_areaField initView:_areaData];
    [_domainField initView:_domainData];
    
    [self showLoading:@"获取数据中"];
    [self performSelectorInBackground:@selector(asynGetRequest) withObject:nil];
}

#pragma mark - Common Controller Delegate Methods
//返回Http Url地址
-(NSString *)getDataUrl;
{
    NSString *url=[Const warnListUrl];
    if(![currentDomain isEqualToString:@"all"])
    {
        url=[url stringByAppendingFormat:@"&domain=%@",currentDomain];
    }
    if(![currentLevel isEqualToString:@"all"])
    {
        url=[url stringByAppendingFormat:@"&level=%@",currentLevel];
    }
    if(![currentArea isEqualToString:@"all"])
    {
        url=[url stringByAppendingFormat:@"&area=%@",currentArea];
    }
    return url;
}

//构建Table Cell的模板
-(void)buildTableCell:(UITableViewCell *)cell withData:(NSMutableDictionary *)data;
{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, cell.frame.size.width, 20)];
    title.text=[data objectForKey:@"eventtyp"];//设置文字
    title.font = [UIFont fontWithName:FONT_FAMILY size:14];
    title.textColor = [UIColor blackColor];
    title.textAlignment = UITextAlignmentLeft;
    [cell addSubview:title];
    
    UILabel *domain = [[UILabel alloc] initWithFrame:CGRectMake(10, title.frame.size.height+7, cell.frame.size.width/3, 18)];
    domain.text=[@"归属地：" stringByAppendingString:[data objectForKey:@"area"]];//设置文字
    domain.font = [UIFont fontWithName:FONT_FAMILY size:12];
    domain.textColor = [UIColor grayColor];
    domain.textAlignment = UITextAlignmentLeft;
    [cell addSubview:domain];
    
    UILabel *total = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/3, title.frame.size.height+7, cell.frame.size.width*2/3, 18)];
    total.text=[NSString stringWithFormat:@"归属系统：%@",[data objectForKey:@"sys"]];
    total.font = [UIFont fontWithName:FONT_FAMILY size:12];
    total.textColor = [UIColor grayColor];
    total.textAlignment = UITextAlignmentLeft;
    [cell addSubview:total];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(10, title.frame.size.height+total.frame.size.height+7, cell.frame.size.width, 18)];
    time.text=[NSString stringWithFormat:@"产生时间：%@",[data objectForKey:@"time"]];
    time.font = [UIFont fontWithName:FONT_FAMILY size:12];
    time.textColor = [UIColor grayColor];
    time.textAlignment = UITextAlignmentLeft;
    [cell addSubview:time];
}

//选中TableView的一项
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    NSMutableDictionary *data = [[self tableData] objectAtIndex:[indexPath row]];
    WarnDetailController *wdc = [[WarnDetailController alloc] initWithData:data];
    [self.navigationController pushViewController:wdc animated:YES];
}


#pragma mark - Super Methods
- (void)selectField:(USSelectField *)selectField didSelectItemAtIndex:(NSUInteger)index;
{
    if([selectField tag]==LEVELTAG)
    {
        currentLevel=[[_levelData objectAtIndex:index] objectAtIndex:1];
        NSLog(@"currentLevel:%@",currentLevel);
    }
    if([selectField tag]==AREATAG)
    {
        currentArea=[[_areaData objectAtIndex:index] objectAtIndex:1];
    }
    if([selectField tag]==DOMAINTAG)
    {
        currentDomain=[[_domainData objectAtIndex:index] objectAtIndex:1];
    }
    [super selectField:selectField didSelectItemAtIndex:index];
}

#pragma mark - USFieldSelect Delegate Method
//关闭其他弹出菜单
-(void)hideOtherPopView:(USSelectField *)selectField
{
    if([selectField tag]!=LEVELTAG)
    {
        [_levelField hidePopView];
    }
    if([selectField tag]!=AREATAG)
    {
         [_areaField hidePopView];
    }
    if([selectField tag]!=DOMAINTAG)
    {
        [_domainField hidePopView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

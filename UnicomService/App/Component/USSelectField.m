//
//  USSelectField.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-27.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "USSelectField.h"
#import "AppDelegate.h"

@implementation USSelectField

@synthesize selectItems = _selectItems;
@synthesize selectField = _selectField;
@synthesize selectFieldTitle = _selectFieldTitle;
@synthesize selectLabel = _selectLabel;
@synthesize selectPopUp = _selectPopUp;
@synthesize selectData = _selectData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        AppDelegate *app = [[UIApplication sharedApplication] delegate];
        
        _selectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-10, self.bounds.size.height)];
        [_selectLabel setTextColor:[UIColor whiteColor]];
        [_selectLabel setFont:[app getGlobalFont:15]];
        [_selectLabel setBackgroundColor:[UIColor clearColor]];
        
        _selectField = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [_selectField setBackgroundColor:[UIColor blackColor]];
        [_selectField addSubview:_selectLabel];
        [self addSubview:_selectField];
    }
    return self;
}

//初始化view数据
-(void) initView:(NSMutableArray *) array
{
    _selectData=array;
    //设置选中的文字
    [_selectLabel setText:[_selectData objectAtIndex:0]];
    //父View的宽（屏幕宽）
    int parentViewWidth = self.superview.frame.size.width;
    //弹出View的宽
    int popWidth = 217;
    //选择区域的x坐标
    float selectFieldCenterX = self.center.x;
    //父View的中心x坐标
    float parentViewCenterX = self.superview.center.x;
    float y=self.frame.origin.y+self.frame.size.height;
    float x=0;
    float arrowX=0;
    
    //如果selectField的中心靠屏幕左边
    if(selectFieldCenterX < parentViewCenterX)
    {
        x=10;
        arrowX=self.frame.size.width-x;
    }
    //如果selectField的中心是屏幕中心
    else if (selectFieldCenterX==parentViewCenterX)
    {
        x=(parentViewWidth-popWidth)/2;
        arrowX=(popWidth-18.5)/2;
    }
    //如果selectField的中心靠屏幕右边
    else
    {
        x=parentViewWidth-popWidth-10;
        arrowX=(self.frame.size.width)/2;
    }
    
    //PopView
    UIView *popUpView = [[UIView alloc] initWithFrame:CGRectMake(x, y+5, popWidth, 260)];
    [popUpView setBackgroundColor:[UIColor clearColor]];
    
    //PopView的小箭头
    UIImageView *popArrowView = [[UIImageView alloc] initWithFrame:CGRectMake(arrowX, 0, 18.5, 5.5)];
    [popArrowView setImage:[UIImage imageNamed:@"popup_arrow.png"]];
    
    //PopTableView的主体
    _selectPopUp = [[UITableView alloc] initWithFrame:CGRectMake(0, popArrowView.frame.size.height, popWidth, 260)];
    [_selectPopUp setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_selectPopUp setDelegate:self];
    [_selectPopUp setDataSource:self];
    
    UIImageView *popBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup_bg.png"]];
    [popBgView setFrame:_selectPopUp.frame];
    
    [_selectPopUp setBackgroundView:popBgView];
    
    [popUpView addSubview:popArrowView];
    [popUpView addSubview:_selectPopUp];
    
    [self.superview addSubview:popUpView];
}

//下面都是实现UITableViewDelegate,UITableViewDataSource两个协议中定义的方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回行数
    return [_selectData count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    //返回一行的视图
    NSUInteger row=[indexPath row];
    NSString * tableIdentifier=@"Simple table";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if(cell==nil)
    {
        //当没有可复用的空闲的cell资源时(第一次载入,没翻页)
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    cell.textLabel.text=[_selectData objectAtIndex:row];//设置文字
    cell.textLabel.font = [app getGlobalFont:14];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *sepView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pop_sep.png"]];
    [sepView setFrame:CGRectMake(0, cell.frame.size.height-1, cell.frame.size.width, 1)];
    [cell addSubview:sepView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_selectLabel setText:[_selectData objectAtIndex:[indexPath row]]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回每行的高度
    return 44;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

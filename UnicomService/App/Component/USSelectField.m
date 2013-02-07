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

@synthesize selectField = _selectField;
@synthesize selectLabel = _selectLabel;
@synthesize popUpView = _popUpView;
@synthesize selectData = _selectData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor blackColor]];
        _selectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-10, self.bounds.size.height)];
        [_selectLabel setTextColor:[UIColor whiteColor]];
        [_selectLabel setFont:[UIFont fontWithName:FONT_FAMILY size:15]];
        [_selectLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_selectLabel];
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
    //弹出popUpView的y坐标
    float y=self.frame.origin.y+self.frame.size.height;
    //弹出popUpView的x坐标
    float x=0;
    //弹出popUpView的小箭头x坐标
    float arrowX=0;
    
    //如果popUpView的中心靠屏幕左边
    if(selectFieldCenterX < parentViewCenterX)
    {
        x=10;
        arrowX=self.frame.size.width-x;
    }
    //如果popUpView的中心是屏幕中心
    else if (selectFieldCenterX==parentViewCenterX)
    {
        x=(parentViewWidth-popWidth)/2;
        arrowX=(popWidth-18.5)/2;
    }
    //如果popUpView的中心靠屏幕右边
    else
    {
        x=parentViewWidth-popWidth-10;
        arrowX=(self.frame.size.width)/2;
    }
    
    //popUpView
    _popUpView = [[UIView alloc] initWithFrame:CGRectMake(x, y+5, popWidth, 260)];
    [_popUpView setBackgroundColor:[UIColor clearColor]];
    [_popUpView setHidden:YES];
    
    //popUpView的小箭头
    UIImageView *popArrowView = [[UIImageView alloc] initWithFrame:CGRectMake(arrowX, 0, 18.5, 5.5)];
    [popArrowView setImage:[UIImage imageNamed:@"popup_arrow.png"]];
    
    //popUpView的主体
    UITableView *selectPopUp = [[UITableView alloc] initWithFrame:CGRectMake(0, popArrowView.frame.size.height, popWidth, 260)];
    [selectPopUp setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [selectPopUp setDelegate:self];
    [selectPopUp setDataSource:self];
    
    //popUpView的背景图
    UIImageView *popBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup_bg.png"]];
    [popBgView setFrame:selectPopUp.frame];
    
    [selectPopUp setBackgroundView:popBgView];
    
    [_popUpView addSubview:popArrowView];
    [_popUpView addSubview:selectPopUp];
    
    //向父View添加弹出的popUpView
    [self.superview addSubview:_popUpView];
}

//控制弹出view的显示和隐藏
-(void)togglePopUpView
{
    if(_popUpView.hidden)
    {
        [_popUpView setHidden:NO];
    }
    else
    {
        [_popUpView setHidden:YES];
    }
}

#pragma mark - Table View Methods
//下面都是实现UITableViewDelegate,UITableViewDataSource两个协议中定义的方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回行数
    return [_selectData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    cell.textLabel.font = [UIFont fontWithName:FONT_FAMILY size:14];
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

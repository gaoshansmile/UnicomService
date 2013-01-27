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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        AppDelegate *app = [[UIApplication sharedApplication] delegate];
        _selectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-10, self.bounds.size.height)];
        [_selectLabel setTextColor:[UIColor whiteColor]];
        [_selectLabel setFont:[app getGlobalFont:15]];
        [_selectLabel setText:@"总部系统运行状态"];
        [_selectLabel setBackgroundColor:[UIColor clearColor]];
        
        _selectField = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [_selectField setBackgroundColor:[UIColor blackColor]];
        [_selectField addSubview:_selectLabel];
        [self addSubview:_selectField];
    }
    return self;
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

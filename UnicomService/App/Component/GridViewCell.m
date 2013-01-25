//
//  GridViewCell.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "GridViewCell.h"
#import "AppDelegate.h"

@implementation GridViewCell
@synthesize image = _image;
@synthesize title = _title;
@synthesize imageView = _imageView;
@synthesize label = _label;
@synthesize usFrame= _usFrame;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        AppDelegate *app = [[UIApplication sharedApplication] delegate];
        _usFrame=frame;
        _imageView = [[UIImageView alloc] init];
        _label = [[UILabel alloc] init];
        [_label setTextAlignment:UITextAlignmentCenter];
        [_label setBackgroundColor:[UIColor clearColor]];
        [_label setFont:[app getGlobalFont:13]];
        [self addSubview:_imageView];
        [self addSubview:_label];
    }
    return self;
}

-(void)initView
{
    float x= (_usFrame.size.width-_image.size.width)/2;
    _imageView.frame=CGRectMake(x, 0, _image.size.width, _image.size.height);
    _label.frame=CGRectMake(0, _imageView.frame.size.height, _usFrame.size.width, 20);
    [_imageView setImage:_image];
    [_label setText:_title];
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

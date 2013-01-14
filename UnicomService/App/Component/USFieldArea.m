//
//  USFieldArea.m
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "USFieldArea.h"
#import "AppDelegate.h"

@implementation USFieldArea

@synthesize textField = _textField;
@synthesize secureTextEntry = _secureTextEntry;
@synthesize checkBoxEntry = _checkBoxEntry;
@synthesize fontColor = _fontColor;
@synthesize backGroundColor = _backGroundColor;
@synthesize text = _text;
@synthesize usFrame = _usFrame;
@synthesize textFieldTag = _textFieldTag;
@synthesize textReturnKeyType = _textReturnKeyType;
@synthesize textFieldDelegate = _textFieldDelegate;

- (id)initWithFrame:(CGRect)frame withText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
         // Initialization code
        [self setBackGroundColor:[UIColor whiteColor]];
        [self setFontColor:@"#000000"];
        [self setSecureTextEntry:NO];
        [self setCheckBoxEntry:NO];
        [self setText:text];
        [self setUsFrame:frame];
        [self setTextReturnKeyType:UIReturnKeyNext];
    }
    return self;
}

-(void)initView
{
    [self setBackgroundColor:_backGroundColor];
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    
    //文字
    UITextView *textView=[[UITextView alloc] initWithFrame:CGRectMake(10, 5, 100, 22)];
    [textView setText:_text];
    [textView setEditable:NO];
    [textView setTextColor:[UIColor colorWithHexString:_fontColor]];
    [textView setBackgroundColor:[UIColor clearColor]];
    [textView setFont:[app getGlobalFont:13]];
    
    UIImageView *imageView=nil;
    
    //输入框
    if(!_checkBoxEntry)
    {
        _textField=[[UITextField alloc] initWithFrame:CGRectMake(100, 5, 200, _usFrame.size.height-10)];
        [_textField setBackgroundColor:[UIColor clearColor]];
        [_textField setFont:[UIFont systemFontOfSize:13]];
        [_textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_textField setSecureTextEntry:_secureTextEntry];
        [_textField setTag:_textFieldTag];
        [_textField setDelegate:_textFieldDelegate];
        [_textField setReturnKeyType:_textReturnKeyType];
    }
    //选择框
    else{
        imageView=[[UIImageView alloc] initWithFrame:CGRectMake(240, 12.5, 15, 15)];
        [imageView setImage:[UIImage imageNamed:@"check.png"]];
    }
    
    NSLog(@"%f",_usFrame.size.width);
    UIView *border=[[UIView alloc] initWithFrame:CGRectMake(0, 40, _usFrame.size.width, 1)];
    [border setBackgroundColor:[UIColor colorWithHexString:@"#b2b2b2"]];
    
    [self addSubview:textView];
    if(_textField!=nil)
    {
        [self addSubview:_textField];
        [self addSubview:border];
    }
    if(imageView!=nil)
    {
        [self addSubview:imageView];
    }
    
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

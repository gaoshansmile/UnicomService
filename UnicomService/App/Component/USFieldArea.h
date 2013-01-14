//
//  USFieldArea.h
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor-RGB.h"

@interface USFieldArea : UIView


//frame
@property CGRect usFrame;
//是否为密码
@property BOOL secureTextEntry;
//是否为checkbox
@property BOOL checkBoxEntry;
//为文字颜色
@property NSString *fontColor;
//背景颜色
@property UIColor *backGroundColor;
//描述文字
@property NSString *text;
//文字输入框
@property UITextField *textField;
//文字输入框Tag
@property NSInteger textFieldTag;
//输入框对应软键盘的类型
@property UIReturnKeyType textReturnKeyType;
//输入框代理，用于处理输入框软键盘事件
@property id<UITextFieldDelegate> textFieldDelegate;

- (id)initWithFrame:(CGRect)frame withText:(NSString *)text;
- (void)initView;

@end

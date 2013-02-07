//
//  USSelectField.h
//  UnicomService
//  弹出下拉菜单的选择区域
//  Created by 老邢 Thierry on 13-1-27.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface USSelectField : UIControl<UITableViewDataSource,UITableViewDelegate>

@property UILabel *selectLabel;
@property UIView *selectField;
@property UIView *popUpView;
@property NSMutableArray *selectData;

-(void)initView:(NSMutableArray *) array;

-(void)togglePopUpView;

@end

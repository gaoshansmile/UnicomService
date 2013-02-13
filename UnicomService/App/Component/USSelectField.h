//
//  USSelectField.h
//  UnicomService
//  弹出下拉菜单的选择区域
//  Created by 老邢 Thierry on 13-1-27.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>

@class USSelectField;
@protocol SelectFieldDelegate <NSObject>
@required
// SelectField选择一项
- (void)selectField:(USSelectField *)selectField didSelectItemAtIndex:(NSUInteger)index;

@optional
// 隐藏其它弹出的View
- (void)hideAllPopView;
@end

@interface USSelectField : UIControl<UITableViewDataSource,UITableViewDelegate>

@property UILabel *selectLabel;
@property UIView *selectField;
@property UIView *popUpView;
@property NSMutableArray *selectData;
@property id<SelectFieldDelegate> delegate;

/* 初始化view数据,必须在superview addSubView之后执行，否则获取不到superview的宽度，导致计算失败
 */
-(void)initView:(NSMutableArray *) array;

-(void)hidePopView;

@end

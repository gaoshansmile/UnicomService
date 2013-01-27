//
//  USSelectField.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-27.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface USSelectField : UIView<UITableViewDataSource,UITableViewDelegate>

@property NSString *selectFieldTitle;
@property UILabel *selectLabel;
@property NSMutableDictionary *selectItems;
@property UIButton *selectField;
@property UITableView *selectPopUp;


@end

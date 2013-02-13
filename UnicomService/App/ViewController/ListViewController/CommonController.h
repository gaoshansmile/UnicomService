//
//  CommonController.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-2-12.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "AppViewController.h"
#import "USSelectField.h"

@protocol CommonControllerDelegate <NSObject>
@required
//获取Http Url地址
-(NSString *)getDataUrl;
//构建Table Cell的模板
-(void)buildTableCell:(UITableViewCell *)cell withData:(NSMutableDictionary *)tableData;
@end

@interface CommonController : AppViewController<UITableViewDelegate,UITableViewDataSource,SelectFieldDelegate,CommonControllerDelegate>

//展示列表的TableView
@property UITableView *tableView;
//展示列表的TableView的数据源
@property NSMutableArray *tableData;
//设置Tabel Cell的高度
@property int tableCellHeight;

@end

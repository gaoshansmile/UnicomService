//
//  SystemController.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonController.h"

@interface SystemController : CommonController<CommonControllerDelegate>
{
    NSString *currentType;
}

@property USSelectField *selectField;
@property NSMutableArray *selectData;

@end

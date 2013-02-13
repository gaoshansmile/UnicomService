//
//  WarnListController.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-26.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "CommonController.h"
#import "USSelectField.h"

@interface WarnListController : CommonController
{
    NSString *currentLevel;
    NSString *currentDomain;
    NSString *currentArea;
}

@property USSelectField *levelField;
@property USSelectField *domainField;
@property USSelectField *areaField;
@property NSMutableArray *levelData;
@property NSMutableArray *domainData;
@property NSMutableArray *areaData;

@end

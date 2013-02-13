//
//  Warn.h
//  UnicomService
//  当前告警 模型
//  Created by 老邢 Thierry on 13-2-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Warn : NSObject

@property NSString *elevel;
@property NSString *eventtyp;
@property NSString *domain;
@property NSString *area;
@property NSString *range;
@property NSString *sys;
@property NSString *content;
@property NSString *time;
@property NSString *mperson;

@end

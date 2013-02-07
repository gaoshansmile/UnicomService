//
//  HttpService.h
//  UnicomService
//  用来处理Http的服务
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonParseService.h"
#import "User.h"

@interface HttpService : NSObject

@property NSString *url;

+(HttpService *) sharedInstance;

-(User *)doLoginRequest:(NSString *) url;

-(NSMutableArray *)doTopImagesRequest:(NSString *)url;

-(NSMutableArray *)doSystemRequest:(NSString *)url;

@end

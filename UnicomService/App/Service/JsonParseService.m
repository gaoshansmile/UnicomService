//
//  JsonParseService.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "JsonParseService.h"
#import "AppContext.h"

@implementation JsonParseService

+(id)convertToJson:(NSString *)response
{
    id jsonValue = [response JSONValue];
    return jsonValue;
}

+(User *)parseLogin:(NSString *)response
{
    SBJsonParser * parser = [[SBJsonParser alloc] init];
    NSMutableDictionary *jsonDic = [parser objectWithString:response];
    NSString *token = [jsonDic objectForKey:@"data"];
    User *user=[AppContext getBean:@"CurrentUser"];
    [user setToken:token];
    return user;
}

@end

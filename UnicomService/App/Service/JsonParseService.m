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


//解析登陆
+(User *)parseLogin:(NSString *)response
{
    SBJsonParser * parser = [[SBJsonParser alloc] init];
    NSMutableDictionary *jsonDic = [parser objectWithString:response];
    NSString *token = [jsonDic objectForKey:@"data"];
    User *user=[AppContext getBean:@"CurrentUser"];
    [user setToken:token];
    return user;
}

//解析顶部大图
+(NSMutableArray *)parseTopImages:(NSString *)response
{
    SBJsonParser * parser = [[SBJsonParser alloc] init];
    NSMutableDictionary *jsonDic = [parser objectWithString:response];
    NSMutableArray *topImages = [jsonDic objectForKey:@"data"];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i=0; i<[topImages count]; i++) {
        NSMutableDictionary *image = topImages[i];
        [images addObject:[image objectForKey:@"URI"]];
        NSLog(@"uri:%@",[image objectForKey:@"URI"]);
    }
    return images;
}

@end

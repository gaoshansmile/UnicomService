//
//  HttpService.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Service handle http connection and data request
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "HttpService.h"
#import "ASIHTTPRequest.h"
#import "JsonParseService.h"

@implementation HttpService
@synthesize url = _url;
static HttpService *_shareInstance=nil;

+(HttpService *) sharedInstance
{
    if(!_shareInstance)
    {
        _shareInstance=[[HttpService alloc]init];
    }
    return _shareInstance;
}

-(NSString *)getRequest:(NSString *)url
{
    NSString *result=nil;
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request startSynchronous];
    NSError *error = [request error];
    if(error)
    {
        NSLog(@"request error%@",error);
    }
    else
    {
        result = [request responseString];
    }
    return  result;
}

//用户登陆请求
-(User *)doLoginRequest:(NSString *)url
{
    NSString *result=[self getRequest:url];
    User *user=nil;
    if (result) {
        NSLog(@"respone:%@",result);
        user=[JsonParseService parseLogin:result];
    }
    return user;
}

//首页顶部大图请求
-(NSMutableArray *)doTopImagesRequest:(NSString *)url
{
    NSString *result=[self getRequest:url];
    NSMutableArray *images=nil;
    if (result) {
        NSLog(@"respone result:%@",result);
        images=[JsonParseService parseTopImages:result];
    }
    return images;
}

//系统运行状态请求
-(NSMutableArray *)doSystemRequest:(NSString *)url
{
    NSString *result=[self getRequest:url];
    NSMutableArray *systemStats=nil;
    if (result) {
        NSLog(@"respone result:%@",result);
        systemStats=[JsonParseService parseSystem:result];
    }
    return systemStats;
}

@end

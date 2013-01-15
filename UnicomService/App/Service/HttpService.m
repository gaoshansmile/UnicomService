//
//  HttpService.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "HttpService.h"
#import "ASIHTTPRequest.h"
#import "AppContext.h"
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
        NSLog(@"%@",error);
    else
    {
        result = [request responseString];
    }
    return  result;
}

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

@end

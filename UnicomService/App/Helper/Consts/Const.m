//
//  Const.m
//  UnicomService
//  URL常量类
//  Created by 老邢 Thierry on 13-1-14.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "Const.h"
@implementation Const

//登陆URL
+(NSString *) loginUrl
{
    return [self wrapUrl:@"login"];
}

//顶部大图URL
+(NSString *) topImageUrl
{
    return [self wrapUrl:@"getImages"];
}

//系统运行状态
+(NSString *) systemUrl
{
    return [self wrapUrl:@"getSystemState"];
}

+(NSString *) warnListUrl
{
    return [self wrapUrl:@"getWarningList"];
}

+(NSString *) wrapUrl:(NSString *)method
{
    return [USDOMAIN stringByAppendingFormat:@"/application/%@?version=%@",method,VERSION];
}

@end

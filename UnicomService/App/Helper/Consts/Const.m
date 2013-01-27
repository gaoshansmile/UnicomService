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
    return [USDOMAIN stringByAppendingFormat:@"/application/login?version=%@",VERSION];
}

//顶部大图URL
+(NSString *) topImageUrl
{
    return [USDOMAIN stringByAppendingFormat:@"/application/getImages?version=%@",VERSION];
}

//系统运行状态
+(NSString *) systemUrl
{
    return [USDOMAIN stringByAppendingFormat:@"/application/getSystemState?version=%@",VERSION];
}

@end

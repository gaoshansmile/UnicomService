//
//  Const.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-14.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "Const.h"
@implementation Const

+(NSString *) serverDomain
{
    return @"http://219.234.181.233:9000";
}

+(NSString *) loginUrl
{
    return [[self serverDomain] stringByAppendingFormat:@"/application/login?version=%@",VERSION];
}

@end

//
//  Const.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-14.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "Const.h"
@implementation Const

+(NSString *) loginUrl
{
    return [USDOMAIN stringByAppendingFormat:@"/application/login?version=%@",VERSION];
}

+(NSString *) topImageUrl
{
    return [USDOMAIN stringByAppendingFormat:@"/application/getImages?version=%@",VERSION];
}

@end

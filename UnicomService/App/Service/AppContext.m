//
//  AppContext.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "AppContext.h"
#import "HttpService.h"

@implementation AppContext
static NSMutableDictionary *beans;

+(void)init {
    beans = [[NSMutableDictionary alloc] init];
//    [beans setObject:[[HttpService alloc] init] forKey:@"HttpService"];
//    [beans setObject:[[JsonParseService alloc] init] forKey:@"JsonParseService"];
}

+(id)getBean:(NSString*)key {
    return [beans objectForKey:key];
}

+(void)setBean:(NSString*)key :(id)value {
    [beans setObject:value forKey:key];
}

@end

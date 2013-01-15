//
//  JsonParseService.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "JsonParseService.h"
#import "AppDelegate.h"

@implementation JsonParseService

+(User *)parseLogin:(NSString *)response
{
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    User *user =(User *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[app managedObjectContext]]; 
    return user;
}

@end

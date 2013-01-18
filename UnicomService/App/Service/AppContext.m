//
//  AppContext.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-17.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "AppContext.h"
#import "AppDelegate.h"
#import "User.h"

static NSMutableDictionary *beans;
static BOOL _hasKeyBoard = NO;
@implementation AppContext

+(void)init {
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    User *user =(User *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[app managedObjectContext]];
    beans = [[NSMutableDictionary alloc] init];
    [beans setObject:user forKey:@"CurrentUser"];
//    [beans setObject:[[[MyUserDAO alloc] init] autorelease] forKey:@"MyUserDAO"];
}

+(id)getBean:(NSString*)key {
    return [beans objectForKey:key];
}

+(void)setBean:(NSString*)key :(id)value {
    [beans setObject:value forKey:key];
}

@end

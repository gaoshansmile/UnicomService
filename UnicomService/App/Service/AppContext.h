//
//  AppContext.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppContext : NSObject

+(void)init;
+(id)getBean:(NSString*)key;
+(void)setBean:(NSString*)key :(id)value;

@end

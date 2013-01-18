//
//  JsonParseService.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-15.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "SBJson.h"

@interface JsonParseService : NSObject

+(User *)parseLogin:(NSString *)response;

@end

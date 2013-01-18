//
//  User.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-16.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * token;

@end

//
//  GridItem.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "GridItem.h"

@implementation GridItem
@synthesize title = _title;
@synthesize image = _image;
@synthesize ctrlName = _ctrlName;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image ctrlName:(NSString *)name{
	self = [super init];
	
	if (self) {
        _title=title;
        _image=image;
        _ctrlName=name;
	}
	
	return self;
}

@end

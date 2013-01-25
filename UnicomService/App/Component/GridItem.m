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

- (id)initWithTitle:(NSString *)title image:(UIImage *)image{
	self = [super init];
	
	if (self) {
        _title=title;
        _image=image;
	}
	
	return self;
}

@end

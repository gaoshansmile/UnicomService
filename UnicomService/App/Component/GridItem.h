//
//  GridItem.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridItem : NSObject

@property NSString *title;
@property UIImage *image;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image;
@end

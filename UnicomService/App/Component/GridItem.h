//
//  GridItem.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  九宫格菜单每一项的数据模型
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridItem : NSObject

@property NSString *title;
@property UIImage *image;
@property NSString *ctrlName;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image ctrlName:(NSString *)name;
@end

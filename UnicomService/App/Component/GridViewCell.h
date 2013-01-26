//
//  GridViewCell.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  GirdView Item View
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridViewCell : UIControl

@property UIImage *image;
@property NSString *title;
@property UIImageView *imageView;
@property UILabel *label;

//不能用frame做变量名，否则会覆盖父类的frame，导致坐标错位
@property CGRect usFrame;

//
-(void)initView;
@end

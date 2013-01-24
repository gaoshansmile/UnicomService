//
//  ImageFlowView.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor-RGB.h"

@interface ImageFlowView : UIView<UIScrollViewDelegate>

@property UIPageControl *pageControl;
@property NSMutableArray *imageLinks;
@property NSInteger currentImageIndex;
@property NSInteger imageCount;
@property UIScrollView *scrollView;
@property NSMutableArray *createdImage;

//初始化
-(id)initWithFrame:(CGRect)frame withImageLinks:(NSMutableArray *)imageLinks;

//加载数据
-(void)reloadView:(NSMutableArray *)imageLinks;

@end

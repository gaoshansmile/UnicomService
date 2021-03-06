//
//  ImageFlowView.h
//  UnicomService
//  可以左右滑动的图片区域
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor-RGB.h"

@interface ImageFlowView : UIView<UIScrollViewDelegate>

@property UIPageControl *pageControl;
@property NSMutableArray *imageLinks;
//当前选中的图片索引
@property NSInteger currentImageIndex;
//图片个数
@property NSInteger imageCount;
@property UIScrollView *scrollView;
//已经生成的图片，作为缓存
@property NSMutableArray *createdImage;

//初始化
-(id)initWithFrame:(CGRect)frame withImageLinks:(NSMutableArray *)imageLinks;

//加载数据
-(void)reloadView:(NSMutableArray *)imageLinks;

@end

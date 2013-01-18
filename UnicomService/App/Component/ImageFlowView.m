//
//  ImageFlowView.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "ImageFlowView.h"

@implementation ImageFlowView

@synthesize pageControl = _pageControl;
@synthesize imageLinks = _imageLinks;
@synthesize currentImageIndex = _currentImageIndex;
@synthesize imageCount = _imageCount;
@synthesize scrollView = _scrollView;

- (id)initWithFrame:(CGRect)frame withImageLinks:(NSMutableArray *)imageLinks
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _currentImageIndex = 0;
        _imageLinks = imageLinks;
        _imageCount = [_imageLinks count];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, frame.size.height)];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * _imageCount, _scrollView.frame.size.height)];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setScrollsToTop:NO];
        [_scrollView setDelegate:self];
        
        _pageControl= [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-20, 320, 20)];
        [_pageControl setPageIndicatorTintColor:[UIColor colorWithHexString:@"#5a5959"]];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithHexString:@"#6c2929"]];
        [_pageControl setCurrentPage:_currentImageIndex];
        [_pageControl setNumberOfPages:[_imageLinks count]];
        
        [self addSubview:_pageControl];
        [self addSubview:_scrollView];
        
        [self fillScrollView];
    }
    return self;
}

-(void)fillScrollView
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
}

-(id)initView
{
    //    _pageControl
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

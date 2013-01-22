//
//  ImageFlowView.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-18.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "ImageFlowView.h"
#import "UIImageView+WebCache.h"

@implementation ImageFlowView

@synthesize pageControl = _pageControl;
@synthesize imageLinks = _imageLinks;
@synthesize currentImageIndex = _currentImageIndex;
@synthesize imageCount = _imageCount;
@synthesize scrollView = _scrollView;
@synthesize createdImage = _createdImage;

- (id)initWithFrame:(CGRect)frame withImageLinks:(NSMutableArray *)imageLinks
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _currentImageIndex = 0;
        _imageLinks = imageLinks;
        _imageCount = [_imageLinks count];
        _createdImage = [[NSMutableArray alloc] init];
        
        for (unsigned i = 0; i < _imageCount; i++)
        {
            [_createdImage addObject:[NSNull null]];
        }
        
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
        
        [self addSubview:_scrollView];
        [self addSubview:_pageControl];
        
        [self loadImage:0];
        [self loadImage:1];
    }
    return self;
}


//加载图片
-(void)loadImage:(int) index
{
    if (index < 0)
        return;
    if (index >= _imageCount)
        return;
    
    UIImageView *imageView = [_createdImage objectAtIndex:index];
    
    if ((NSNull *)imageView == [NSNull null])
    {
        imageView = [[UIImageView alloc] init];
        [_createdImage replaceObjectAtIndex:index withObject:imageView];
        
        NSString *imageLink = [_imageLinks objectAtIndex:index];
        imageLink = [USDOMAIN stringByAppendingString:imageLink];
        
        CGRect frame = _scrollView.frame;
        frame.origin.x = frame.size.width*index;
        frame.origin.y = 0;
        [imageView setFrame:frame];
        [imageView setImageWithURL:[NSURL URLWithString:imageLink]
                  placeholderImage:[UIImage imageNamed:@"t1.png"]];
        
        [_scrollView addSubview:imageView];
    }

    
}


- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadImage:page - 1];
    [self loadImage:page];
    [self loadImage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// 触摸屏幕并拖拽画面，再松开，最后停止时，触发该函数
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging  -  End of Scrolling.");
}
// 滚动停止时，触发该函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating  -   End of Scrolling.");
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

//
//  GridView.m
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import "GridView.h"

@implementation GridView
@synthesize adapter = _adapter;
@synthesize columnCount = _columnCount;
@synthesize itemSize = _itemSize;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _columnCount=3;
        _itemSize=CGSizeMake(80, 100);
    }
    return self;
}

- (void)initView
{
    NSInteger itemCount=[self.adapter gridViewNumberOfItems:self];
    NSInteger boundWidth=self.bounds.size.width;
    NSInteger padding = (boundWidth-(_itemSize.width*_columnCount))/(_columnCount+1);
    NSLog(@"padding%d",padding);
    NSLog(@"itemCount%d",itemCount);
    for (int i=0; i<itemCount; i++) {
        GridItem *item = [self.adapter gridView:self itemForIndex:i];
        
        //计算item所处的行和列
        int colIndex=i%_columnCount;
        int rowIndex=i/_columnCount;
        
        NSLog(@"colIndex%d",colIndex);
        NSLog(@"rowIndex%d",rowIndex);
        //计算坐标便宜量
        int xOffSet = (_itemSize.width+padding)*colIndex+padding;
        int yOffSet = (_itemSize.height+padding)*rowIndex+padding;;
        
        
        NSLog(@"xOffSet%d",xOffSet);
        NSLog(@"yOffSet%d",yOffSet);
        NSLog(@"----------------------------------------------------");
        
        GridViewCell *cell = [[GridViewCell alloc] initWithFrame:CGRectMake(xOffSet, yOffSet, _itemSize.width, _itemSize.height)];
        cell.image=item.image;
        cell.title=item.title;
        cell.tag = i;
        [cell addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [cell initView];
        [self addSubview:cell];
    }
}

-(void) itemPressed:(UIControl *)sender
{
    [self.adapter gridView:self didSelectItemAtIndex:[sender tag]];
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

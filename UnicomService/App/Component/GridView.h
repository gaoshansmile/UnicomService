//
//  GridView.h
//  UnicomService
//
//  Created by 老邢 Thierry on 13-1-25.
//  Show Gridview in iOS
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridViewCell.h"
#import "GridItem.h"

@class GridView;
@protocol GridAdapter <NSObject>

@required
- (NSUInteger)gridViewNumberOfItems:(GridView *)gridView;
- (GridItem *)gridView:(GridView *)gridView itemForIndex:(NSUInteger)index;
- (void)gridView:(GridView *)menuView didSelectItemAtIndex:(NSUInteger)index;

@end

@interface GridView : UIView
@property NSUInteger columnCount; // default is 3
@property CGSize itemSize; // default is 80x100.
@property id<GridAdapter> adapter;

- (void)initView;

@end



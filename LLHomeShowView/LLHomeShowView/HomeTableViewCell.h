//
//  HomeTableViewCell.h
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UITableViewCell;
@class UICollectionViewCell;
@class HomeTableViewCell;

@protocol HomeTableViewCellDelegate <NSObject>

- (void)homeTableViewCell:(HomeTableViewCell *)cell withScrollViewHeight:(CGFloat)scrollViewHeight;


- (void)homeTableViewCell:(UITableViewCell *)cell subViewCellOnClickedIndex:(NSIndexPath *)indexPath;

- (void)homeCollectionViewCell:(UICollectionViewCell *)cell subViewCellOnClickedIndex:(NSIndexPath *)indexPath;



@end

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,assign) id<HomeTableViewCellDelegate> delegate;

@property (nonatomic,assign) CGFloat leftTableViewCellHeight;

@end

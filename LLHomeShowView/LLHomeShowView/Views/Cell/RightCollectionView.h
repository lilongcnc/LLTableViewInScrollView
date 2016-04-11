//
//  RightCollectionView.h
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightCollectionView : UIView

//内部把这个高度一定计算好
@property (nonatomic,assign) CGFloat collectionViewHeight;


@property (nonatomic,copy) void(^rightCollectionViewCellOnClick)(UICollectionViewCell *cell,NSIndexPath *indexPath);

@end

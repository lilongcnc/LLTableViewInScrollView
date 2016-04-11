//
//  LeftTableView.h
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LeftTableView : UIView

@property (nonatomic,strong) UITableView *tableView;

//内部把这个高度一定计算好
@property (nonatomic,assign) CGFloat tableViewHeight;

@property (nonatomic,copy) void(^leftTableViewCellOnClick)(UITableViewCell *cell,NSIndexPath *indexPath);

@end

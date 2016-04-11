//
//  ViewController.m
//  LLHomeShowView
//
//  Created by 李龙 on 16/4/11.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "config.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HomeTableViewCellDelegate>{
    CGFloat tableViewCellgheight;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

static NSString *const cellID = @"HomeTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell高度
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.allowsSelection = NO;
    self.tableView.tableFooterView = [UIView new];
}


#pragma mark UITableViewDataSourece
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    NSLog(@"%s",__FUNCTION__);
    
    tableViewCellgheight = cell.leftTableViewCellHeight; //设置的cell高度
    cell.delegate = self;
    cell.textLabel.text = @"cell";
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}


//如果重写了这个方法之后,那么自定义Cell中的layoutSubViews这个方法会再调用一次
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return tableViewCellgheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadData];
}


#pragma mark HomeTableViewCellDelegate
-(void)homeTableViewCell:(HomeTableViewCell *)cell withScrollViewHeight:(CGFloat)scrollViewHeight{
    tableViewCellgheight = scrollViewHeight;
    LxDBAnyVar(tableViewCellgheight);
    [self.tableView reloadData];
}

-(void)homeTableViewCell:(UITableViewCell *)cell subViewCellOnClickedIndex:(NSIndexPath *)indexPath{
    LxDBAnyVar(indexPath.section);
    LxDBAnyVar(indexPath.row);
}


-(void)homeCollectionViewCell:(UICollectionViewCell *)cell subViewCellOnClickedIndex:(NSIndexPath *)indexPath{
    LxDBAnyVar(indexPath.section);
    LxDBAnyVar(indexPath.row);
    
}


//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    LxDBAnyVar(scrollView.contentOffset);
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

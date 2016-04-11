//
//  LeftTableView.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "LeftTableView.h"
#import "config.h"
@interface LeftTableView ()<UITableViewDelegate,UITableViewDataSource>

@end


@implementation LeftTableView

static NSString *const CellID = @"CellID";
static CGFloat const tableViewCellHeight = 40.f;
static CGFloat const tableHeaderViewHeight = 20.f;
static CGFloat const tableFooterViewHeight = 20.f;
static int const tableViewRowOfNumber= 6;
static int const tableViewSectionOfNumber= 3;

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        NSLog(@"%s",__FUNCTION__);
        
        [self initSubViews];
        
    }
    return self;
}


-(void)awakeFromNib{
//    NSLog(@"%s",__FUNCTION__);
}


- (void)initSubViews{
    //TODO 这里实际是应该用for计算每个sectin下的rowNum,每个section下的row是不固定的,而且sectionHeader有的话,高度也需要考虑进去
    _tableViewHeight = (tableHeaderViewHeight+tableFooterViewHeight)*tableViewSectionOfNumber + tableViewSectionOfNumber*tableViewRowOfNumber*tableViewCellHeight;
    
    
    _tableView = ({
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LLkeyWindowsSize.width, _tableViewHeight) style:UITableViewStyleGrouped];//UITableViewStylePlain
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = NO;

        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
        [self addSubview:tableView];
        
//        LxDBAnyVar(tableView);
        
        tableView;
    });
}


#pragma mark UItableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return tableViewSectionOfNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableViewRowOfNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"LeftTableView:%zd",indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return tableViewCellHeight;
}


#pragma mark 添加headerView和footerView
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return tableHeaderViewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return tableFooterViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LLkeyWindowsSize.width, tableHeaderViewHeight)];
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:headerView.bounds];
    tipLabel.text = [NSString stringWithFormat:@"第%zd个secion的顶部",section];
    tipLabel.textColor = [UIColor redColor];
    tipLabel.backgroundColor = [UIColor purpleColor];
    [headerView addSubview:tipLabel];
    return headerView;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LLkeyWindowsSize.width, tableFooterViewHeight)];
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:footerView.bounds];
    tipLabel.text = [NSString stringWithFormat:@"第%zd个secion的底部",section];
    tipLabel.backgroundColor = [UIColor brownColor];
    [footerView addSubview:tipLabel];
    return footerView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"LeftTableView 点击了 %zd-------%zd",indexPath.section,indexPath.row);
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (!_leftTableViewCellOnClick)  return;
    _leftTableViewCellOnClick(cell,indexPath);
}


@end


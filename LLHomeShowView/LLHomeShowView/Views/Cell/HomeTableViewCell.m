//
//  HomeTableViewCell.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "config.h"
#import "LeftTableView.h"
#import "RightCollectionView.h"


@interface HomeTableViewCell ()<UIScrollViewDelegate>{
    NSInteger currentPageIndex;
    BOOL modifyFlag;
}

@property (nonatomic,strong) UILabel *myLbale;

@property (nonatomic,strong) UIView *myADView;
@property (nonatomic,strong) LeftTableView *leftView;
@property (nonatomic,strong) RightCollectionView *rightView;
@property (nonatomic,strong) UIButton *leftMenuBtn;
@property (nonatomic,strong) UIButton *rightMenuBtn;
@property (nonatomic,strong) UIScrollView *myScrollView;

@property (nonatomic,strong) NSMutableArray *myScrollSubViews;



@end


@implementation HomeTableViewCell

- (NSMutableArray *)myScrollSubViews
{
    if (!_myScrollSubViews) {
        _myScrollSubViews = [[NSMutableArray alloc] init];
    }
    return _myScrollSubViews;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _myADView = ({
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [self addSubview:view];
            view;
        });
        
        
        _leftMenuBtn = ({
            UIButton *btn = [UIButton new];
            [btn setTitle:@"音乐" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor greenColor];
            [self addSubview:btn];
            btn;
        });
    
        _rightMenuBtn = ({
            UIButton *btn = [UIButton new];
            [btn setTitle:@"电影" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor blueColor];
            [self addSubview:btn];
            btn;
        });
        
        
        _myScrollView = ({
        
            UIScrollView *scrollView = [UIScrollView new];
            scrollView.backgroundColor = [UIColor cyanColor];
            scrollView.pagingEnabled = YES;
            scrollView.delegate = self;
            scrollView.bounces = NO;
            [self addScrollViewSubViews:scrollView];//添加子控件
            
            [self addSubview:scrollView];
            scrollView;
        
        });
        
        
    }
    
    return self;
}


- (void)addScrollViewSubViews:(UIScrollView *)scrollView{
    
    _leftView = ({
        LeftTableView *leftView = [LeftTableView new];
        leftView.backgroundColor = [UIColor lightGrayColor];
        
        LxDBAnyVar( leftView.tableView.contentSize.height);
        
        [scrollView addSubview:leftView];
        leftView;
    });
    
    @LLWeakObj(self);
    [_leftView setLeftTableViewCellOnClick:^(UITableViewCell *cell, NSIndexPath *indexPath) {
        @LLStrongObj(self);
        if ([self.delegate respondsToSelector:@selector(homeTableViewCell:subViewCellOnClickedIndex:)]) {
            [self.delegate homeTableViewCell:cell subViewCellOnClickedIndex:indexPath];
        }
    }];
    
    
    
    _rightView = ({
        RightCollectionView *rightView = [RightCollectionView new];
        rightView.backgroundColor = [UIColor yellowColor];
        
        [scrollView addSubview:rightView];
        rightView;
    });
    
    
    [_rightView setRightCollectionViewCellOnClick:^(UICollectionViewCell *cell, NSIndexPath *indexPath) {
        @LLStrongObj(self);
        if ([self.delegate respondsToSelector:@selector(homeCollectionViewCell:subViewCellOnClickedIndex:)]) {
            [self.delegate homeCollectionViewCell:cell subViewCellOnClickedIndex:indexPath];
        }
    }];
    
    
    [self.myScrollSubViews addObject:_leftView];
    [self.myScrollSubViews addObject:_rightView];
    

}




-(void)layoutSubviews{
    [super layoutSubviews];
//    NSLog(@"%s",__FUNCTION__);
    
    
    _myADView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, 180);
    _leftMenuBtn.frame = CGRectMake(0, _myADView.buttom, LLkeyWindowsSize.width*0.5, 40);
    _rightMenuBtn.frame = CGRectMake(_leftMenuBtn.right, _myADView.buttom, LLkeyWindowsSize.width*0.5, 40);
    LxDBAnyVar(_leftMenuBtn.frame);
    
    //设置scrolView部分的frame
    //保证只执行一次
    NSLog(@"%s",__FUNCTION__);
    if (!modifyFlag) {
        modifyFlag = YES;
        [self modifyScrollViewframe];
    }
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollView.point: %@",NSStringFromCGPoint(scrollView.contentOffset));
    //取得scrollView滚动的位置
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat imgWidth = self.myScrollView.frame.size.width;
    //超过视图一半的宽度判断为下一页
    NSInteger index = (offsetX + imgWidth * 0.5) / imgWidth;//宽为375
//    NSLog(@"scroll to page Index : %zd",currentPageIndex);
    
    
    if (currentPageIndex != index) {
//            NSLog(@"%s",__FUNCTION__);
        currentPageIndex = index;
        [self modifyScrollViewframe];
    }
    
//    [self.options scrollOptionToIndex:index];
}


- (void)modifyScrollViewframe{
    LxDBAnyVar(@"--------------------------------------------------------");
    LxDBAnyVar(currentPageIndex);
    
    CGFloat viewHeight = 0.0;
    
    switch (currentPageIndex) {
        case 0:{
            
            viewHeight = _leftView.tableViewHeight;
            
            break;
        }
        case 1:{
            

            viewHeight = _rightView.collectionViewHeight;
            break;
        }
        case 2:{
            
            break;
        }
            
        default:
            break;
    }
    

    
    LxDBAnyVar(viewHeight);
    viewHeight += CGRectGetMaxY(_leftMenuBtn.frame);
    viewHeight = viewHeight< LLkeyWindowsSize.height?LLkeyWindowsSize.height:viewHeight;
    _leftTableViewCellHeight = viewHeight;
    
    _myScrollView.frame = CGRectMake(0, _leftMenuBtn.buttom, LLkeyWindowsSize.width, viewHeight);
    _myScrollView.contentSize = CGSizeMake(LLkeyWindowsSize.width*2, viewHeight);
    
    _leftView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, _leftView.tableViewHeight);
    _rightView.frame = CGRectMake(LLkeyWindowsSize.width, 0, LLkeyWindowsSize.width, _rightView.collectionViewHeight);

    //通知更新控制器cell高度
    if ([self.delegate respondsToSelector:@selector(homeTableViewCell:withScrollViewHeight:)]) {
        [self.delegate homeTableViewCell:self withScrollViewHeight:viewHeight]; //这里需要加上cell中其他部分的高度
    }
    
}


@end

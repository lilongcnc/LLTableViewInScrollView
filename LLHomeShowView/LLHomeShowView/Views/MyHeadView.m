//
//  MyHeadView.m
//  test2
//
//  Created by lauren on 15/6/17.
//  Copyright (c) 2015年 CZ. All rights reserved.
//

#import "MyHeadView.h"

@interface MyHeadView ()
@property (weak, nonatomic) IBOutlet UIView *headTitleView;
@property (weak, nonatomic) IBOutlet UILabel *headerTitleLabel;
@end


@implementation MyHeadView


-(void)setHeadTitle:(NSString *)headTitle{
    _headTitle = headTitle;
    self.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:182.0/255.0 blue:175.0/255.0 alpha:1];
    self.headTitleView.layer.cornerRadius = 5;
    self.headTitleView.layer.masksToBounds = YES;
    self.headerTitleLabel.text = headTitle;
}



- (void)awakeFromNib {
    // Initialization code
}

@end

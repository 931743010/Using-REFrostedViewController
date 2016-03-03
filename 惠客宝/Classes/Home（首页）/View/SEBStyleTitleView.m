//
//  SEBStyleTitleView.m
//  商E宝
//
//  Created by 薛银亮 on 16/2/2.
//  Copyright © 2016年 Neighbours. All rights reserved.
// 

#import "SEBStyleTitleView.h"

@implementation SEBStyleTitleView

+(instancetype)styleTitleView:(NSString *)titleString frame:(CGRect)frame
{
    return [[SEBStyleTitleView alloc]initWithString:titleString frame:frame];
}

-(instancetype)initWithString:(NSString *)titleString frame:(CGRect)frame
{
    self = [[SEBStyleTitleView alloc]initWithFrame:frame];
    UIFont *font = [UIFont systemFontOfSize:13];
    self.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SEBMaxMargin * 2, 0, self.width / 4.0, 30.0)];
    titleLabel.text = titleString;
    titleLabel.font=font;
    titleLabel.textColor = [UIColor getColor:@"2c2c2c"];

    UIButton *more = [[UIButton alloc]initWithFrame:CGRectMake(self.width - SEBMaxMargin * 2 - 50, 0, 50, 30.0)];
    [more setTitle:@"更多" forState:UIControlStateNormal];
    more.titleLabel.font = font;
    [more setTitleColor:[UIColor getColor:@"268ee7"] forState:UIControlStateNormal];
    self.moreButton = more;
    CGFloat lineViewHeight = 1;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 30.0, SCREEN_WIDTH, lineViewHeight)];
    lineView.backgroundColor = [UIColor getColor:@"dcdcdc"];
    
    [self addSubview:lineView];
    [self addSubview:titleLabel];
    [self addSubview:more];
    return  self;
}


@end

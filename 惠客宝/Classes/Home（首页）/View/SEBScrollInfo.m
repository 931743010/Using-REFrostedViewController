//
//  SEBScrollInfo.m
//  商E宝
//
//  Created by 薛银亮 on 16/2/1.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "SEBScrollInfo.h"

@implementation SEBScrollInfo

+(instancetype)scrollInfoWithString:(NSString *)infoString withFrame:(CGRect)frame
{
    return [[SEBScrollInfo alloc]initWithString:infoString withFrame:frame];
}

-(instancetype)initWithString:(NSString *)string withFrame:(CGRect)frame
{
    self = [[SEBScrollInfo alloc]initWithFrame:frame];
    CGFloat lineViewHeight = 1;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, lineViewHeight)];
    lineView.backgroundColor = [UIColor getColor:@"dcdcdc"];
    [self addSubview:lineView];
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(lineView.frame), frame.size.width/4.0, frame.size.height - lineViewHeight)];

    iconImageView.image = LOADResourceIMAGE(@"滚动消息");
    [self addSubview:iconImageView];
    
    CGSize stringSize = [NSString sizeWithText:string andFont:[UIFont systemFontOfSize:13] andMaxSize:CGSizeMake(frame.size.width/4.0*3.0, frame.size.height)];
    UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame) + SEBMaxMargin, lineViewHeight, stringSize.width,  frame.size.height - lineViewHeight)];
    infoLabel.textColor = [UIColor getColor:@"888888"];
    infoLabel.font = [UIFont systemFontOfSize:13];
    infoLabel.text = string;
    [self addSubview:infoLabel];
    return self;
}

-(void)onTapBtnView:(UITapGestureRecognizer*)sender{
    if ([self.delegate conformsToProtocol:@protocol(SEBScrollInfoDelegate)]&&[self.delegate respondsToSelector:@selector(scrollInfoClick)]) {
        [self.delegate scrollInfoClick];
    }
}
@end

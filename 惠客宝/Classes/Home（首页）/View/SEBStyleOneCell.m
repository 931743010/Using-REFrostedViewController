//
//  SEBStyleOneCell.m
//  商E宝
//
//  Created by 薛银亮 on 16/2/2.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "SEBStyleOneCell.h"
#import "SEBCommendProductObject.h"
#import "SEBCommendProductView.h"
#import "SEBStyleTitleView.h"

@implementation SEBStyleOneCell

+ (instancetype)cellWithTableView:(UITableView *)tableView dataArray:(NSArray *)dataArray
{
    static NSString *styleCellID = @"styleCellID";
    SEBStyleOneCell *cell = [tableView dequeueReusableCellWithIdentifier:styleCellID];
    if (cell == nil) {
        cell = [[SEBStyleOneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:styleCellID dataArray:dataArray];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        SEBStyleTitleView *styleTitleView = [SEBStyleTitleView styleTitleView:@"产品推荐" frame:CGRectMake(0, 0, self.width, 30.0)];
        [styleTitleView.moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:styleTitleView];

        for (int i = 0; i < dataArray.count; i ++) {
            CGRect frame = CGRectMake(i*(SCREEN_WIDTH-2)/2 + 2*i, styleTitleView.height, (SCREEN_WIDTH-2)/2, 120.0);
            SEBCommendProductView *commendProductView = [[SEBCommendProductView alloc]initWithFrame:frame productObject:dataArray[i]];
            commendProductView.tag = 100 + i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapCommendProductView:)];
            [commendProductView addGestureRecognizer:tap];
            [self addSubview:commendProductView];
        }
    }
    return  self;
}

/**
 * 产品被点击
 *
 */
-(void)onTapCommendProductView:(UIGestureRecognizer *)sender
{
    if ([self.delegate conformsToProtocol:@protocol(SEBStyleOneCellDelegate)]&&[self.delegate respondsToSelector:@selector(commendProductClick:)])
    {
        [self.delegate commendProductClick:(NSInteger)sender.view.tag];
    }
}

/**
 *  更多被点击
 */
-(void)moreButtonClick:(UIButton *)sender
{
    if ([self.delegate conformsToProtocol:@protocol(SEBStyleOneCellDelegate)] && [self.delegate respondsToSelector:@selector(didMoreButtonClick:indexPath:)]) {
        [self.delegate didMoreButtonClick:sender indexPath:self.indexpath];
    }
}


@end

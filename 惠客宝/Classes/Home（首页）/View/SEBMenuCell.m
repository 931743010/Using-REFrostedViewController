//
//  SEBMenuCell.m
//  商E宝
//
//  Created by 薛银亮 on 16/2/1.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "SEBMenuCell.h"
#import "SEBMenuButtonView.h"

@interface SEBMenuCell()<UIScrollViewDelegate>
@property (nonatomic , strong)UIView *firstBgView;
@end

@implementation SEBMenuCell

+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray
{
    static NSString *menuID = @"menuID";
    SEBMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    if (cell == nil) {
        cell = [[SEBMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID menuArray:menuArray];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSArray *)menuArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _firstBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        scrollView.delegate = self;
        //设置scrollView的滚动大小
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 180);
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        [scrollView addSubview:_firstBgView];
        [self addSubview:scrollView];
        //创建8个
        for (int i = 0; i < 8; i++) {
            if (i < 4) {
                CGRect frame = CGRectMake(i*SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                SEBMenuButtonView *btnView = [[SEBMenuButtonView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_firstBgView addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBtnView:)];
                [btnView addGestureRecognizer:tap];
                
            }else if(i<8){
                CGRect frame = CGRectMake((i-4)*SCREEN_WIDTH/4, 80, SCREEN_WIDTH/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                SEBMenuButtonView *btnView = [[SEBMenuButtonView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_firstBgView addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }
        }
        
    }
    return  self;
}

-(void)onTapBtnView:(UITapGestureRecognizer*)sender{
    if ([self.delegate conformsToProtocol:@protocol(SEBMenuCellDelegate)]&&[self.delegate respondsToSelector:@selector(homeMenuCellClick:)]) {
        [self.delegate homeMenuCellClick:(NSInteger)sender.view.tag];
    }
}

@end

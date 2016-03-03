//
//  SEBPreferentialCell.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/4.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  SEBTraderCellDelegate;
@interface SEBTraderCell : UITableViewCell
@property(weak, nonatomic)id<SEBTraderCellDelegate> delegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView dataArray:(NSArray *)dataArray;
@property (nonatomic , strong) NSIndexPath *indexpath;
@end

@protocol  SEBTraderCellDelegate <NSObject>
@optional
//产品被点击
-(void)commendProductClick:(long)sender;
//更多被点击
-(void)didMoreButtonClick:(UIButton *)button indexPath:(NSIndexPath *)indexpath;
@end
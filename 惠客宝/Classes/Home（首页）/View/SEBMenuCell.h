//
//  SEBMenuCell.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/1.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SEBMenuCellDelegate;

@interface SEBMenuCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;
@property(nonatomic, weak)id <SEBMenuCellDelegate >delegate;
@end

@protocol  SEBMenuCellDelegate <NSObject>
@optional
-(void)homeMenuCellClick:(long)sender;
@end
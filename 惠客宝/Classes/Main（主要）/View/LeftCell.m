//
//  LeftCell.m
//  商E宝
//
//  Created by 薛银亮 on 16/1/25.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "LeftCell.h"
#import "Masonry.h"
#import "LeftObject.h"


@interface LeftCell()
@property(strong, nonatomic)UIImageView *leftImageView;
@property(strong, nonatomic)UILabel *leftLabel;

@end
@implementation LeftCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"leftCell";
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        cell = [[LeftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor blueColor];
        UIImageView *iconImage = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImage];
        self.leftImageView = iconImage;
        
        UILabel *nameLabel = [[UILabel alloc] init];
         nameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        nameLabel.textColor = [UIColor getColor:@"2c2c2c"];
         [self.contentView addSubview:nameLabel];
         self.leftLabel = nameLabel;
        
        UIImageView *arrowImage = [[UIImageView alloc]initWithImage:LOADResourceIMAGE(@"设置箭头")];
        [self.contentView addSubview:arrowImage];
        
        __weak typeof(self) weakSelf = self;
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.mas_left).with.offset(20);
            make.centerY.equalTo(weakSelf);
            make.size.mas_equalTo(CGSizeMake(24.5, 24.5));
        }];
        
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.leftImageView.mas_right).with.offset(10);
            make.centerY.equalTo(weakSelf.leftImageView);
        }];
        
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.mas_right).with.offset(-20);
            make.centerY.equalTo(weakSelf.leftImageView);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
    }
    return self;
}

-(void)setLeftObject:(LeftObject *)leftObject
{
    _leftObject = leftObject;
    self.leftLabel.text = _leftObject.title;
    self.leftImageView.image = [UIImage imageNamed:_leftObject.icon];
}


@end

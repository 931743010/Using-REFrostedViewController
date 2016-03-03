//
//  SEBHeaderView.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/13.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBHeaderView.h"
#import "Masonry.h"

@implementation SEBHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat imageViewWH = 60.0f;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SEBMaxMargin, 0, imageViewWH, imageViewWH)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"guide01"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = self.height / 2.0f;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 2.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + SEBMaxMargin, SEBSmallMargin, 0, 24)];
        nameLabel.text = @"商联帮支付";
        nameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.textColor = [UIColor grayColor];
        [nameLabel sizeToFit];
        nameLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(nameLabel.x, CGRectGetMaxY(imageView.frame) - 12, 0, 12)];
        detailLabel.text = @"我是阳光";
        detailLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.textColor = [UIColor grayColor];
        [detailLabel sizeToFit];
        detailLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(SEBMaxMargin, self.height+SEBSmallMargin, self.width - SEBMaxMargin, 1)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:imageView];
        [self addSubview:nameLabel];
        [self addSubview:detailLabel];
        [self addSubview:lineView];

        
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nameLabel.mas_left).with.offset(0);
            make.bottom.equalTo(imageView.mas_bottom).with.offset(-SEBSmallMargin);
        }];
    }
    return  self;
}

@end

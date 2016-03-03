//
//  SEBCommendProductView.m
//  商E宝
//
//  Created by 薛银亮 on 16/2/2.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "SEBCommendProductView.h"
#import "SEBCommendProductObject.h"

@implementation SEBCommendProductView

-(instancetype)initWithFrame:(CGRect)frame productObject:(SEBCommendProductObject *)productObject
{
    _productObject = productObject;
    if (self = [super initWithFrame:frame]) {
        //左边图片文字
        UIView *leftBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (self.width-1) / 2.0, self.height)];
        CGFloat titleLableH =  leftBackground.width / 4.0;
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, SEBMaxMargin, leftBackground.width, titleLableH)];
        titleLable.text = _productObject.name;
        titleLable.textColor = [UIColor getColor:@"cf3b3b3"];
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont systemFontOfSize:13];
        [leftBackground addSubview:titleLable];
        [self addSubview:leftBackground];
        
        CGFloat imageViewWH =  leftBackground.width * 3.0 / 4.0;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((leftBackground.width/2.0)-(imageViewWH / 2.0), SEBSmallMargin+CGRectGetMaxY(titleLable.frame), imageViewWH, imageViewWH)];
        imageView.image = LOADResourceIMAGE(_productObject.productImageString);
        [leftBackground addSubview:imageView];
        //右边文字
        UIView *rightBackground = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftBackground.frame), 0, (self.width-1) / 2.0, self.height)];
        //比例
        UILabel *scaleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLable.frame) , rightBackground.width, titleLableH)];
        scaleLabel.text = _productObject.scale;
        scaleLabel.textColor = [UIColor getColor:@"cf3b3b"];
        scaleLabel.font = [UIFont systemFontOfSize:18];
        scaleLabel.textAlignment = NSTextAlignmentLeft;
        [rightBackground addSubview:scaleLabel];
        //比例名字
        UILabel *scaleNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scaleLabel.frame) + SEBSmallMargin / 2.0, rightBackground.width, titleLableH)];
        scaleNameLabel.text = _productObject.scaleName;
        scaleNameLabel.textColor = [UIColor getColor:@"2c2c2c"];
        scaleNameLabel.font = [UIFont systemFontOfSize:12];
        scaleNameLabel.textAlignment = NSTextAlignmentLeft;
        [rightBackground addSubview:scaleNameLabel];
        // 时间期限
        UILabel *timeLimitLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scaleNameLabel.frame) + SEBSmallMargin / 2.0, rightBackground.width, titleLableH)];
        timeLimitLabel.text = _productObject.timeLimit;
        timeLimitLabel.textColor = [UIColor getColor:@"888888"];
        timeLimitLabel.font = [UIFont systemFontOfSize:12];
        timeLimitLabel.textAlignment = NSTextAlignmentLeft;
        [rightBackground addSubview:timeLimitLabel];
        
        [self addSubview:rightBackground];
        
        //中间分割线
        UIView *amongLine = [[UIView alloc]initWithFrame:CGRectMake(self.width - 1,0 , 1, self.height)];
        amongLine.backgroundColor = [UIColor getColor:@"dcdcdc"];
        [self addSubview:amongLine];
    }
    return self;
}
@end

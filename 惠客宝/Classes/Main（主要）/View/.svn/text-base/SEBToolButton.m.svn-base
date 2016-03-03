//
//  SEBToolButton.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/9.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBToolButton.h"

@implementation SEBToolButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setBackgroundImage:LOADResourceIMAGE(@"ToolButtonBackground") forState:UIControlStateHighlighted];
        [self setBackgroundImage:LOADResourceIMAGE(@"ToolButtonBackgroundImage") forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 图片
    self.imageView.y = self.height * 0.1;
    self.imageView.height = self.height * 0.45;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * 0.5;
    
    // 文字
    self.titleLabel.width = self.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.height = self.height - self.titleLabel.y;
    self.titleLabel.x = 0;

}
@end

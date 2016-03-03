//
//  SEBTabBar.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#define TabBarItemNumber 4
#import "SEBTabBar.h"

@implementation SEBTabBar

/**
 *  重新排布
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.width / TabBarItemNumber;
    int i = 0;
    for (UIView *view in self.subviews) {
        if (![NSStringFromClass([view class]) isEqualToString:@"UITabBarButton"]) continue;
        view.x = i * btnW;
        view.width = btnW;
        i++;
    }
}

@end

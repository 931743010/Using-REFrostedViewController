//
//  UIBarButtonItem+SEBBarButtonItem.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/3.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "UIBarButtonItem+SEBBarButtonItem.h"

@implementation UIBarButtonItem (SEBBarButtonItem)

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)selecter imageStr:(NSString *)imageStr selectedImageStr:(NSString *)selectedImageStr{
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageStr] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    return  [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end

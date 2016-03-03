//
//  SEBApplicationsController.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBApplicationsController.h"

@interface SEBApplicationsController ()

@end

@implementation SEBApplicationsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagesArray= @[@"商户服务", @"kuaifu", @"diancang", @"终端管理"];
    self.titlesArray = @[@"商户服务", @"快付360", @"乐惠通", @"终端管理"];
}

/**
 *  中间的按钮点击
 */
- (void)buttonClick:(SEBToolButton *)button
{
    [self closeWithTask:^{
        if (button.tag == 42) {

        } else {
            
        }
    }];
}

/**
 *  关闭界面
 *
 *  @param task 关闭界面想做的事情
 */
- (void)closeWithTask:(void (^)())task {
    // 关闭控制器
    [self dismissViewControllerAnimated:NO completion:nil];
    !task ? : task();
}

@end

//
//  SEBNavigationController.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBNavigationController.h"
#import "UIViewController+REFrostedViewController.h"

@interface SEBNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SEBNavigationController

+(void)initialize
{
    //导航栏设置
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    NSMutableDictionary *titleDict = [NSMutableDictionary dictionary];
    titleDict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    titleDict[NSForegroundColorAttributeName] = [UIColor getColor:@"268ee7"];
    [navigationBar setTitleTextAttributes:titleDict];
    navigationBar.barTintColor = [UIColor whiteColor];
//    navigationBar.tintColor = [UIColor whiteColor];

    //设置导航按钮   正常状态
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [barItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    //导航按钮瘫痪状态
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barItem setTitleTextAttributes:dictSelected forState:UIControlStateDisabled];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        //在子导航中
        viewController.hidesBottomBarWhenPushed = YES;

//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setTitle:@"返回" forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setTitleColor:SEBColor(251, 32, 37) forState:UIControlStateHighlighted];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateSelected];
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
//        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        [btn sizeToFit];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        //关闭滑动菜单
        [SEBNotificationCenter postNotificationName:@"disableRESideMenu" object:self userInfo:nil];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count > 1) {
        return YES;
    }
    return NO;
}

@end


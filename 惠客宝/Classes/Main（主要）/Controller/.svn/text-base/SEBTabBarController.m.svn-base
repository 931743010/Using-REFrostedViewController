//
//  SEBTabBarController.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBTabBarController.h"
#import "SEBHomeController.h"
#import "SEBGatheringController.h"
#import "SEBConvenientController.h"
#import "SEBApplicationsController.h"
#import "SEBNavigationController.h"
#import "SEBTabBar.h"
#import "UIViewController+REFrostedViewController.h"
#import "REFrostedViewController.h"

@interface SEBTabBarController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>


@end

@implementation SEBTabBarController

- (void)viewDidLoad {
    [SEBNotificationCenter postNotificationName:@"enableRESideMenu" object:self userInfo:nil];
    [super viewDidLoad];
    [self setupTabBarItem];
    [self setupChildControllers];
    [self setValue:[[SEBTabBar alloc]init] forKey:@"tabBar"];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (void)showMenu
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    if (![[sender.view class] isSubclassOfClass:[UINavigationController class]]) {
        [self.frostedViewController panGestureRecognized:sender];
    }
}

/**
 *  设置tabbarItem，也可以将这些放在initialize方法里写。这样可以只执行一次。
 */
-(void)setupTabBarItem
{
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = SEBColor(135, 128, 128);
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    dict2[NSForegroundColorAttributeName] = SEBColor(64, 64, 64);
    dict2[NSFontAttributeName] = dict[NSFontAttributeName];
    [item setTitleTextAttributes:dict2 forState:UIControlStateSelected];
}

/**
 *  添加所有的控制器
 */
-(void)setupChildControllers
{
    [self tabBarItemWithController:[[SEBHomeController alloc]init] title:@"惠客宝" imageString:@"seb-icon-home 2" selectedImageString:@"seb-icon-home"];
    [self tabBarItemWithController:[[SEBGatheringController alloc]init] title:@"收款" imageString:@"seb-icon-gathering 2" selectedImageString:@"seb-icon-gathering"];
    [self tabBarItemWithController:[[SEBConvenientController alloc]init] title:@"便民" imageString:@"seb-icon-convenience 2" selectedImageString:@"seb-icon-convenience"];
    [self tabBarItemWithController:[[SEBApplicationsController alloc]init] title:@"应用" imageString:@"seb-icon-application 2" selectedImageString:@"seb-icon-application"];
}


-(void)tabBarItemWithController:(UIViewController *)controller title:(NSString *)title imageString:(NSString *)imageString selectedImageString:(NSString *)selectedImageString
{
    controller.tabBarItem.image = [UIImage imageNamed:imageString];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageString];
    controller.title = title;

    SEBNavigationController *nav= [[SEBNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
}

@end

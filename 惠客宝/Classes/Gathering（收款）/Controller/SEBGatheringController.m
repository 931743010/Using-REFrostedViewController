//
//  SEBGatheringController.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBGatheringController.h"
#import "SEBCollectionsController.h"
//#import "DataHelper.h"
//#import "CommMacro.h"
//#import "PosViewController.h"
//#import "OperatorManageController.h"

@interface SEBGatheringController ()
//@property(strong, nonatomic)UserInfo *userInfo;
//@property(strong, nonatomic)NSArray *images;
//@property(strong, nonatomic)NSArray *titles;
@end

@implementation SEBGatheringController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
//    [self setupButtons];
}


-(void)setData
{
//    NSArray* uArray=[[DataHelper sharedInstance] selectEntity:@"UserInfo" predicate:nil sort:nil];
//    if (uArray.count>0) {
//        UserInfo *uinfo=[uArray firstObject];
//        self.userInfo = uinfo;
//    }
//    
//    if ([self.userInfo.usrType isEqualToNumber:@1]) {
//        self.imagesArray = @[@"收款", @"余额查询", @"撤销交易", @"E卡包", @"设备管理",@"收银员管理"];
//        self.titlesArray = @[@"收款", @"余额查询", @"撤销交易", @"清单查询", @"设备管理", @"收银员管理"];
//    }else{
//        self.imagesArray = @[@"收款", @"余额查询", @"撤销交易", @"E卡包", @"设备管理"];
//        self.titlesArray = @[@"收款", @"余额查询", @"撤销交易", @"清单查询", @"设备管理"];
//    }
}

/**
 *  功能键设置
 */
//- (void)setupButtons
//{
//   
//    int totalColsCount = 3;
//    CGFloat buttonW = SCREEN_WIDTH / totalColsCount;
//    CGFloat buttonH = buttonW;
//    CGFloat buttonStarY = (SCREEN_HEIGHT - (SEBNavHeight + SEBStatusBarH) - self.tabBarController.tabBar.height) / 3.0f + (SEBNavHeight + SEBStatusBarH) + SEBMaxMargin;
//    for (int i = 0; i < self.images.count; i++) {
//        [self.view addSubview:({
//            SEBToolButton *button = [[SEBToolButton alloc] init];
//            button.tag = i + 20;
//            CGFloat buttonX = (i % totalColsCount) * buttonW + (i % totalColsCount);
//            CGFloat buttonY = buttonStarY + (i / totalColsCount) * buttonH + (i / totalColsCount);
//            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
//            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//            [button setImage:[UIImage imageNamed:self.images[i]] forState:UIControlStateNormal];
//            [button setTitle:self.titles[i] forState:UIControlStateNormal];
//            [self.buttons addObject:button];
//            button;
//        })];
//    }
//}


/**
 *  中间的按钮点击
 */
//- (void)buttonClick:(SEBToolButton *)button
//{
//    UIStoryboard *main=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    NSString *buttonStr = button.titleLabel.text;
//    NSUInteger integer = [self.titlesArray indexOfObject:buttonStr];
//    switch (integer) {
//        case 0:{
//            //收款
//            UIViewController *vc=[main instantiateViewControllerWithIdentifier:KeyBoardVC];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 1:{
//            //余额查询处理
//            PosViewController *vc=[main instantiateViewControllerWithIdentifier:PosVC];
//            vc.opType=3;
//            [vc setTitle:StrBalanQuery];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 2:{
//            //撤销交易
//            //
//            //
//            
//            //
//            break;
//        }
//        case 3:{
//            //清单查询
//            UIViewController *vc=[main instantiateViewControllerWithIdentifier:TransDetailsVC];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 4:{
//            //设备管理
//            UIViewController *vc=[main instantiateViewControllerWithIdentifier:DeviceManageVC];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 5:{
//            //操作员管理
//            OperatorManageController *operatorManageController = [[OperatorManageController alloc]init];
//            operatorManageController.title = StrOperatorManage;
//            [self.navigationController pushViewController:operatorManageController animated:YES];
//            break;
//        }
//        default:
//            break;
//    }
//}


@end

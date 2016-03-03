//
//  SEBHomeController.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//  首页界面

#import "SEBHomeController.h"
#import "SEBMenuCell.h"
#import "SEBGetPlistArray.h"
#import "SEBInfiniteScrollView.h"
#import "SEBScrollInfo.h"
#import "SEBStyleTitleView.h"
#import "SEBStyleOneCell.h"
#import "MJExtension.h"
#import "SEBCommendProductObject.h"
#import "SEBPreferentialObject.h"
#import "SEBPreferentialCell.h"
#import "SEBTraderCell.h"
#import "SEBTabBarController.h"
#import "TestViewController.h"

@interface SEBHomeController ()<UITableViewDelegate,UITableViewDataSource,SEBMenuCellDelegate,SEBStyleOneCellDelegate>
@property(strong, nonatomic)SEBTabBarController *tabBarController;
@property(strong, nonatomic)UITableView *tableView;
@property (nonatomic, strong)NSArray *menuArray;
@property (nonatomic, strong)NSArray *productArray;
@property(strong, nonatomic)NSArray *preferenArray;
@property(strong, nonatomic)NSArray *traderArray;
@end

@implementation SEBHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavgationBar];
    [self setupTableView];
    [self initData];
}

#pragma mark - 设置导航栏
-(void)setupNavgationBar
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    [leftButton setImage:LOADResourceIMAGE(@"设置") forState:UIControlStateNormal];
    [leftButton addTarget:(SEBTabBarController *)self.tabBarController action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    UIImageView *titleImageView = [[UIImageView alloc]initWithImage:LOADResourceIMAGE(@"首页logo")];
    titleImageView.frame = CGRectMake(0, 0, 150, 44);
    titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = titleImageView;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 44);
    [rightButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:LOADResourceIMAGE(@"消息通知_首页") forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
}

-(void)test{
    [self.navigationController pushViewController:[[TestViewController alloc]init] animated:YES];
}
#pragma mark - 设置tableView
-(void)setupTableView
{
    self.tableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withDelegate:self];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = [self setupHeaderView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
}

#pragma mark - headerView
-(UIView *)setupHeaderView
{
    SEBInfiniteScrollView *scrollView = [[SEBInfiniteScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, heightRate(282));
    scrollView.images = @[
                          [UIImage imageNamed:@"banner图"],
                          ];
    //        scrollView.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    //        scrollView.pageControl.pageIndicatorTintColor = [UIColor grayColor];   (SEBNavHeight + SEBStatusBarH)
    scrollView.scrollDirectionPortrait = NO;
    scrollView.delayTime = 6;
    return scrollView;
}
#pragma mark- 初始化数据
-(void)initData
{
    self.menuArray =  [SEBGetPlistArray arrayWithString:@"menuData.plist"];
    self.productArray =  [SEBCommendProductObject mj_objectArrayWithKeyValuesArray:[SEBGetPlistArray arrayWithString:@"productData.plist"]];
    self.preferenArray =  [SEBPreferentialObject mj_objectArrayWithKeyValuesArray:[SEBGetPlistArray arrayWithString:@"preferentialData.plist"]];
    self.traderArray =  [SEBPreferentialObject mj_objectArrayWithKeyValuesArray:[SEBGetPlistArray arrayWithString:@"traderData.plist"]];
}

#pragma mark - SEBMenuCell 菜单按钮被点击
-(void)homeMenuCellClick:(long )sender
{
    NSLog(@"xxx");
}
#pragma mark - SEBStyleOneCell 产品被点击
-(void)commendProductClick:(long)sender
{
    NSLog(@"sender %ld",sender);
}
#pragma mark - 更多按钮被点击
-(void)didMoreButtonClick:(UIButton *)button indexPath:(NSIndexPath *)indexpath
{
    NSLog(@"%ld",indexpath.row);
}

-(void)viewWillAppear:(BOOL)animated
{
    //监听跳转到设置界面
    [SEBNotificationCenter addObserver:self selector:@selector(showUserSettingVC) name:@"showUserSettingVC" object:nil];
}

#pragma mark - tableview delegate && datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma  mark - 行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SEBMenuCell *cell = [SEBMenuCell cellWithTableView:tableView menuArray:self.menuArray];
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == 1)
    {
        SEBStyleOneCell *cell = [SEBStyleOneCell cellWithTableView:tableView dataArray:self.productArray];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 2)
    {
        SEBPreferentialCell *cell = [SEBPreferentialCell cellWithTableView:tableView dataArray:self.preferenArray];
        return cell;
    }else if(indexPath.section == 3)
    {
        SEBTraderCell *cell = [SEBTraderCell cellWithTableView:tableView dataArray:self.traderArray];
        return cell;
    }
    else{
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        return cell;
    }
}

#pragma  mark - 组头部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }else{
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        headerView.backgroundColor = SEBColor(239, 239, 244);
        return headerView;
    }
}

#pragma  mark - 组底部
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        SEBScrollInfo *scrollInfo = [SEBScrollInfo scrollInfoWithString:@"庆元旦有惊喜！1.1元有惊喜。" withFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        return scrollInfo;
    }else{
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
        footerView.backgroundColor = SEBColor(239, 239, 244);
        return footerView;
    }
}

#pragma  mark - 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 180;
    }
    return 151.0;
}

#pragma  mark - 组头部高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return heightRate(58.0);
    }
}

#pragma  mark - 组底部高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return heightRate(96.0);
    }else{
        return 5;
    }
}

@end

//
//  SEBInfiniteScrollView.h
//  商E宝
//
//  Created by 薛银亮 on 15/10/6.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//  无线滚动的广告标语

#import <UIKit/UIKit.h>

@interface SEBInfiniteScrollView : UIView
/**
 *  滚动间隔
 */
@property (nonatomic, assign)NSTimeInterval delayTime;
/**
 *  显示的广告图片
 */
@property (nonatomic, strong) NSArray *images;
/**
 *  页面控制指示器
 */
@property (nonatomic, weak, readonly) UIPageControl *pageControl;
/**
 *  滚动方向，no为横向，yes为竖向
 */
@property (nonatomic, assign, getter = isScrollDirectionPortrait) BOOL scrollDirectionPortrait;
@end

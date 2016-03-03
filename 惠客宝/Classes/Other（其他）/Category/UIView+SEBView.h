//
//  UIView+SEBView.h
//  商E宝
//
//  Created by 薛银亮 on 15/10/2.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SEBView)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

+(instancetype)viewLoadNib;

/** 水平居中 */
- (void)alignHorizontal;

/** 垂直居中 */
- (void)alignVertical;

@end

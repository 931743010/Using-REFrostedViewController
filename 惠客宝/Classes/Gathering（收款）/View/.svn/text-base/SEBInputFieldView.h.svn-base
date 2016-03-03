//
//  SEBInputFieldView.h
//  商E宝
//
//  Created by 薛银亮 on 15/10/19.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SEBInputFieldView;

#pragma mark 监听属性
static NSString *SEBKeyboardDeleteButtonClick = @"SEBKeyboardDeleteButtonClick";
static NSString *SEBKeyboardNumberButtonClick = @"SEBKeyboardNumberButtonClick";
static NSString *SEBKeyboardNumberKey = @"SEBKeyboardNumberKey";

static NSString *SEBInputFieldViewCancleButtonClick = @"SEBInputFieldViewCancleButtonClick";

#pragma mark 代理
@protocol  SEBInputFieldViewDelegate <NSObject>

@optional

/**
 *  点击取消按钮的代理事件
 */
-(void)inputFieldView:(SEBInputFieldView *)inputFieldView cancleButtonClick:(UIButton *)cancleButton;

@end

#pragma mark 属性定义
@interface SEBInputFieldView : UIView

@property(weak, nonatomic)id<SEBInputFieldViewDelegate> delegate;

@end

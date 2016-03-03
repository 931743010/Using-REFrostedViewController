//
//  SEBInputPasswordView.h
//  商E宝
//
//  Created by 薛银亮 on 15/10/19.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SEBInputPasswordView;

@protocol SEBInputPasswordViewDelegate <NSObject>

@optional
/** 输入完成点击确定按钮 */
- (NSString *)finish:(NSString *)pwd;
/** 点击取消按钮 */
-(void)inputPasswordView:(SEBInputPasswordView *)inputPasswordView cancleBtnClick:(UIButton *)cancleBtnClick;
@end

@interface SEBInputPasswordView : UIView

/** 响应者 */
@property (nonatomic, strong) UITextField *responsder;

@property (nonatomic, weak) id<SEBInputPasswordViewDelegate> delegate;

/** 完成的回调block */
@property (nonatomic, copy) void (^finish) (NSString *passWord);

/** 快速创建 */
+ (instancetype)passwordView;

/** 弹出 */
- (void)showInView:(UIView *)view;

/** 键盘退下 */
- (void)hidenKeyboard;

@end

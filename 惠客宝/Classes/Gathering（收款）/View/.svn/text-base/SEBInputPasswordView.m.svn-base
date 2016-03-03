//
//  SEBInputPasswordView.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/19.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#import "SEBInputPasswordView.h"
#import "SEBInputFieldView.h"

@interface SEBInputPasswordView()<UIAlertViewDelegate,SEBInputFieldViewDelegate,UITextFieldDelegate>

/** 输入框 */
@property (nonatomic, strong) SEBInputFieldView *inputView;

/** 蒙板 */
@property (nonatomic, strong) UIButton *coverButton;

/** 返回密码 */
@property (nonatomic, copy) NSString *passWord;

@end
@implementation SEBInputPasswordView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:ScreenBounds];
    if (self) {
        [self setupCover];
        [self setupInputView];
        [self setupResponsder];
    }
    return self;
}

/**
 *  设置蒙板
 */
-(void)setupCover
{
    UIButton *coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
    coverButton.alpha = 0.4;
    coverButton.backgroundColor = [UIColor blackColor];
    [self addSubview:coverButton];
    self.coverButton = coverButton;
}

-(void)setupInputView
{
    SEBInputFieldView *inputView = [[SEBInputFieldView alloc] init];
    inputView.delegate = self;
    [self addSubview:inputView];
    self.inputView = inputView;
    
    /** 注册取消按钮点击的通知 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancle) name:SEBInputFieldViewCancleButtonClick object:nil];
}

-(void)inputFieldView:(SEBInputFieldView *)inputFieldView cancleButtonClick:(UIButton *)cancleButton
{
    if ([_delegate respondsToSelector:@selector(inputFieldView:cancleButtonClick:)]) {
        [_delegate inputPasswordView:self cancleBtnClick:cancleButton];
    }
}

/** 响应者 */
- (void)setupResponsder
{
    UITextField *responsder = [[UITextField alloc] init];
    responsder.delegate = self;
    responsder.keyboardType = UIKeyboardTypeNumberPad;
    
    [self addSubview:responsder];
    self.responsder = responsder;
}

/**
 *  处理字符串 和 删除键
 */
static NSString *tempStr;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (!tempStr) {
        tempStr = string;
    }else{
        tempStr = [NSString stringWithFormat:@"%@%@",tempStr,string];
    }
    
    if ([string isEqualToString:@""]) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:SEBKeyboardDeleteButtonClick object:self];
        
        if (tempStr.length > 0) {   //  删除最后一个字符串
            NSString *cccc = [tempStr substringToIndex:[tempStr length] - 1];
            tempStr = cccc;
        }
        
        //         NSLog(@" 点击了删除键 ---%@",tempStr);
    }else{
        
        if (tempStr.length == 6) {
            //         移除自己
            [self hidenKeyboard:^(BOOL finished) {
                [self removeFromSuperview];
                [self hidenKeyboard:nil];
            }];
            
            // 通知代理\传递密码
            if ([self.delegate respondsToSelector:@selector(finish:)]) {
                [self.delegate finish:tempStr];
            }
            //            // 回调block\传递密码
            if (self.finish) {
                self.finish(tempStr);
            }
            
            tempStr = nil;
        }
        //        NSLog(@"tempStr %@",tempStr);
        
        NSMutableDictionary *userInfoDict = [NSMutableDictionary dictionary];
        userInfoDict[SEBKeyboardNumberKey] = string;
        [[NSNotificationCenter defaultCenter] postNotificationName:SEBKeyboardNumberButtonClick object:self userInfo:userInfoDict];
    }
    return YES;
}

/** 输入框的取消按钮点击 */
- (void)cancle
{
    [self hidenKeyboard:^(BOOL finished) {
        self.inputView.hidden = YES;
        //        [self.countArray removeAllObjects];
        [self removeFromSuperview];
        [self hidenKeyboard:nil];
        [self.inputView setNeedsDisplay];
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /** 蒙板 */
    self.coverButton.frame = self.bounds;
}

/** 键盘弹出 */
- (void)showKeyboard
{
    CGFloat marginTop;
    if (iphone4) {
        marginTop = 42;
    } else if (iphone5) {
        marginTop = 100;
    } else if (iphone6) {
        marginTop = 120;
    } else {
        marginTop = 140;
    }
    
    [self.responsder becomeFirstResponder];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.inputView.transform = CGAffineTransformMakeTranslation(0, marginTop - self.inputView.y);
    } completion:^(BOOL finished) {
    }];
}

/** 键盘退下 */
- (void)hidenKeyboard:(void (^)(BOOL finished))completion
{
    [self.responsder endEditing:NO];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.inputView.transform = CGAffineTransformIdentity;
    } completion:completion];
}

/** 快速创建 */
+ (instancetype)passwordView
{
    return [[self alloc] init];
}

// 关闭键盘
- (void)hidenKeyboard
{
    [self removeFromSuperview];
    [self hidenKeyboard:nil];
}

- (void)showInView:(UIView *)view
{
    // 浮现
    [view addSubview:self];
    
    /** 输入框起始frame */
    self.inputView.height = 180;
    self.inputView.y = (self.height - self.inputView.height) * 0.5;
    self.inputView.width = SCREEN_WIDTH * 0.94375;
    self.inputView.x = (SCREEN_WIDTH - self.inputView.width) * 0.5;
    
    /** 弹出键盘 */
    [self showKeyboard];
}

@end

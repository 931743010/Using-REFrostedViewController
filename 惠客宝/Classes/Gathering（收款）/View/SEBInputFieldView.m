//
//  SEBInputFieldView.m
//  商E宝
//
//  Created by 薛银亮 on 15/10/19.
//  Copyright © 2015年 www.30pay.seb. All rights reserved.
//

#pragma mark 宏
#define SEBInputViewNumCount 6  //密码个数

#import "SEBInputFieldView.h"


#pragma mark 属性
typedef NS_ENUM(NSInteger, SEBInputFieldViewButtonType) {
    SEBInputFieldViewButtonTypeWithCancle = 1000,
    SEBInputFieldViewButtonTypeWithOk = 2000
};

@interface SEBInputFieldView ()
/**数字数组*/
@property(strong, nonatomic)NSMutableArray *numbers;
/** 确定按钮 */
@property (nonatomic, weak) UIButton *okButton;
/** 取消按钮 */
@property (nonatomic, weak) UIButton *cancleButton;
@end


@implementation SEBInputFieldView

#pragma mark 懒加载
-(NSMutableArray *)numbers
{
    if (!_numbers) {
        _numbers = [NSMutableArray array];
    }
    return _numbers;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setupKeyboardNote];
        [self setupSubViews];
    }
    return self;
}


#pragma mark 设置、移除监听
/**
 *  设置自定义的键盘通知
 *  这里监听的name字段：即要监听的属性是自定义的
 */
-(void)setupKeyboardNote
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(delete) name:SEBKeyboardDeleteButtonClick object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(number:) name:SEBKeyboardNumberButtonClick object:nil];
}

/**
 *  移除监听
 */
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark 监听键盘事件
/**
 *  删除一位数字
 */
- (void)delete
{
    [self.numbers removeLastObject];
    [self setNeedsDisplay];
}

/**
 *  点击数字键
 *
 *  @param note 数字键盘
 */
- (void)number:(NSNotification *)note
{
    NSDictionary *userInfo = note.userInfo;
    NSString *numObj = userInfo[SEBKeyboardNumberKey];
    if (numObj.length >= SEBInputViewNumCount) return;
    [self.numbers addObject:numObj];
    [self setNeedsDisplay];
}


/**
 *  添加设置子内容视图
 */
-(void)setupSubViews
{
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cancleButton];
    [cancleButton setBackgroundImage:[UIImage imageNamed:@"zhifu-close"] forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    cancleButton.tag = SEBInputFieldViewButtonTypeWithCancle;
    self.cancleButton = cancleButton;
}

/**
 *  点击取消按钮
 *  同时发出监听点击取消按钮事件
 */
- (void)cancelButtonClick:(UIButton *)button
{
    if (button.tag == SEBInputFieldViewButtonTypeWithCancle) {
        if ([self.delegate respondsToSelector:@selector(inputFieldView:cancleButtonClick:)]) {
            [self.delegate inputFieldView:self cancleButtonClick:button];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:SEBInputFieldViewCancleButtonClick object:self];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat WH = 3*SEBSmallMargin;
    self.cancleButton.width = WH;
    self.cancleButton.height = WH;
    self.cancleButton.x = SEBMaxMargin;
    self.cancleButton.y = SEBMaxMargin;
}

- (void)drawRect:(CGRect)rect
{
    // 画图
    UIImage *bg = [UIImage imageNamed:@"pssword_bg"];
    UIImage *field = [UIImage imageNamed:@"password_in"];
    [bg drawInRect:rect];
    CGFloat x = SCREEN_WIDTH * 0.096875 * 0.5;
    CGFloat y = SCREEN_WIDTH * 0.40625 * 0.5;
    CGFloat w = SCREEN_WIDTH * 0.846875;
    CGFloat h = SCREEN_WIDTH * 0.121875;
    [field drawInRect:CGRectMake(x, y, w, h)];
    
    // 画字
    NSString *title = @"请输入交易密码";
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:SCREEN_WIDTH * 0.053125] andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat titleW = size.width;
    CGFloat titleH = size.height;
    CGFloat titleX = (self.width - titleW) * 0.5;
    CGFloat titleY = SCREEN_WIDTH * 0.03125;
    CGRect titleRect = CGRectMake(titleX, titleY, titleW, titleH);
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:SCREEN_WIDTH * 0.053125];
    attr[NSForegroundColorAttributeName] = SEBColor(102, 102, 102);
    
    [title drawInRect:titleRect withAttributes:attr];
    
    // 画点
    UIImage *pointImage = [UIImage imageNamed:@"yuan"];
    CGFloat pointW = SCREEN_WIDTH * 0.05;
    CGFloat pointH = pointW;
    CGFloat pointY = SCREEN_WIDTH * 0.24;
    CGFloat pointX;
    CGFloat margin = SCREEN_WIDTH * 0.0484375;
    CGFloat padding = SCREEN_WIDTH * 0.045578125;
    
    for (int i = 0; i < self.numbers.count; i++) {
        pointX = margin + padding + i * (pointW + 2 * padding);
        [pointImage drawInRect:CGRectMake(pointX, pointY, pointW, pointH)];
    }
    
    // ok按钮状态
    BOOL statue = NO;
    if (self.numbers.count == SEBInputViewNumCount) {
        statue = YES;
    } else {
        statue = NO;
    }
    self.okButton.enabled = statue;
}


@end

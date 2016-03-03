//
//  UIViewController+XYLViewController.m
//  商E宝
//
//  Created by 薛银亮 on 16/1/22.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "UIViewController+XYLViewController.h"

@implementation UIViewController (XYLViewController)
//获取当前屏幕显示的viewcontroller
-(UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
@end

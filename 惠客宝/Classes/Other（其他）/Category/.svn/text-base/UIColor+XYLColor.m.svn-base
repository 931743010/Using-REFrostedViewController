//
//  UIColor+XYLColor.m
//  商E宝
//
//  Created by 薛银亮 on 16/1/27.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "UIColor+XYLColor.h"

@implementation UIColor (XYLColor)

//将16进制颜色转换成可用
+(UIColor *)getColor:(NSString *)hexColor {
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}
@end

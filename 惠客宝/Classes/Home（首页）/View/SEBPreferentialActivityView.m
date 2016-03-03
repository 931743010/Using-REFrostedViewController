//
//  SEBPreferentialActivityView.m
//  商E宝
//
//  Created by 薛银亮 on 16/2/4.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import "SEBPreferentialActivityView.h"
#import "SEBPreferentialObject.h"

@implementation SEBPreferentialActivityView

-(instancetype)initWithFrame:(CGRect)frame withImageString:(SEBPreferentialObject *)sebPreferentialObject
{
    _preferentialObject = sebPreferentialObject;
    
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 1, self.width, self.height)];
        imageView.image = LOADResourceIMAGE(_preferentialObject.preferentialImageString);
        
        NSLog(@"%@",imageView.image);
        [self addSubview:imageView];
        
        //中间分割线
        UIView *amongLine = [[UIView alloc]initWithFrame:CGRectMake(self.width - 1,0 , 1, self.height)];
        amongLine.backgroundColor = [UIColor getColor:@"dcdcdc"];
        [self addSubview:amongLine];
    }
    return self;
}
@end

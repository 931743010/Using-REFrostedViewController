//
//  SEBCommendProductView.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/2.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SEBCommendProductObject;

@interface SEBCommendProductView : UIView

@property(strong, nonatomic)SEBCommendProductObject *productObject;
-(instancetype)initWithFrame:(CGRect)frame productObject:(SEBCommendProductObject *)productObject;

@end


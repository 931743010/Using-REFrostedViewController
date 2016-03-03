//
//  SEBCommendProductObject.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/2.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEBCommendProductObject : NSObject
/**
 *  名字
 */
@property(copy, nonatomic)NSString *name;
/**
 *  产品图片
 */
@property(copy, nonatomic)NSString *productImageString;
/**
 *  比例
 */
@property(copy, nonatomic)NSString *scale;
/**
 *  比例名字
 */
@property(copy, nonatomic)NSString *scaleName;
/**
 *  时间期限
 */
@property(copy, nonatomic)NSString *timeLimit;

@end

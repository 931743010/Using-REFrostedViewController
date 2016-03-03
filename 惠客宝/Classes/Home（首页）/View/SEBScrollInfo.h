//
//  SEBScrollInfo.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/1.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SEBScrollInfoDelegate;

@interface SEBScrollInfo : UIView
+(instancetype)scrollInfoWithString:(NSString *)infoString withFrame:(CGRect)frame;
@property(nonatomic, weak)id <SEBScrollInfoDelegate >delegate;
@end

@protocol  SEBScrollInfoDelegate <NSObject>
@optional
-(void)scrollInfoClick;
@end
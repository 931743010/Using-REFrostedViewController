//
//  SEBPreferentialActivityView.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/4.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SEBPreferentialObject;
@interface SEBPreferentialActivityView : UIView
@property(strong, nonatomic)SEBPreferentialObject *preferentialObject;
-(instancetype)initWithFrame:(CGRect)frame withImageString:(SEBPreferentialObject *)sebPreferentialObject;
@end

//
//  SEBStyleTitleView.h
//  商E宝
//
//  Created by 薛银亮 on 16/2/2.
//  Copyright © 2016年 Neighbours. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SEBStyleTitleView : UIView
@property(weak, nonatomic)UIButton *moreButton;
+(instancetype)styleTitleView:(NSString *)titleString frame:(CGRect)frame;
@end

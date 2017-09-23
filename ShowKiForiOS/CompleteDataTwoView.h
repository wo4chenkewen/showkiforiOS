//
//  CompleteDataTwoView.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/23.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteDataTwoView : UIView
typedef void(^CompleteDataTwoViewCallBack)(NSInteger tag);

@property (nonatomic, copy)CompleteDataTwoViewCallBack authCallBack;
- (void)title:(NSString *)title titleArray:(NSArray *)titleArray ishave:(BOOL)ishave ;


@end

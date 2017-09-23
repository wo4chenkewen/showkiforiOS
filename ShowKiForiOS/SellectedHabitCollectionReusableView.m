//
//  SellectedHabitCollectionReusableView.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "SellectedHabitCollectionReusableView.h"

@interface SellectedHabitCollectionReusableView()

@end
@implementation SellectedHabitCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0 , 10, self.width , 15) withText:@"早睡" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/2 -3, CGRectGetMaxY(self.titleLabel.frame) + 8, 6, 6)];
        self.iconImageView.backgroundColor = [UIColor grayColor];
        [self.iconImageView.layer setCornerRadius:3];
        [self addSubview:self.titleLabel];
        [self addSubview:self.iconImageView];
    }
    return self;
}
@end

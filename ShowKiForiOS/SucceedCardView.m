//
//  SucceedCardView.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/24.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "SucceedCardView.h"

@interface SucceedCardView()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;

@end

@implementation SucceedCardView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 70, self.width, 40) withText:@"已坚持10天拉" withAlign:NSTextAlignmentCenter withColor:[UIColor colorWithHexString:@"#00C47C"] withFont:[UIFont systemFontOfSize:20]];
        [self addSubview:self.titleLabel];
        self.detailLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), self.width, 40) withText:@"已坚持10天拉" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
        [self addSubview:self.detailLabel];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

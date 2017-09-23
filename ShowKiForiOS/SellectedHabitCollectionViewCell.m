//
//  SellectedHabitCollectionViewCell.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "SellectedHabitCollectionViewCell.h"

@interface SellectedHabitCollectionViewCell()
@property (nonatomic, strong)UILabel *leftLabel;
@property (nonatomic, strong)UILabel *rightLabel;
@end
@implementation SellectedHabitCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.bigButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.bigButton.frame = CGRectMake(0, 5, self.width, self.height - 25);
        self.bigButton.userInteractionEnabled = NO;
        [self.contentView addSubview:self.bigButton];
        
        self.smallButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.smallButton.frame = CGRectMake(5, 5, 8, 8);
        [self.smallButton setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        [self.smallButton setImage:[UIImage imageNamed:@"circle_highlight"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.smallButton];
        self.leftLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0 , CGRectGetMaxY(self.bigButton.frame), self.width , 15) withText:@"早睡" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
        self.rightLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0 , CGRectGetMaxY(self.bigButton.frame), self.width , 15) withText:@"2111人在坚持" withAlign:NSTextAlignmentRight withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.rightLabel];
    }
    return  self;
}


- (void)cellForModel:(NSDictionary *)dic ishave:(BOOL)ishave{
    [self.bigButton setImage:[UIImage imageNamed:dic[@"t"]] forState:UIControlStateNormal];
    self.leftLabel.text = dic[@"s"];
    self.rightLabel.text = dic[@"n"];
    self.smallButton.selected = [dic[@"b"] integerValue];
    if (ishave) {
        self.rightLabel.textAlignment = NSTextAlignmentLeft;
    }
    else{
        self.rightLabel.textAlignment = NSTextAlignmentRight;
    }
    
}


@end

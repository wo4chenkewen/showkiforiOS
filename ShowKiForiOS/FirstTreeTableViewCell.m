//
//  FirstTreeTableViewCell.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "FirstTreeTableViewCell.h"


static const NSInteger kImageViewWidth = 50 ;
@interface FirstTreeTableViewCell()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)UILabel *habitLabel;


@end
@implementation FirstTreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, kImageViewWidth, kImageViewWidth)];
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+20 , CGRectGetMinY(self.iconImageView.frame), 100 , 15) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
        self.contentLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+20 , CGRectGetMaxY(self.titleLabel.frame), 100 , 15) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:12]];
        self.habitLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+20 , CGRectGetMaxY(self.contentLabel.frame) + 5, 100 , 15) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:13]];
        self.selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat y = ( kImageViewWidth + 2*10)/2 -15;
        self.selectedButton.frame = CGRectMake(ScreenWidth - 50, y, 30, 30);
        [self.selectedButton setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        [self.selectedButton setImage:[UIImage imageNamed:@"circle_highlight"] forState:UIControlStateSelected];
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.habitLabel];
        [self.contentView addSubview:self.selectedButton];
        
    }
    return self;
}

//
- (void)cellForModel:(NSDictionary *)dic{
    self.iconImageView.image = [UIImage imageNamed:dic[@"t"]];
    self.titleLabel.text = dic[@"s"];
    self.contentLabel.text = dic[@"n"];
    self.habitLabel.text = dic[@"m"];
    self.selectedButton.selected = [dic[@"lirui"] integerValue];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

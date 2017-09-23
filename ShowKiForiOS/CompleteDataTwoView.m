//
//  CompleteDataTwoView.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/23.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "CompleteDataTwoView.h"

@interface CompleteDataTwoView()

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)NSMutableArray *btnArray;

@end

@implementation CompleteDataTwoView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 0, ScreenWidth, 20) withText:@"你的昵称？" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
        [self addSubview:self.titleLabel];
        self.btnArray = [NSMutableArray array];
    }
    return self;
}
- (void)title:(NSString *)title titleArray:(NSArray *)titleArray ishave:(BOOL)ishave {
    self.titleLabel.text = title;
    CGFloat widthBtn = 80;
    CGFloat spacing = 15;
    CGFloat x = self.width/2 - widthBtn/2 - widthBtn - spacing;
    CGFloat y = HeightScale(30) + CGRectGetMaxY(self.titleLabel.frame);
    CGFloat tag = 100;
    BOOL isYes = YES;
    for (int i = 0; i < titleArray.count; i ++) {
        if (ishave ) {
            tag = 10000;
        }
        if (i >=3 && isYes) {
            isYes = NO;
            y = y + 30 +HeightScale(24);
            x = self.width/2 - widthBtn/2 - widthBtn - spacing;
        }
        UIButton *button = [self createButtonWithFrame:CGRectMake(x , y, widthBtn, 30) text:titleArray[i] tag:i*tag];
        x += (widthBtn+spacing);
        
        if (button.tag == 0) {
            button.selected = YES;
        }
        [self.btnArray addObject:button];
        [self addSubview:button];
    }
}

- (UIButton *)createButtonWithFrame:(CGRect )frame text:(NSString *)text tag:(NSInteger)tag{
    UIButton *habitButton = [CTUIFactory buttonWithTitle:text titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    habitButton.tag = tag;
    habitButton.contentEdgeInsets = UIEdgeInsetsMake(0,0, 0,0);
    [habitButton setBackgroundImage:[UIImage imageNamed:@"wdhy_msg_green"] forState:UIControlStateNormal];
    [habitButton setBackgroundImage:[UIImage imageNamed:@"xdpy_btn_tj"] forState:UIControlStateSelected];
    [habitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [habitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    habitButton.frame = frame;
    return habitButton;
}

- (void)buttonAction:(UIButton *)btn {
    NSInteger i = 100;
    if (btn.tag > 2000) {
        i = 10000;
    }
    for (UIButton *button in self.btnArray) {
        if (btn.tag == button.tag) {
            button.selected = YES;
            self.authCallBack(btn.tag/i);
        }
        else{
            button.selected = NO;
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

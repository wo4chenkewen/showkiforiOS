//
//  MineButton.m
//  ProjectFramework
//
//  Created by Jump on 17/3/3.
//  Copyright © 2017年 Jonny. All rights reserved.
//

#import "MineButton.h"
@interface MineButton ()
{
    CGFloat width;
}

@end

@implementation MineButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setFrame:(CGRect)frame
{
    width = frame.size.width;
    
    self.iconImageView.frame = CGRectMake(0 , 0, width, frame.size.height - 25);
    [self addSubview:_iconImageView];
    
    self.textLabel1.frame = CGRectMake(0 , CGRectGetMaxY(self.iconImageView.frame) + 5, width, 20);
    self.textLabel1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_textLabel1];
    
    
    //调用父类的方法
    [super setFrame:frame];
}



- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0 , 0, width, self.frame.size.height - 25)];
    }
    return _iconImageView;
}



- (UILabel *)textLabel1{
    if (_textLabel1 == nil) {
        self.textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0 , CGRectGetMaxY(self.iconImageView.frame) + 5, width, 20)];
    }
    return _textLabel1;
}


@end

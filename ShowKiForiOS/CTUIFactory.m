//
//  CTUIFactory.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "CTUIFactory.h"
#import <SVProgressHUD.h>
@implementation CTUIFactory

NSString * const CTUIFactoryNilValueDescription = @"一";

NSString *CTUIFactoryStringForValue(NSString *value) {
    return value.length > 0 ? value : CTUIFactoryNilValueDescription;
}

//创建一个label
+(UILabel *)creatLabelInFrame:(CGRect)frame withText:(NSString *)str withAlign:(NSTextAlignment)align withColor:(UIColor*)color withFont:(UIFont *)font
{
    UILabel *label;
    label=[[UILabel alloc]initWithFrame:frame];
    label.text=str;
    label.textAlignment=align;
    label.textColor=color;
    label.font=font;
    label.tag = 909;
    label.backgroundColor=[UIColor clearColor];
    label.numberOfLines=NO;
    label.adjustsFontSizeToFitWidth = YES;
    return label;
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIBarButtonItem *)borderNavigationItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (UITextField *)createTextFieldFrame:(CGRect)frame{
    UITextField *textfield = [[UITextField alloc]initWithFrame:frame];
    return textfield;
}

//富文本button
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font tag:(NSInteger)tag target:(id)target action:(SEL)action range:(NSRange)range value:(id)value{
    UIButton *forgetpasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    forgetpasswordButton.frame = frame;
    NSString *str = title;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSUnderlineStyleAttributeName
                    value:value
                    range:range];
    forgetpasswordButton.titleLabel.attributedText = attrStr;
    forgetpasswordButton.titleLabel.font = font;
    forgetpasswordButton.tag = tag;
    forgetpasswordButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [forgetpasswordButton setAttributedTitle:attrStr forState:UIControlStateNormal];
    [forgetpasswordButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return forgetpasswordButton;
}
@end

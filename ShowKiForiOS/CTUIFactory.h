//
//  CTUIFactory.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * const CTUIFactoryNilValueDescription;
extern NSString* CTUIFactoryStringForValue(NSString *value);

@interface CTUIFactory : NSObject

/**
 创建一个label
 */
+ (UILabel *)creatLabelInFrame:(CGRect)frame
                      withText:(NSString *)str
                     withAlign:(NSTextAlignment)align
                     withColor:(UIColor*)color
                      withFont:(UIFont *)font;



+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)borderNavigationItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (UITextField *)createTextFieldFrame:(CGRect)frame;
//富文本button
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font tag:(NSInteger)tag target:(id)target action:(SEL)action range:(NSRange)range value:(id)value;
@end

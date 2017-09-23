//
//  NSString+additions.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (additions)

/**
 *  32位MD5加密
 */
@property (nonatomic,copy,readonly) NSString *md5;
/*
 *
 * 根据字符串计算大小
 * pram Size
 * pram FontSize  字体大小
 * return Size
 */

- (CGSize)sizeWithScopeSize:(CGSize)size fontSize:(CGFloat)fontSize;

/**
 *  字符串关键字变色
 *
 *  @param str   关键字
 *  @param color 颜色
 *
 *  @return 带格式的字符串
 */
- (NSAttributedString *)attributStrWithTargetStr:(NSString *)str color:(UIColor *)color;

/**
 *  判断是否为真实手机号
 *
 *  @param mobile   手机号
 *
 *  @return YES 为真  NO 为假
 */

- (BOOL)validateMobile:(NSString *)mobile;

/**
 *  判断是否为真实手机号
 *
 *  @param mobile   手机号
 *
 *  @return YES 为真  NO 为假
 */

+ (BOOL)isValidateMobile:(NSString *)mobile;

/**
 *  判断是否为Email
 *
 *  @param emailString   邮箱
 *
 *  @return YES 为真  NO 为假
 */
- (BOOL)isAvailableEmail:(NSString *)emailString;

/**
 *  判断字符串是否为空
 *
 *  @param string   要判断的字符串
 *
 *  @return YES 为真  NO 为假
 */
+ (BOOL)isBlankString:(NSString *)string;
@end

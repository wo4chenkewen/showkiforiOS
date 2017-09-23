//
//  ESCheck.m
//  showki
//
//  Created by Kevin.Chen on 17/4/7.
//  Copyright © 2017年 Kevin.Chen. All rights reserved.
//

#import "ESCheck.h"

@implementation ESCheck
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    NSString *pattern = @"^1[3578]+[0-9]{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}


#pragma 正则匹配用户密码 6 - 18 位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

@end

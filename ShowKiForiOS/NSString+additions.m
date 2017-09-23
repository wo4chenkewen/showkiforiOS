//
//  NSString+additions.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "NSString+additions.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (additions)
/**
 *  32位MD5加密
 */
-(NSString *)md5{
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return [result copy];
}


#pragma mark - 根据字符串计算大小
- (CGSize)sizeWithScopeSize:(CGSize)size fontSize:(CGFloat)fontSize
{
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size;
}

#pragma mark -
#pragma mark - 判断是否为真实手机号码

- (BOOL)validateMobile:(NSString *)mobile
{
    // 手机号以13，15，18，147开头，八个 \d 数字字符
    NSString *phoneRegex    = @"^((13[0-9])|(147)|(177)|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13，14， 15，17，18开头，八个 \d 数字字符
    NSString *Regex = @"^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    return [phoneTest evaluateWithObject:mobile];
}


#pragma mark -
#pragma mark - 判断email格式是否正确

- (BOOL)isAvailableEmail:(NSString *)emailString
{
    NSString *emailRegEx =
    
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    //先把NSString转换为小写
    NSString *lowerString       = emailString.lowercaseString;
    
    return [regExPredicate evaluateWithObject:lowerString] ;
    
}

#pragma mark -
#pragma mark - 判断字符串是否为空

+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    // 去掉前后空格，判断length是否为0
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
    {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"null"] || [string isEqualToString:@"(nil)"] ||[string isEqualToString:@"nil"])
    {
        
        return YES;
    }
    return NO;
}

#pragma mark - 字符串变色
- (NSAttributedString *)attributStrWithTargetStr:(NSString *)str color:(UIColor *)color
{
    NSRange range = [self rangeOfString:str];
    NSMutableAttributedString *outStr = [[NSMutableAttributedString alloc] initWithString:self];
    [outStr addAttributes:@{NSForegroundColorAttributeName : color} range:range];
    return outStr;
}

@end

//
//  NSDictionary+DeleteSort.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "NSDictionary+DeleteSort.h"

@implementation NSDictionary (DeleteSort)
//去除  空 和 集合
-(NSDictionary *)deleteObjectsForNullValues{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:self];
    for (id  val in dic.allKeys) {
        if ([[dic objectForKey:val]isEqual:@""]|| [dic objectForKey:val] == nil || [dic objectForKey:val] == [NSNull null] ||[[dic objectForKey:val]isKindOfClass:[NSArray class]])  {
            [dic removeObjectForKey:val];
        }
    }
    NSDictionary *dicc = [NSDictionary dictionaryWithDictionary:dic];
    
    return dicc;
    
    
}



-(NSString *)conversionToString_sorderSortByKey{
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[self allKeys]];
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *a = (NSString *)obj1;
        NSString *b = (NSString *)obj2;
        
        return [a compare:b];
        
    }];
    
    NSMutableArray *sortArr = [NSMutableArray array];
    for (NSString* key in arr) {
        NSString *tempStr = [NSString stringWithFormat:@"%@=%@",key,[self objectForKey:key]];
        [sortArr addObject:tempStr];
    }
    
    NSString *totalString  = [sortArr componentsJoinedByString:@""];
    return totalString;
    
}

//生成数字密钥
-(NSMutableDictionary *)signDic{
    NSString *string = @"showki";
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithDictionary:self];
    NSString *sign =  [[dictionary deleteObjectsForNullValues]conversionToString_sorderSortByKey];
    sign = [NSString stringWithFormat:@"%@%@",sign,string];
    NSString *signMd5 = [sign md5];
    [dictionary setValue:[NSNull null] forKey:@"verify"];
        
    return dictionary;
    
}

@end

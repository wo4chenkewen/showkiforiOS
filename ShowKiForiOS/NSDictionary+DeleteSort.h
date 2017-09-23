//
//  NSDictionary+DeleteSort.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DeleteSort)
//删除字典中的空value
-(NSDictionary *)deleteObjectsForNullValues;



//对字典进行顺序排序然后拼接成使用&符连接的字符串

-(NSString *)conversionToString_sorderSortByKey;


//生成数字密钥
-(NSMutableDictionary *)signDic;
@end

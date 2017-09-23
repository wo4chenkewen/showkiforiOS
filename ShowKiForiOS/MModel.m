//
//  MModel.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "MModel.h"

@implementation MLoginModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"user_id" : @"user_id",
             @"phone" : @"phone",
             @"head_img" : @"head_img",
             @"nick_name" : @"nick_name"
             };
}
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSString stringWithFormat:@"%@", value];
    }];

}
@end

@implementation MVerificationCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"code" : @"code"
             };
}
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    
        return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            return [NSString stringWithFormat:@"%@", value];
        }];
    
}
@end

@implementation MRegister
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
     return @{@"user_id" : @"user_id",
                    @"phone" : @"phone",
                    @"head_img" : @"head_img"
                    };
}
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    
        return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            return [NSString stringWithFormat:@"%@", value];
        }];
    
}


@end

@implementation MyFriendModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"user_id" : @"user_id",
             @"name" : @"name",
             @"pages" : @"pages",
             @"page" : @"page"
             };
}
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    if (![key isEqualToString:@"name"]) {
        return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            return @([value integerValue]);
        }];
    } else {
        return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            return [NSString stringWithFormat:@"%@", value];
        }];
    }
    return nil;

}
@end


@implementation BannerImgModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"list" : @"list",
             @"pages" : @"pages",
             @"page" : @"page"
             };
}
+ (NSValueTransformer *)listJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ImgModel.class];
}
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    if (![key isEqualToString:@"list"]) {
        return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            return @([value integerValue]);
        }];
    } else {
        return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
            return [NSString stringWithFormat:@"%@", value];
        }];
    }
    return nil;
    
}
@end

@implementation ImgModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"pic" : @"pic",
             @"link" : @"link"
             };
}
+ (NSValueTransformer *)listJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ImgModel.class];
}
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSString stringWithFormat:@"%@", value];
    }];
    
}
@end

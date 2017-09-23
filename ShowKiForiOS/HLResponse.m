//
//  HLResponse.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "HLResponse.h"

@implementation HLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"resultCode" : @"resultCode",
             @"resultMessage" : @"msg",
             @"cmd" :@"cmd"};
}

+ (NSValueTransformer *)resultCodeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return @([value integerValue]);
    }];
}

@end

@implementation HLLoginResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *parent = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    [parent addEntriesFromDictionary:@{@"loginModel" :@"body"}];
   
    return parent;
}

+ (NSValueTransformer *)loginModelJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MLoginModel.class];
}
@end

@implementation HLVerificationCodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *parent = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    [parent addEntriesFromDictionary:@{@"code" : @"body"}];
    return parent;
}
+ (NSValueTransformer *)codeJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MVerificationCode.class];
}


@end

@implementation HLRegisterResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *parent = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    [parent addEntriesFromDictionary:@{@"userModel" : @"body"
                                       }];
    return parent;
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MRegister.class];
}

@end

@implementation HLMyFriendResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *parent = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    [parent addEntriesFromDictionary:@{@"MyFriend" : @"body"
                                       }];
    return parent;
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MyFriendModel.class];
}

@end

@implementation HLBannerImgResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *parent = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    [parent addEntriesFromDictionary:@{@"bannerImgModel" : @"body"
                                       }];
    return parent;
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:BannerImgModel.class];
}


@end

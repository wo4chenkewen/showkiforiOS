//
//  HttpRequest.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "HttpRequest.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>

static NSString *const kServerDomain = @"http://showkiapi.xun-ao.com/";

#define REQUEST_FULL_PATH(arg) [NSString stringWithFormat:@"%@%@", kServerDomain, arg]

@implementation HttpRequest
+ (NSMutableArray<NSURLSessionDataTask *> *)tasks {
    static dispatch_once_t once;
    static NSMutableArray *tasks;
    dispatch_once(&once, ^{
        tasks = [[NSMutableArray alloc] init];
    });
    return tasks;
}

+ (void)cancel {
    [self.tasks enumerateObjectsUsingBlock:^(NSURLSessionDataTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
        [task cancel];
    }];
    [self.tasks removeAllObjects];
}

+ (void)requestURLString:(NSString *)URLString withHeaders:(NSDictionary *)_headers responseClass:(Class)responseClass parameters:(NSString *)parameters responseContentType:(NSString *)responseContentType complete:(ResponseCallback)complete {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if ([responseContentType isEqualToString:@"HTML"]) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    } else {
        manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableLeaves];
    }
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", nil];
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST" URLString:URLString parameters:nil error:nil];
    [request setTimeoutInterval:10.0];
    NSError *error = nil;
    if (parameters) {
        //加盐
      // NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters[@"params"]];
      //  NSDictionary *dicc = [dic signDic];
       // dicc = @{@"cmd":parameters[@"cmd"],@"params":dicc};
       // parameters = [parameters signDic];
       // NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters
        //                                                   options:0
        //                                                     error:&error];
        
        ///////// TODO: Encrypt
       // NSData *encryptData = jsonData;
        NSData *jsonData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:jsonData];
    }
    NSAssert(!error, [error localizedDescription]);
    
    __block NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
            if (!error) {
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
            NSString *token = HTTPResponse.allHeaderFields[@"token"];
            if (token) {
                NSMutableDictionary *mutableObject = [responseObject mutableCopy];
                mutableObject[@"token"] = token;
                responseObject = mutableObject;
            }
                
            __kindof HLResponse *responseModal = nil;
            if (!responseClass) {
                NSLog(@"%@",responseObject);
                responseModal = [MTLJSONAdapter modelOfClass:HLResponse.class fromJSONDictionary:responseObject error:nil];
            }
            else {
                NSLog(@"%@",responseObject);

                //使用mantle的关键
                responseModal = [MTLJSONAdapter modelOfClass:responseClass fromJSONDictionary:responseObject error:nil];
            }
            if (responseModal) {

                if (responseModal.resultCode == 9004) {
                    [SVProgressHUD showInfoWithStatus:responseModal.resultMessage];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"HLTokenExpireNotification" object:nil];
                } else {
                    complete(responseModal, nil);
                }
            }
        } else {

            HLResponse *resp = [[HLResponse alloc] init];
            resp.resultCode = -999999;
            resp.resultMessage = [NSString stringWithFormat:@"%@, %@", @(error.code), [error localizedDescription]];
            complete(resp, error);
        }
        [self.tasks removeObject:task];
    }];
    
    [task resume];
    [self.tasks addObject:task];

}

+ (void)requestURLString:(NSString *)URLString withHeaders:(NSDictionary *)_headers responseClass:(Class)responseClass parameters:(NSString *)parameters complete:(ResponseCallback)complete {
    [self requestURLString:URLString withHeaders:_headers responseClass:responseClass parameters:parameters responseContentType:nil complete:complete];
}
+ (void)requestURLString:(NSString *)URLString responseClass:(Class)responseClass parameters:(NSString *)parameters complete:(ResponseCallback)complete {
    [self requestURLString:URLString withHeaders:nil responseClass:responseClass parameters:parameters complete:complete];
}

+ (NSString *)stringWithArray:(NSArray *)array{
    NSString *stirng = @"1";
    for (int i = 0 ; i < array.count; i++) {
        if (i%2 != 0) {
            stirng = [NSString stringWithFormat:@"%@=%@",stirng,array[i]];
        }
        else if (i%2 == 0 ){
            stirng = [NSString stringWithFormat:@"%@&%@",stirng,array[i]];
        }
    }
    NSString *parameters = [stirng substringFromIndex:2];
    return parameters;
}
#pragma mark - public methods
#pragma mark -- 登录 --
+ (void)requestLoginWithPhone:(NSString *)phone andPassword:(NSString *)password complete:(ResponseCallback)complete {
    NSString *sting =[NSString stringWithFormat:@"cmd=%@&phone=%@&password=%@",@"login",phone,password];
    
    [self requestURLString:kServerDomain
             responseClass:HLLoginResponse.class
                parameters:[self stringWithArray:@[@"cmd",@"login",@"phone",phone,@"password",password]]
                  complete:complete];
}

#pragma mark -- 发短信 --
+ (void)requestSendSMS:(NSString *)phoneNumber type:(PasswordSettingFlowAction)type user_id:(NSInteger )user_id complete:(ResponseCallback)complete{
    NSString *sting;
    if (user_id == -1) {
        sting = [self stringWithArray:@[@"cmd",@"verificationCode",@"phone",phoneNumber,@"type",@(type)]];
    }
    else{
         sting = [self stringWithArray:@[@"cmd",@"verificationCode",@"phone",phoneNumber,@"type",@(type),@"user_id",@(user_id)]];
    }
    [self requestURLString:kServerDomain
             responseClass:HLVerificationCodeResponse.class
                parameters:sting
                  complete:complete];
}

// 第三方登录后验证手机号
+ (void)requestCheckMobile:(NSString *)phoneNumber complete:(ResponseCallback)complete{
    [self requestURLString:kServerDomain responseClass:nil parameters:[self stringWithArray:@[@"cmd",@"checkMobile",@"mobile",phoneNumber]]  complete:complete];
}

//注册@{@"cmd":@"register",@"params":@{@"phone":phoneNumber, @"password":password,@"code":@(code)}}
+ (void)requestRegister:(NSString *)phoneNumber password:(NSString *)password code:(NSInteger)code complete:(ResponseCallback)complete{
    [self requestURLString:kServerDomain
             responseClass:HLRegisterResponse.class
                parameters:[self stringWithArray:@[@"cmd",@"register",@"phone",phoneNumber,@"password",password,@"code",@(code)]]
                  complete:complete];

}

//5.忘记密码 找回密码:updatePassword @{@"cmd":@"updatePassword",@"params":@{@"phone":phone, @"password":password,@"code":@(code)}}
+ (void)requestRegister:(NSString *)phone andpassword:(NSString *)password code:(NSInteger)code complete:(ResponseCallback)complete{
    [self requestURLString:kServerDomain
             responseClass:HLResponse.class
                parameters:[self stringWithArray:@[@"cmd",@"updatePassword",@"phone",phone,@"password",password,@"code",@(code)]]
                  complete:complete];

}
//6.第三方登陆:joinLogin   @{@"cmd":@"updatePassword",@"params":@{@"nick_name":nick_name, @"head_img":head_img,@"user_id":@(user_id),@"token":token, @"register_typ":@(register_typ)}}
+ (void)requestJoinLogin:(NSInteger)user_id nick_name:(NSString *)nick_name head_img:(NSString *)head_img token:(NSString *)token register_type:(Register_type)register_typ complete:(ResponseCallback)complete{
    NSString *string;
    if (user_id == -1) {
        string = [self stringWithArray:@[@"cmd",@"joinLogin",@"nick_name",nick_name,@"head_img",head_img,@"token",token,@"register_type",@(register_typ)]];
    }
    else{
        string = [self stringWithArray:@[@"cmd",@"joinLogin",@"nick_name",nick_name,@"head_img",head_img,@"token",token,@"register_type",@(register_typ),@"user_id",@(user_id)]];
    }

    [self requestURLString:kServerDomain
             responseClass:HLRegisterResponse.class
                parameters:string
                  complete:complete];

}


#pragma mark -- 个人中心 --

//2.我的好友 page:总页数，num：当前页数
+ (void)requestMyFriend:(NSInteger )user_id page:(NSInteger)page num:(NSInteger)num complete:(ResponseCallback)complete{
    NSString *string;
    if (page < 1) {
        string = [self stringWithArray:@[@"cmd",@"MyFriend"]];
    }
    else{
        string = [self stringWithArray:@[@"cmd",@"MyFriend",@"page",@(page),@"num",@(num),@"user_id",@(user_id)]];
    }
    [self requestURLString:kServerDomain
             responseClass:HLRegisterResponse.class
                parameters:string
                  complete:complete];
}


#pragma mark -- 心愿产品 --
+ (void)requestbannerImgcomplete:(ResponseCallback)complete{
    [self requestURLString:kServerDomain
             responseClass:HLBannerImgResponse.class
                parameters:@"cmd=bannerImg"
                  complete:complete];

}


@end

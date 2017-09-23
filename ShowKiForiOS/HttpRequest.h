//
//  HttpRequest.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLResponse.h"

typedef void(^ResponseCallback)(__kindof HLResponse *response, NSError *error);
typedef NS_ENUM(NSInteger, PasswordSettingFlowAction) {
    PasswordSettingFlowActionRegister = 1,
    PasswordSettingFlowActionForgotPassword = 2,
    PasswordSettingFlowActionModifyPassword = 3
};

typedef NS_ENUM(NSInteger, Register_type) {
    Register_typeweixin = 2,
    Register_typeqq = 3,
    Register_typeweibo = 4
};
@interface HttpRequest : NSObject
+ (void)cancel;

// 登录 /sign/loginapp
+ (void)requestLoginWithPhone:(NSString *)phone andPassword:(NSString *)password complete:(ResponseCallback)complete;

//手机验证码verificationCode
// type = 1 注册
// type = 2 忘记密码
// type = 3 登录密码修改
// 发送短信
+ (void)requestSendSMS:(NSString *)phoneNumber type:(PasswordSettingFlowAction)type user_id:(NSInteger )user_id complete:(ResponseCallback)complete;

// 第三方登录后验证手机号
+ (void)requestCheckMobile:(NSString *)phoneNumber complete:(ResponseCallback)complete;

//注册
+ (void)requestRegister:(NSString *)phoneNumber password:(NSString *)password code:(NSInteger)code complete:(ResponseCallback)complete;

//5.忘记密码 找回密码:updatePassword
+ (void)requestRegister:(NSString *)phone andpassword:(NSString *)password code:(NSInteger)code complete:(ResponseCallback)complete;


//6.第三方登陆:joinLogin
+ (void)requestJoinLogin:(NSInteger)user_id nick_name:(NSString *)nick_name head_img:(NSString *)head_img token:(NSString *)token register_type:(Register_type)register_typ complete:(ResponseCallback)complete;

#pragma mark -- 个人中心 -- 、


//2.我的好友 page:总页数，num：当前页数
+ (void)requestMyFriend:(NSInteger )user_id page:(NSInteger )page num:(NSInteger)num complete:(ResponseCallback)complete;



#pragma mark -- 心愿产品 -- 
+ (void)requestbannerImgcomplete:(ResponseCallback)complete;
@end

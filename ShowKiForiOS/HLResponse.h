//
//  HLResponse.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "MModel.h"
@interface HLResponse : MTLModel <MTLJSONSerializing>
@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, copy) NSString *resultMessage;
@property (nonatomic, copy) NSString *cmd;

@end

//登录
@interface HLLoginResponse : HLResponse

@property (nonatomic, strong)MLoginModel *loginModel;
@end

//验证码
@interface HLVerificationCodeResponse : HLResponse
@property (nonatomic, strong)MVerificationCode *code;
@end


//注册
@interface HLRegisterResponse : HLResponse
@property (nonatomic, strong)MRegister *userModel;
@end

#pragma mark -- 个人中心 --
@interface HLMyFriendResponse : HLResponse
@property (nonatomic, strong)MyFriendModel *MyFriend;
@end


#pragma mark -- 心愿产品 -- 

@interface HLBannerImgResponse : HLResponse
@property (nonatomic, strong)BannerImgModel *bannerImgModel;
@end



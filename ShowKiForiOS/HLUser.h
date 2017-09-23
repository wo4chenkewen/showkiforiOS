//
//  HLUser.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/26.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HL_USER [HLUser sharedUser]
@interface HLUser : NSObject
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *head_img;
@property (nonatomic, assign) NSInteger user_id;
@property (nonatomic, assign) BOOL isLogin;


+ (instancetype)sharedUser;
- (void)save; //保存
- (void)logout; //退出登录

@end

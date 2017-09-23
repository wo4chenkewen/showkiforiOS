//
//  MModel.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>


@interface MLoginModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign)NSInteger user_id; //会员id
@property (nonatomic, copy) NSString *phone;   //会员名
@property (nonatomic, copy) NSString *head_img; //会员头像
@property (nonatomic, copy) NSString *nick_name; //会员昵 称
@end

@interface MVerificationCode :MTLModel <MTLJSONSerializing>
@property (nonatomic, copy) NSString *code;
@end

@interface MRegister :MTLModel <MTLJSONSerializing>
@property (nonatomic, assign)NSInteger user_id; //会员id
@property (nonatomic, copy) NSString *phone;   //会员名
@property (nonatomic, copy) NSString *head_img; //会员头像

@end

#pragma mark -- 个人中心 --

@interface  MyFriendModel:MTLModel <MTLJSONSerializing>
@property (nonatomic, assign)NSInteger user_id; //会员id
@property (nonatomic, copy) NSString *name;   //会员名
@property (nonatomic, assign)NSInteger pages; //总页数
@property (nonatomic, assign)NSInteger page; //当前页数

@end


#pragma mark -- 心愿产品 -- 
@interface  BannerImgModel:MTLModel <MTLJSONSerializing>
@property (nonatomic, assign)NSInteger pages; //总页数
@property (nonatomic, assign)NSInteger page; //当前页数
@property (nonatomic, strong) NSArray  *list;

@end

@interface ImgModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *pic;//轮播图片
@property (nonatomic, copy) NSString *link;//图片链接

@end



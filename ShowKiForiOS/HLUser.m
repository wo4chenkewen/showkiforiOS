//
//  HLUser.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/26.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "HLUser.h"

@implementation HLUser

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.phone forKey:@"HLUser.phone"];
    [aCoder encodeObject:self.head_img forKey:@"HLUser.head_img"];
    
    //    [aCoder encodeBool:self.gesturePasswordIsOpen forKey:@"HLUser.gesturePasswordIsOpen"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.phone = [aDecoder decodeObjectForKey:@"HLUser.phone"];
        self.head_img = [aDecoder decodeObjectForKey:@"HLUser.head_img"];
        
        //        self.gesturePasswordIsOpen = [aDecoder decodeBoolForKey:@"HLUser.gesturePasswordIsOpen"];
    }
    return self;
}

+ (instancetype)sharedUser {
    static dispatch_once_t onceToken;
    static HLUser *user;
    dispatch_once(&onceToken, ^{
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"HLUser"];
        if (data) {
            user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        if (!user) {
            user = [[HLUser alloc] init];
        }
    });
    return user;
}

- (void)save {
    if (self.isLogin) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:HL_USER];
        if (data) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"HLUser"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

- (void)logout {
    self.user_id = -1;
    self.phone = nil;
    self.head_img = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"HLUser"];
}

- (BOOL)isLogin {
    return self.phone.length > 0;
}
@end

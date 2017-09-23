//
//  ESCheck.h
//  showki
//
//  Created by Kevin.Chen on 17/4/7.
//  Copyright © 2017年 Kevin.Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESCheck : NSObject
+ (BOOL)checkTelNumber:(NSString *) telNumber;
+ (BOOL)checkPassword:(NSString *) password;
@end

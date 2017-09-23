//
//  FirstTreeTableViewCell.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTreeTableViewCell : UITableViewCell

@property (nonatomic, strong)UIButton *selectedButton;

- (void)cellForModel:(NSDictionary *)dic;

@end

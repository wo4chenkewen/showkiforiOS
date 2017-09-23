//
//  SellectedHabitCollectionViewCell.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SellectedHabitCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)UIButton *smallButton;
@property (nonatomic, strong)UIButton *bigButton;


- (void)cellForModel:(NSDictionary *)dic ishave:(BOOL)ishave;
@end

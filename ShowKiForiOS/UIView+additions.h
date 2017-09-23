//
//  UIView+additions.h
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (additions)

/**
 *x的坐标
 */
@property (nonatomic, assign) CGFloat x;
/**
 *y的坐标
 */
@property (nonatomic, assign) CGFloat y;
/**
 *中心点x的坐标
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 *中心点y的坐标
 */
@property (nonatomic, assign) CGFloat centerY;
/**
 *宽度
 */
@property (nonatomic, assign) CGFloat width;
/**
 *高度
 */
@property (nonatomic, assign) CGFloat height;
/**
 *大小
 */
@property (nonatomic, assign) CGSize size;
/**
 *圆点
 */
@property (nonatomic, assign) CGPoint origin;


@end

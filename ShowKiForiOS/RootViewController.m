//
//  RootViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "RootViewController.h"
#import "MMLifeTreeViewController.h"
#import "NaViewController.h"
#import "LoginViewController.h"
#import "MyHabitViewController.h"

static const NSInteger kButtonWidth = 60 ;
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad{
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"首页.jpg"]];
    imageView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.view addSubview:imageView];
    
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 10, ScreenWidth, 30) withText:@"首页星球" withAlign:NSTextAlignmentCenter withColor:[UIColor whiteColor] withFont:[UIFont systemFontOfSize:20]];
    [self.view addSubview:titleLabel];
    
    UIButton *habitButton = [CTUIFactory buttonWithTitle:@"习惯管理" titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18] target:self action:@selector(buttonAction:)];
    habitButton.tag = 100;
    habitButton.contentEdgeInsets = UIEdgeInsetsMake(0,5, 0,5);
    [habitButton setBackgroundImage:[UIImage imageNamed:@"tree"] forState:UIControlStateNormal];
    habitButton.frame = CGRectMake(ScreenWidth/2 - 20 -kButtonWidth, 100, kButtonWidth, kButtonWidth);
    [self.view addSubview:habitButton];
    
    
    UIButton *lifeTreeButton = [CTUIFactory buttonWithTitle:@"生命树" titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18] target:self action:@selector(buttonAction:)];
    lifeTreeButton.tag = 200;
    lifeTreeButton.contentEdgeInsets = UIEdgeInsetsMake(0,5, 0,5);
    [lifeTreeButton setBackgroundImage:[UIImage imageNamed:@"tree"] forState:UIControlStateNormal];
    lifeTreeButton.frame = CGRectMake(ScreenWidth/2 + 20 , 100, kButtonWidth, kButtonWidth);
    [self.view addSubview:lifeTreeButton];
    
    UIButton *myButton = [CTUIFactory buttonWithTitle:@"个人中心" titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18] target:self action:@selector(buttonAction:)];
    myButton.tag = 300;
    myButton.contentEdgeInsets = UIEdgeInsetsMake(0,5, 0,5);
    [myButton setBackgroundImage:[UIImage imageNamed:@"tree"] forState:UIControlStateNormal];
    myButton.frame = CGRectMake(ScreenWidth/2 - 20 - 2*kButtonWidth, 100 + kButtonWidth, kButtonWidth, kButtonWidth);
    [self.view addSubview:myButton];
    
    UIButton *productButton = [CTUIFactory buttonWithTitle:@"心愿产品" titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18] target:self action:@selector(buttonAction:)];
    productButton.tag = 400;
    productButton.contentEdgeInsets = UIEdgeInsetsMake(0,5, 0,5);
    [productButton setBackgroundImage:[UIImage imageNamed:@"tree"] forState:UIControlStateNormal];
    productButton.frame = CGRectMake(ScreenWidth/2 + 20 + kButtonWidth, 100 + kButtonWidth, kButtonWidth, kButtonWidth);
    [self.view addSubview:productButton];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 100) {
        MyHabitViewController *vc = [[MyHabitViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (btn.tag == 200){
        MMLifeTreeViewController *lifetree = [[MMLifeTreeViewController alloc]init];
        
        [self.navigationController pushViewController:lifetree animated:YES];
    }
    else if (btn.tag == 300){
        LoginViewController *loginvc = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:loginvc animated:YES];
    }
    else{
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

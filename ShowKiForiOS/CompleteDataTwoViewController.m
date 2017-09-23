//
//  CompleteDataTwoViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/23.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "CompleteDataTwoViewController.h"
#import "CompleteDataTwoView.h"
#import "CompleteDataThreeViewController.h"
@interface CompleteDataTwoViewController ()

@end

@implementation CompleteDataTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(20, 20, 30, 30);
    [backButton setImage:[UIImage imageNamed:@"return_cir"] forState:UIControlStateNormal];
    backButton.tag = 2000;
    [backButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    CompleteDataTwoView *firstView = [[CompleteDataTwoView alloc]initWithFrame:CGRectMake(0, 70, ScreenWidth, HeightScale(150))];
    NSArray *firstArray = @[@"自由职业",@"学生",@"小资",@"管理",@"上班族",@"体力劳动"];
    [firstView title:@"从事职业" titleArray:firstArray ishave:NO];
    firstView.authCallBack = ^(NSInteger tag) {
       
    };
    [self.view addSubview:firstView];
    
    //第一个图标
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -3, CGRectGetMaxY(firstView.frame) + HeightScale(35), 6, 6)];
    iconImageView.backgroundColor = [UIColor grayColor];
    [iconImageView.layer setCornerRadius:3];
    [self.view addSubview:iconImageView];
    
    
    CompleteDataTwoView *secondView = [[CompleteDataTwoView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImageView.frame) + HeightScale(40), ScreenWidth, HeightScale(150))];
    NSArray *secondArray = @[@"本科以上",@"本科",@"大专",@"高中",@"其他"];
    [secondView title:@"学历" titleArray:secondArray ishave:YES];
    secondView.authCallBack = ^(NSInteger tag) {
        
    };
    [self.view addSubview:secondView];
    
    //下一步
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    
    nextButton.frame = CGRectMake(50, ScreenHeight - HeightScale(20) - 40 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    nextButton.tag = 400;
    [self.view addSubview:nextButton];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 2000) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn.tag == 400){
        //下一步
        CompleteDataThreeViewController *vc = [[CompleteDataThreeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
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

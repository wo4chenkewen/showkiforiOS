//
//  CompleteDataThreeViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/23.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "CompleteDataThreeViewController.h"
#import "MineButton.h"
#import "RootViewController.h"
@interface CompleteDataThreeViewController ()
@property (nonatomic, strong)MineButton *discovertureBtn;
@property (nonatomic, strong)MineButton *marriedBtn;
@property (nonatomic, strong)UIButton *haveBtn;
@property (nonatomic, strong)UIButton *noneBtn;
@end

@implementation CompleteDataThreeViewController

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
    CGFloat x = ScreenWidth/2 - 80 -30;
    self.discovertureBtn = [MineButton buttonWithType:UIButtonTypeCustom];
    self.discovertureBtn.frame = CGRectMake(x, HeightScale(140), 80, 110);
    self.discovertureBtn.iconImageView.image = [UIImage imageNamed:@"circle_highlight"];
    self.discovertureBtn.tag = 100;
    self.discovertureBtn.selected = YES;
    self.discovertureBtn.textLabel1.text = @"未婚";
    [self.discovertureBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.discovertureBtn];
    
    self.marriedBtn = [MineButton buttonWithType:UIButtonTypeCustom];
    self.marriedBtn.frame = CGRectMake(x + 80 +30*2, HeightScale(140), 80, 110);
    self.marriedBtn.iconImageView.image = [UIImage imageNamed:@"circle"];
    [self.marriedBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.marriedBtn.textLabel1.text = @"已婚";
    self.marriedBtn.tag = 200;
    [self.view addSubview:self.marriedBtn];
    
    //第一个图标
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -3, CGRectGetMaxY(self.marriedBtn.frame) + HeightScale(45), 6, 6)];
    iconImageView.backgroundColor = [UIColor grayColor];
    [iconImageView.layer setCornerRadius:3];
    [self.view addSubview:iconImageView];

    self.haveBtn = [self createButtonWithFrame:CGRectMake(ScreenWidth/2 - WidthScale(65), CGRectGetMaxY(iconImageView.frame) + HeightScale(45), WidthScale(130), 40) text:@"有子女" tag:300];
    
    [self.view addSubview:self.haveBtn];
    
    self.noneBtn = [self createButtonWithFrame:CGRectMake(ScreenWidth/2 - WidthScale(65), CGRectGetMaxY(self.haveBtn.frame) + HeightScale(20), WidthScale(130), 40) text:@"无子女" tag:400];
    self.noneBtn.selected = YES;
    [self.view addSubview:self.noneBtn];
    
    //下一步
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"完成" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    
    nextButton.frame = CGRectMake(50, ScreenHeight - HeightScale(20) - 40 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    nextButton.tag = 500;
    [self.view addSubview:nextButton];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (UIButton *)createButtonWithFrame:(CGRect )frame text:(NSString *)text tag:(NSInteger)tag{
    UIButton *habitButton = [CTUIFactory buttonWithTitle:text titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    habitButton.tag = tag;
    habitButton.contentEdgeInsets = UIEdgeInsetsMake(0,0, 0,0);
    [habitButton setBackgroundImage:[UIImage imageNamed:@"wdhy_msg_green"] forState:UIControlStateNormal];
    [habitButton setBackgroundImage:[UIImage imageNamed:@"xdpy_btn_tj"] forState:UIControlStateSelected];
    [habitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [habitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    habitButton.frame = frame;
    return habitButton;
}
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 2000) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn.tag == 500){
        //下一步
        RootViewController *vc = [[RootViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (btn.tag == 100){
        self.discovertureBtn.selected = YES;
        self.discovertureBtn.iconImageView.image = [UIImage imageNamed:@"circle_highlight"];
        self.marriedBtn.selected = NO;
        self.marriedBtn.iconImageView.image = [UIImage imageNamed:@"circle"];
    }
    else if (btn.tag == 200){
        self.discovertureBtn.selected = NO;
        self.discovertureBtn.iconImageView.image = [UIImage imageNamed:@"circle"];
        self.marriedBtn.selected = YES;
        self.marriedBtn.iconImageView.image = [UIImage imageNamed:@"circle_highlight"];
    }
    else if (btn.tag == 300){
        self.haveBtn.selected = YES;
        self.noneBtn.selected = NO;
    }
    else if (btn.tag == 400){
        self.haveBtn.selected = NO;
        self.noneBtn.selected = YES;
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

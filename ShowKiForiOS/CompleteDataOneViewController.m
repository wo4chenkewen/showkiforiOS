//
//  CompleteDataOneViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/23.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "CompleteDataOneViewController.h"
#import "WSDatePickerView.h"
#import "CompleteDataTwoViewController.h"
@interface CompleteDataOneViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UIButton *boyButton;
@property (nonatomic, strong)UIButton *girlButton;
@property (nonatomic, strong)UIButton *birthDayButton;
@end

@implementation CompleteDataOneViewController

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
    //标题
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, HeightScale(84), ScreenWidth, 20) withText:@"你的昵称？" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:titleLabel];
    //标题详情
    UILabel *detailLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+HeightScale(10), ScreenWidth, 20) withText:@"昵称请控制在2-20个字符" withAlign:NSTextAlignmentCenter withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:detailLabel];
    //昵称输入框
    self.nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, CGRectGetMaxY(detailLabel.frame) + HeightScale(30), ScreenWidth - 80*2, 28)];
    _nameTextField.tintColor = [UIColor blackColor];
    _nameTextField.delegate = self;
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.placeholder = @"可爱的陈荣飞";
    _nameTextField.font = [UIFont systemFontOfSize:20];
    [_nameTextField setTextAlignment:NSTextAlignmentCenter];
 //   [_nameTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_nameTextField setValue:[UIFont boldSystemFontOfSize:19] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_nameTextField];
    
    UILabel *lineLabel = [CTUIFactory creatLabelInFrame:CGRectMake(80, CGRectGetMaxY(_nameTextField.frame) + 2, ScreenWidth - 80*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    lineLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:lineLabel];
    
    //第一个图标
     UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -3, CGRectGetMaxY(_nameTextField.frame) + HeightScale(35), 6, 6)];
    iconImageView.backgroundColor = [UIColor grayColor];
    [iconImageView.layer setCornerRadius:3];
    [self.view addSubview:iconImageView];
    //性别标题
    UILabel *genderLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0,CGRectGetMaxY(iconImageView.frame) +  HeightScale(35), ScreenWidth, 20) withText:@"你的性别？" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:genderLabel];
    //男button
    self.boyButton = [self createButtonWithFrame:CGRectMake(WidthScale(120), CGRectGetMaxY(genderLabel.frame) + HeightScale(30), 50, 50) text:@"男" tag:100];
    self.boyButton.selected = YES;
    [self.view addSubview:self.boyButton];
    
    //女button
    self.girlButton = [self createButtonWithFrame:CGRectMake(ScreenWidth - WidthScale(120) - 50, CGRectGetMaxY(genderLabel.frame) + HeightScale(30), 50, 50) text:@"女" tag:200];
    [self.view addSubview:self.girlButton];
    
    //图标
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2 -3, CGRectGetMaxY(self.girlButton.frame) + HeightScale(40), 6, 6)];
    ImageView.backgroundColor = [UIColor grayColor];
    [ImageView.layer setCornerRadius:3];
    [self.view addSubview:ImageView];
    
    //生日标题
    UILabel *birthdayLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0,CGRectGetMaxY(ImageView.frame) +  HeightScale(40), ScreenWidth, 20) withText:@"你的出生日期？" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:birthdayLabel];
    
    
    
    //生日选择按钮
    self.birthDayButton = [CTUIFactory buttonWithTitle:@"1995 03 15" titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:19] target:self action:@selector(buttonAction:)];
    self.birthDayButton.tag = 300;
    self.birthDayButton.frame = CGRectMake(ScreenWidth/2 - 75, CGRectGetMaxY(birthdayLabel.frame) + HeightScale(37), 150, 30);
    [self.view addSubview:self.birthDayButton];
    
    //下划线
    UILabel *lineTwoLabel = [CTUIFactory creatLabelInFrame:CGRectMake(ScreenWidth/2 - 75, CGRectGetMaxY(self.birthDayButton.frame) + 3, 150, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    lineTwoLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:lineTwoLabel];
    
    //下一步
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    
    nextButton.frame = CGRectMake(50, ScreenHeight - HeightScale(20) - 40 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    nextButton.tag = 400;
    [self.view addSubview:nextButton];
}

- (UIButton *)createButtonWithFrame:(CGRect )frame text:(NSString *)text tag:(NSInteger)tag{
    UIButton *habitButton = [CTUIFactory buttonWithTitle:text titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18] target:self action:@selector(buttonAction:)];
    habitButton.tag = tag;
    habitButton.contentEdgeInsets = UIEdgeInsetsMake(0,0, 0,0);
    [habitButton setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
    [habitButton setBackgroundImage:[UIImage imageNamed:@"circle_highlight"] forState:UIControlStateSelected];
    [habitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [habitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
     habitButton.frame = frame;
     return habitButton;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 2000) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn.tag == 100){
        self.boyButton.selected = YES;
        self.girlButton.selected = NO;
    }
    else if (btn.tag == 200){
        self.boyButton.selected = NO;
        self.girlButton.selected = YES;

    }
    else if (btn.tag == 300){
        WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *startDate) {
            NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd"];
            NSLog(@"时间： %@",date);
            [btn setTitle:date forState:UIControlStateNormal];
            
        }];
        datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
        [datepicker show];

    }
    else if (btn.tag == 400){
        //下一步
        CompleteDataTwoViewController *vc = [[CompleteDataTwoViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}






- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
        [self.nameTextField becomeFirstResponder];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    return YES;
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

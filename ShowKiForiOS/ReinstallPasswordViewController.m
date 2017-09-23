//
//  ReinstallPasswordViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "ReinstallPasswordViewController.h"
#import "LoginViewController.h"
@interface ReinstallPasswordViewController ()<UITextFieldDelegate>

@property (nonatomic,retain)UITextField *passwordTextfied;

@end

@implementation ReinstallPasswordViewController

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
    
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 70, ScreenWidth, 40) withText:@"重置密码" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:titleLabel];
    
    //密码
    UILabel *passwordLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(titleLabel.frame   )+20, 100, 28) withText:@"密码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    
    self.passwordTextfied = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordLabel.frame)+15, ScreenWidth - 50*2, 28)];
    _passwordTextfied.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _passwordTextfied.delegate = self;
    _passwordTextfied.backgroundColor = [UIColor clearColor];
    _passwordTextfied.placeholder = @"至少六位";
    _passwordTextfied.secureTextEntry = YES;
    // [_passwordTextfied setKeyboardType:UIKeyboardTypeNumberPad];
    [self setRightViewWithTextField:_passwordTextfied imageName:@"jiami" imageSelectedName:@"chakan"];
    [_passwordTextfied setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_passwordTextfied];
    
    [self.view addSubview:passwordLabel];

    UILabel *lineLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(passwordLabel.frame), CGRectGetMaxY(_passwordTextfied.frame)+3, ScreenWidth - CGRectGetMinX(passwordLabel.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    lineLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:lineLabel];
    //确定
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    nextButton.tag = 1000;
    nextButton.frame = CGRectMake(50, CGRectGetMaxY(_passwordTextfied.frame)+40 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
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
    else if (btn.tag == 3000){
        if (btn.selected) {
            
            _passwordTextfied.secureTextEntry = YES;
        }
        else{
            _passwordTextfied.secureTextEntry = NO;
        }
        btn.selected = !btn.selected;
    }
    else{
        //请求 修改密码成功
        [HttpRequest requestRegister:self.telephoneNumber andpassword:self.passwordTextfied.text code:self.code complete:^(__kindof HLResponse *response, NSError *error) {
            if (response.resultCode == 1) {
                LoginViewController *vc = [[LoginViewController alloc]init];
                NaViewController *nav = [[NaViewController alloc]initWithRootViewController:vc];
                [self presentViewController:nav animated:YES completion:nil];
            }
            else{
                [UIAlertView showWithTitle:@"提示" message:response.resultMessage cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
            }
        }];
    }
}
//textfield右侧添加按钮
-(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName imageSelectedName:(NSString *)imageSelectedName {
    
    UIButton *rightView = [CTUIFactory buttonWithTitle:@"" titleColor:[UIColor clearColor] font:[UIFont systemFontOfSize:0] target:self action:@selector(buttonAction:)];
    [rightView setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightView setImage:[UIImage imageNamed:imageSelectedName] forState:UIControlStateSelected];
    rightView.size = CGSizeMake(30, 30);
    rightView.tag = 3000;
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.passwordTextfied becomeFirstResponder];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.passwordTextfied resignFirstResponder];
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

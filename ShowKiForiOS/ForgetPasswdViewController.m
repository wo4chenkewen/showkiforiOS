//
//  ForgetPasswdViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "ForgetPasswdViewController.h"
#import "ReinstallPasswordViewController.h"
@interface ForgetPasswdViewController ()<UITextFieldDelegate>
@property (nonatomic,retain)UITextField *iphoneNumber;
@property (nonatomic,retain)UITextField *passwordTextfied;
@property (nonatomic, strong)NSString *code ; //验证码
@end

@implementation ForgetPasswdViewController

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

    
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 70, ScreenWidth, 40) withText:@"忘记密码" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:titleLabel];
    //电话号
    UILabel *iphoneLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, 120, 100, 28) withText:@"手机号" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:iphoneLabel];
    
    UILabel *numberLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(iphoneLabel.frame), CGRectGetMaxY(iphoneLabel.frame)+15, 50, 23) withText:@"+86▼" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:numberLabel];
    
    UILabel *lineLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(iphoneLabel.frame), CGRectGetMaxY(numberLabel.frame)+3, ScreenWidth - CGRectGetMinX(iphoneLabel.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    lineLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:lineLabel];
    
    self.iphoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numberLabel.frame)+5, CGRectGetMinY(numberLabel.frame), 200, 28)];
    _iphoneNumber.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _iphoneNumber.delegate = self;
    _iphoneNumber.backgroundColor = [UIColor clearColor];
    [_iphoneNumber setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:_iphoneNumber];
    
    //验证码
    UILabel *passwordLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(lineLabel.frame   )+20, 100, 28) withText:@"验证码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    
    self.passwordTextfied = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordLabel.frame)+15, ScreenWidth - 50*2, 28)];
    _passwordTextfied.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _passwordTextfied.delegate = self;
    _passwordTextfied.backgroundColor = [UIColor clearColor];
    _passwordTextfied.placeholder = @"输入四位验证码";
    [_passwordTextfied setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [_passwordTextfied setKeyboardType:UIKeyboardTypeNumberPad];
    [self setRightViewWithTextField:_passwordTextfied imageName:@"jiami" imageSelectedName:@"chakan"];
    [self.view addSubview:_passwordTextfied];
    [self.view addSubview:passwordLabel];
    
    UILabel *linetwoLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(_passwordTextfied.frame), CGRectGetMaxY(_passwordTextfied.frame)+3, ScreenWidth - CGRectGetMinX(iphoneLabel.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    linetwoLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:linetwoLabel];

    //确定
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    nextButton.tag = 1000;
    nextButton.frame = CGRectMake(50, CGRectGetMaxY(linetwoLabel.frame)+40 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    [self.view addSubview:nextButton];
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

//textfield右侧添加按钮
-(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName imageSelectedName:(NSString *)imageSelectedName {
    UIButton *rightView = [CTUIFactory buttonWithTitle:@"发送验证码" titleColor:[UIColor colorWithHexString:@"#00FFA2"] font:[UIFont systemFontOfSize:10] target:self action:@selector(buttonAction:)];
    rightView.layer.cornerRadius = 15;
    rightView.layer.borderWidth = 1;
    rightView.layer.borderColor = [UIColor colorWithHexString:@"#00FFA2"].CGColor;
    rightView.size = CGSizeMake(70, 30);
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
}

//发验证吗 和确定
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 1000) {
        BOOL ishave = [NSString isValidateMobile:self.iphoneNumber.text];
        if (ishave) {
            if ([self.code isEqualToString:@"0"]) {
                //验证码请求成功
                
                ReinstallPasswordViewController *vc = [[ReinstallPasswordViewController alloc]init];
                vc.telephoneNumber = self.iphoneNumber.text;
                vc.code = [self.passwordTextfied.text integerValue];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else{
                 [UIAlertView showWithTitle:@"提示" message:@"验证码错误" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
            }
            
        }
        else{
            [UIAlertView showWithTitle:@"提示" message:@"请输入正确手机号码" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
        }
        
    }
    else if (btn.tag == 2000){
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        //发验证码请求
        [HttpRequest requestSendSMS:self.iphoneNumber.text type:2 user_id:-1 complete:^(__kindof HLResponse *response, NSError *error) {
            if (response.resultCode == 1) {
                HLVerificationCodeResponse *resp = (HLVerificationCodeResponse *)response;
                NSLog(@"%@",resp.code.code);
                self.code = resp.code.code;
            }
            else{
                [UIAlertView showWithTitle:@"提示" message:@"验证码发送失败" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
            }
            
        }];

    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.iphoneNumber) {
        [self.iphoneNumber becomeFirstResponder];
    }
    else{
       // [self.passwordTextfied becomeFirstResponder];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.iphoneNumber resignFirstResponder];
    //[self.passwordTextfied resignFirstResponder];
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

//
//  RegisterPasswdViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "RegisterPasswdViewController.h"
#import "FirstTreeViewController.h"
@interface RegisterPasswdViewController ()<UITextFieldDelegate>
@property (nonatomic, retain)UITextField *iphoneNumber;
@property (nonatomic, retain)UITextField *passwordTextfied;
@property (nonatomic, retain)UITextField *friendsTextfield;

@property (nonatomic, retain)UILabel *titleLabel;
@end

@implementation RegisterPasswdViewController

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
    self.titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, 60, ScreenWidth-100, 20) withText:@"请先发送验证码"  withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:_titleLabel];
    
    //验证码
    UILabel *codeNumber = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(_titleLabel.frame)+40, 100, 28) withText:@"验证码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    
    self.iphoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(codeNumber.frame)+10, ScreenWidth - 50*2, 28)];
    _iphoneNumber.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _iphoneNumber.delegate = self;
    _iphoneNumber.backgroundColor = [UIColor clearColor];
    _iphoneNumber.placeholder = @"验证码";
    [_passwordTextfied setKeyboardType:UIKeyboardTypeNumberPad];
    [self setRightViewWithTextField:_iphoneNumber imageName:@"circle_highlight" imageSelectedName:@"70_wx" tag:3000 ishave:YES];
    [_iphoneNumber setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_iphoneNumber];
    [self.view addSubview:codeNumber];
    
    UILabel *lineLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(_iphoneNumber.frame)+3, ScreenWidth - CGRectGetMinX(_iphoneNumber.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    lineLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:lineLabel];
    
    //密码
    UILabel *passwordLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(lineLabel.frame   )+15, 100, 28) withText:@"密码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
     [self.view addSubview:passwordLabel];
    self.passwordTextfied = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordLabel.frame)+10, ScreenWidth - 50*2, 28)];
    _passwordTextfied.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _passwordTextfied.delegate = self;
    _passwordTextfied.backgroundColor = [UIColor clearColor];
    _passwordTextfied.placeholder = @"至少六位";
    // [_passwordTextfied setKeyboardType:UIKeyboardTypeNumberPad];
    [self setRightViewWithTextField:_passwordTextfied imageName:@"jiami" imageSelectedName:@"chakan" tag:4000 ishave:NO];
    [_passwordTextfied setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_passwordTextfied];
    
    UILabel *linetwoLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(_passwordTextfied.frame), CGRectGetMaxY(_passwordTextfied.frame)+3, ScreenWidth - CGRectGetMinX(codeNumber.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    linetwoLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:linetwoLabel];
    
    //朋友邀请码
    UILabel *friendLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(linetwoLabel.frame  )+15, 70, 28) withText:@"朋友邀请码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:friendLabel];
    
   // UILabel *alertLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMaxX(friendLabel.frame)+3, CGRectGetMaxY(linetwoLabel.frame )+23, 20, 12) withText:@"选填" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#FFFFFF"] withFont:[UIFont systemFontOfSize:12]];
    
    
    UIButton *alertLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    alertLabel.frame = CGRectMake(CGRectGetMaxX(friendLabel.frame)+3, CGRectGetMaxY(linetwoLabel.frame )+20, 30, 17);
    [alertLabel setBackgroundImage:[UIImage imageNamed:@"xuantian"] forState:UIControlStateNormal];
    [alertLabel setTitle:@"选项" forState:UIControlStateNormal];
    [alertLabel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
     alertLabel.titleLabel.font = [UIFont systemFontOfSize: 10.0];
    [self.view addSubview:alertLabel];
    
    self.friendsTextfield = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(friendLabel.frame)+10, ScreenWidth - 50*2, 28)];
    _friendsTextfield.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _friendsTextfield.delegate = self;
    _friendsTextfield.backgroundColor = [UIColor clearColor];
    _friendsTextfield.placeholder = @"好友邀请码";
     [_friendsTextfield setKeyboardType:UIKeyboardTypeNumberPad];
    [_friendsTextfield setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_friendsTextfield];
    
    UILabel *linethreeLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(_friendsTextfield.frame), CGRectGetMaxY(_friendsTextfield.frame)+3, ScreenWidth - CGRectGetMinX(codeNumber.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    linethreeLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:linethreeLabel];
    
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    
    nextButton.frame = CGRectMake(50, CGRectGetMaxY(linethreeLabel.frame)+40 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    
    [self.view addSubview:nextButton];

    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
//textfield右侧添加按钮
-(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName imageSelectedName:(NSString *)imageSelectedName tag:(NSInteger)tag ishave:(BOOL)ishave{
    UIButton *rightView = [CTUIFactory buttonWithTitle:@"发送验证码" titleColor:[UIColor colorWithHexString:@"#00FFA2"] font:[UIFont systemFontOfSize:10] target:self action:@selector(buttonAction:)];
    rightView.tag = tag;
    if (ishave) {
        rightView.layer.cornerRadius = 15;
        rightView.layer.borderWidth = 1;
        rightView.layer.borderColor = [UIColor colorWithHexString:@"#00FFA2"].CGColor;
        rightView.size = CGSizeMake(70, 30);
    }
    else{
        [rightView setTitle:@"" forState:UIControlStateNormal];
        [rightView setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [rightView setImage:[UIImage imageNamed:imageSelectedName] forState:UIControlStateSelected];
        rightView.size = CGSizeMake(30, 30);
    }
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
}
//发验证吗 和确定
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 4000) {
        if (btn.selected) {
            
            _passwordTextfied.secureTextEntry = YES;
        }
        else{
            _passwordTextfied.secureTextEntry = NO;
        }
        btn.selected = !btn.selected;
    }
    else if (btn.tag == 2000){
        //返回
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn.tag == 3000){
        //验证码请求
        [HttpRequest requestSendSMS:self.telephoneNumber type:1 user_id:-1 complete:^(__kindof HLResponse *response, NSError *error) {
            if (response.resultCode == 1) {
                HLVerificationCodeResponse *resp = (HLVerificationCodeResponse *)response;
                NSLog(@"%@",resp.code.code);
                self.titleLabel.text = [NSString stringWithFormat:@"验证码已发送至+86 %@",self.telephoneNumber];
            }
            else{
                [UIAlertView showWithTitle:@"提示" message:response.resultMessage cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
            }
            
        }];
    }
    else{
        //下一步 请求成功
        if (self.passwordTextfied.text.length < 6) {
             [UIAlertView showWithTitle:@"提示" message:@"密码至少六位" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
        }
        else{
            [HttpRequest requestRegister:self.telephoneNumber password:self.passwordTextfied.text code:[self.iphoneNumber.text integerValue] complete:^(__kindof HLResponse *response, NSError *error) {
                if (response.resultCode == 1) {
                    HLRegisterResponse *resp = (HLRegisterResponse *)response;
            
                    HLUser *user = [HLUser sharedUser];
                    user.head_img = resp.userModel.head_img;
                    user.phone = resp.userModel.phone;
                    user.user_id = resp.userModel.user_id;
                    [user save];
                    FirstTreeViewController *vc =  [[FirstTreeViewController alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                else{
                    [UIAlertView showWithTitle:@"提示" message:response.resultMessage cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
                }
            }];

        }
    }
}
//
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.iphoneNumber) {
        [self.iphoneNumber becomeFirstResponder];
    }
    else if (textField == self.friendsTextfield){
        [self.friendsTextfield becomeFirstResponder];
    }
    else{
        [self.passwordTextfied becomeFirstResponder];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.iphoneNumber resignFirstResponder];
    [self.passwordTextfied resignFirstResponder];
    [self.friendsTextfield resignFirstResponder];
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

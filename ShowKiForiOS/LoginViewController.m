//
//  LoginViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswdViewController.h"
#import "BindingPhoneViewController.h"
#import "RootViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,retain)UITextField *iphoneNumber;

@property (nonatomic,retain)UITextField *passwordTextfied;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //标题
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 70, ScreenWidth, 40) withText:@"登陆SHOWKI" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
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
    
    //密码
    UILabel *passwordLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(lineLabel.frame   )+20, 100, 28) withText:@"密码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    
    self.passwordTextfied = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordLabel.frame)+15, ScreenWidth - 50*2, 28)];
    _passwordTextfied.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _passwordTextfied.delegate = self;
    _passwordTextfied.backgroundColor = [UIColor clearColor];
    _passwordTextfied.placeholder = @"至少六位";
   // [_passwordTextfied setKeyboardType:UIKeyboardTypeNumberPad];
    [self setRightViewWithTextField:_passwordTextfied imageName:@"jiami" imageSelectedName:@"chakan"];
    [_passwordTextfied setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    _passwordTextfied.secureTextEntry = YES;
    [self.view addSubview:_passwordTextfied];
    
    [self.view addSubview:passwordLabel];
    
    UILabel *linetwoLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(_passwordTextfied.frame), CGRectGetMaxY(_passwordTextfied.frame)+3, ScreenWidth - CGRectGetMinX(iphoneLabel.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    linetwoLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:linetwoLabel];
    
    //忘记密码
    UIButton *forgetpasswordButton = [CTUIFactory createButtonWithFrame:CGRectMake(45, CGRectGetMaxY(linetwoLabel.frame) +15, 80, 20) title:@"忘记密码？" font:[UIFont systemFontOfSize:14] tag:100 target:self action:@selector(forgetpassword:) range:NSMakeRange(0, 5) value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]];
    [self.view addSubview:forgetpasswordButton];
    
    //确定
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"确定" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonaction)];
    
    nextButton.frame = CGRectMake(50, CGRectGetMaxY(forgetpasswordButton.frame)+15 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    [self.view addSubview:nextButton];
    
    //第三方登录
    UILabel *threeLoginLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, CGRectGetMaxY(nextButton.frame   )+30, ScreenWidth, 28) withText:@"其他方式登录" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:threeLoginLabel];
    
    //注册
    UIButton *registerButton = [CTUIFactory createButtonWithFrame:CGRectMake(0, ScreenHeight - 40 , ScreenWidth   , 20) title:@"还没有账号？立即注册SHOWKI" font:[UIFont systemFontOfSize:12] tag:200 target:self action:@selector(forgetpassword:) range:NSMakeRange(6, 10) value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]];
    [self.view addSubview:registerButton];
    
    NSArray *titleArray = @[@"qq",@"weixin",@"weibo"];
    CGFloat y = CGRectGetMinY(threeLoginLabel.frame) +(CGRectGetMinY(registerButton.frame) - CGRectGetMaxY(threeLoginLabel.frame))/2 ;
    CGFloat width = 50;
    CGFloat x = (ScreenWidth - (100 +3*width))/2;
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:titleArray[i]] forState:UIControlStateNormal];
        button.frame = CGRectMake(x, y, width, width);
        x = (x +50 + width);
        button.tag = 1000*(i + 1);
        [button addTarget:self action:@selector(threeLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
//textfield右侧添加按钮
-(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName imageSelectedName:(NSString *)imageSelectedName {
    
    UIButton *rightView = [CTUIFactory buttonWithTitle:@"" titleColor:[UIColor clearColor] font:[UIFont systemFontOfSize:0] target:self action:@selector(buttonAction:)];
    [rightView setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightView setImage:[UIImage imageNamed:imageSelectedName] forState:UIControlStateSelected];
    rightView.size = CGSizeMake(30, 30);
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
}
- (void)buttonAction:(UIButton *)btn{
    if (btn.selected) {
        
        _passwordTextfied.secureTextEntry = YES;
    }
    else{
        _passwordTextfied.secureTextEntry = NO;
    }
    btn.selected = !btn.selected;
}

//忘记密码和注册
- (void)forgetpassword:(UIButton *)btn{
    if (btn.tag == 100) {
        ForgetPasswdViewController *vc = [[ForgetPasswdViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        RegisterViewController *vc = [[RegisterViewController alloc]init];
        NaViewController *nav = [[NaViewController alloc]initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
}
//确定
- (void)buttonaction{
    if (self.passwordTextfied.text.length < 6) {
         [UIAlertView showWithTitle:@"提示" message:@"密码少于6位" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
    }
    else{
        //请求
        [HttpRequest requestLoginWithPhone:self.iphoneNumber.text andPassword:self.passwordTextfied.text complete:^(__kindof HLResponse *response, NSError *error) {
            if (response.resultCode == 1) {
                HLLoginResponse *resp = (HLLoginResponse *)response;
                HLUser *user = [HLUser sharedUser];
                user.head_img = resp.loginModel.head_img;
                user.phone = resp.loginModel.phone;
                user.user_id = resp.loginModel.user_id;
                [user save];
                RootViewController *vc = [[RootViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else{
                [UIAlertView showWithTitle:@"提示" message:response.resultMessage cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
            }
        }];
    }
}
//第三方登录
- (void)threeLoginAction:(UIButton *)btn{
    if (btn.tag == 1000) {
        
        
    }
    else if (btn.tag == 2000){
        
    }
    else{
        
    }
    //成功后绑定手机号
   // BindingPhoneViewController *vc = [[BindingPhoneViewController alloc]init];
   // [self presentViewController:vc animated:YES completion:nil];
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
        [self.passwordTextfied becomeFirstResponder];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.iphoneNumber resignFirstResponder];
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

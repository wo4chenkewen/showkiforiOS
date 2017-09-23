//
//  BindingPhoneViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "BindingPhoneViewController.h"
#import "RegisterViewController.h"
@interface BindingPhoneViewController ()<UITextFieldDelegate>
@property (nonatomic,retain)UITextField *iphoneNumber;
@property (nonatomic,retain)UITextField *passwordTextfied;
@property (nonatomic, retain)UITextField *friendsTextfield;

@end

@implementation BindingPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(ScreenWidth - 60, 30, 30, 30);
    [backButton setImage:[UIImage imageNamed:@"return_cir"] forState:UIControlStateNormal];
    backButton.tag = 2000;
    [backButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 70, ScreenWidth, 40) withText:@"绑定手机号" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
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
    UILabel *passwordLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(lineLabel.frame   )+20, 100, 28) withText:@"验证码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    
    self.passwordTextfied = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(passwordLabel.frame)+15, ScreenWidth - 50*2, 28)];
    _passwordTextfied.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _passwordTextfied.delegate = self;
    _passwordTextfied.backgroundColor = [UIColor clearColor];
    _passwordTextfied.placeholder = @"输入四位验证码";
    [_passwordTextfied setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [_passwordTextfied setKeyboardType:UIKeyboardTypeNumberPad];
    [self setRightViewWithTextField:_passwordTextfied imageName:@"circle_highlight" imageSelectedName:@"70_wx" tag:4000 ishave:YES];
    [self.view addSubview:_passwordTextfied];
    
    [self.view addSubview:passwordLabel];
    
    UILabel *linetwoLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(_passwordTextfied.frame), CGRectGetMaxY(_passwordTextfied.frame)+3, ScreenWidth - CGRectGetMinX(iphoneLabel.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    linetwoLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:linetwoLabel];
    
    //朋友邀请码
    UILabel *friendLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, CGRectGetMaxY(linetwoLabel.frame  )+15, 70, 28) withText:@"朋友邀请码" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:friendLabel];
    
    UIButton *alertLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    alertLabel.frame = CGRectMake(CGRectGetMaxX(friendLabel.frame)+3, CGRectGetMaxY(linetwoLabel.frame )+23, 20, 13);
    [alertLabel setBackgroundImage:[UIImage imageNamed:@"xuantian"] forState:UIControlStateNormal];
    [alertLabel setTitle:@"选项" forState:UIControlStateNormal];
    [alertLabel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    alertLabel.titleLabel.font = [UIFont systemFontOfSize: 9.0];
    [self.view addSubview:alertLabel];

    
    self.friendsTextfield = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(friendLabel.frame)+10, ScreenWidth - 50*2, 28)];
    _friendsTextfield.tintColor = [UIColor colorWithHexString:@"#00FFA2"];
    _friendsTextfield.delegate = self;
    _friendsTextfield.backgroundColor = [UIColor clearColor];
    _friendsTextfield.placeholder = @"好友邀请码";
    [_friendsTextfield setKeyboardType:UIKeyboardTypeNumberPad];
    [_friendsTextfield setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_friendsTextfield];
    
    UILabel *linethreeLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(_friendsTextfield.frame), CGRectGetMaxY(_friendsTextfield.frame)+3, ScreenWidth - CGRectGetMinX(iphoneLabel.frame)*2, 1) withText:@"" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
    linethreeLabel.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:linethreeLabel];
    
    //注册
    UIButton *registerButton = [CTUIFactory createButtonWithFrame:CGRectMake(45, CGRectGetMaxY(linethreeLabel.frame)+20 , 50  , 20) title:@"重新注册" font:[UIFont systemFontOfSize:12] tag:200 target:self action:@selector(forgetpassword:) range:NSMakeRange(0, 4) value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]];
    [self.view addSubview:registerButton];
    
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
    
    nextButton.frame = CGRectMake(50, CGRectGetMaxY(registerButton.frame)+30 , ScreenWidth-100, 40);
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
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (btn.tag == 3000){
        //验证码请求
    }
    else{
        //下一步
    }
}
//忘记密码和注册
- (void)forgetpassword:(UIButton *)btn{
        RegisterViewController *vc = [[RegisterViewController alloc]init];
        NaViewController *nav = [[NaViewController alloc]initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    
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

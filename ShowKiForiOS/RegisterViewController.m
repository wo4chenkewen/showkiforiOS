//
//  RegisterViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterPasswdViewController.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic,retain)UITextField *iphoneNumber;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 84, ScreenWidth, 40) withText:@"注册SHOWKI" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:titleLabel];
    
    UILabel *iphoneLabel = [CTUIFactory creatLabelInFrame:CGRectMake(50, 175, 100, 28) withText:@"手机号" withAlign:NSTextAlignmentLeft withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:iphoneLabel];
    
    UILabel *numberLabel = [CTUIFactory creatLabelInFrame:CGRectMake(CGRectGetMinX(iphoneLabel.frame), CGRectGetMaxY(iphoneLabel.frame)+25, 50, 23) withText:@"+86▼" withAlign:NSTextAlignmentLeft withColor:[UIColor colorWithHexString:@"#999999"] withFont:[UIFont systemFontOfSize:14]];
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
    
    UIButton *nextButton = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonaction)];
    
    nextButton.frame = CGRectMake(50, CGRectGetMaxY(iphoneLabel.frame)+100 , ScreenWidth-100, 40);
    nextButton.layer.cornerRadius = 20;
    nextButton.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
    
    [self.view addSubview:nextButton];
    
    UILabel *protocolLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, ScreenHeight - 33, ScreenWidth, 12) withText:@"点击下一步表示同意《SHOWKI软件许可与服务协议》" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:protocolLabel];
    
    //叉按钮
    UIButton *backButton = [CTUIFactory buttonWithTitle:@"" titleColor:[UIColor clearColor] font:nil target:self action:@selector(backAction:)];
    [backButton setImage:[UIImage imageNamed:@"return_cir" ] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(ScreenWidth - 60, 30, 30, 30);
    [self.view addSubview:backButton];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)backAction:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)buttonaction{
    BOOL ishave = [NSString isValidateMobile:self.iphoneNumber.text];
    if (ishave) {
        RegisterPasswdViewController *vc = [[RegisterPasswdViewController alloc]init];
        vc.telephoneNumber = self.iphoneNumber.text;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else{
        [UIAlertView showWithTitle:@"提示" message:@"请输入正确手机号码" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
    }
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.iphoneNumber becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.iphoneNumber resignFirstResponder];
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

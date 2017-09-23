//
//  FirstTreeViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "FirstTreeViewController.h"
#import "FirstTreeTableViewCell.h"
#import "SelectedHabitViewController.h"
@interface FirstTreeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIView *footerView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *modelArray;
@property (nonatomic, assign)NSInteger selectedNumber;
@end

@implementation FirstTreeViewController

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
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.footerView];
    [self.tableView registerClass:[FirstTreeTableViewCell class] forCellReuseIdentifier:@"myCell"];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, ScreenWidth, ScreenHeight - 50 - 70) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"FirstTree" ofType:@"json"];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingAllowFragments error:nil];
        [_modelArray addObjectsFromArray:array];
    }
    return _modelArray;
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
        UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 0, ScreenWidth, 20) withText:@"开启奇妙之旅" withAlign:NSTextAlignmentCenter withColor:[UIColor colorWithHexString:@"#0AAA6E"] withFont:[UIFont systemFontOfSize:19]];
        
        UILabel *detailLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 30, ScreenWidth, 20) withText:@"首次选中生命树" withAlign:NSTextAlignmentCenter withColor:[UIColor blackColor] withFont:[UIFont systemFontOfSize:14]];
        [_headerView addSubview:titleLabel];
        [_headerView addSubview:detailLabel];
    }
    return _headerView;
}

- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 70 , ScreenWidth, 70)];
        _footerView.backgroundColor = [UIColor whiteColor];
        UIButton *button = [CTUIFactory buttonWithTitle:@"下一步" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:14] target:self action:@selector(buttonAction:)];
        button.tag = 1000;
        button.frame = CGRectMake(50, 15 , ScreenWidth-100, 40);
        button.layer.cornerRadius = 20;
        button.backgroundColor = [UIColor colorWithHexString:@"#00BE78"];
        [_footerView addSubview:button];
    }
    return _footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [cell cellForModel:self.modelArray[indexPath.row]];
    cell.selectedButton.tag = (indexPath.row) * 100;
    [cell.selectedButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 2000) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn.tag == 1000){
        //下一步
        SelectedHabitViewController *vc = [[SelectedHabitViewController alloc]init];
        vc.number = [self selectedTree:self.selectedNumber];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        //选中树
        NSInteger number = btn.tag/100;
        for (NSInteger i = 0; i < self.modelArray.count; i++) {
            NSDictionary *dic = self.modelArray[i];
            NSMutableDictionary *dicc = [NSMutableDictionary dictionaryWithDictionary:dic];
            if (i == number) {
                [dicc setValue:@"1" forKey:@"lirui"];
                self.selectedNumber = i;
            }
            else{
                [dicc setValue:@"0" forKey:@"lirui"];
            }
            [self.modelArray replaceObjectAtIndex:i withObject:dicc];
            
        }
        [self.tableView reloadData];
        
    }
}

- (NSInteger)selectedTree:(NSInteger)number{
    if (number < 3) {
        return 3;
    }
    else if (number == 5){
        return 5;
    }
    else{
        return 4;
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

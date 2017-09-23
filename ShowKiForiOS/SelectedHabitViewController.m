//
//  SelectedHabitViewController.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/22.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "SelectedHabitViewController.h"
#import "SellectedHabitCollectionViewCell.h"
#import "SellectedHabitCollectionReusableView.h"
#import "CompleteDataOneViewController.h"
#import "WSDatePickerView.h"
@interface SelectedHabitViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *modelArray;
@property (nonatomic, strong)UIView *footerView;
@property (nonatomic, assign)NSInteger nowNumber;
@end

@implementation SelectedHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [CTUIFactory creatLabelInFrame:CGRectMake(0, 30, ScreenWidth, 20) withText:@"养成至少三个习惯" withAlign:NSTextAlignmentCenter withColor:[UIColor colorWithHexString:@"#0AAA6E"] withFont:[UIFont systemFontOfSize:19]];
    [self.view addSubview:titleLabel];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[SellectedHabitCollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    [self.collectionView registerClass:[SellectedHabitCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"myHerder"];
    [self.view addSubview:self.footerView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, ScreenWidth, ScreenHeight-50 -70) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"SellectedHabit" ofType:@"json"];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingAllowFragments error:nil];
        [_modelArray addObjectsFromArray:array];
    }
    return _modelArray;
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.modelArray[section][@"m"] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.modelArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SellectedHabitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    NSArray *array = self.modelArray[indexPath.section][@"m"];
    [cell cellForModel:array[indexPath.row] ishave:indexPath.section == 0 ? NO:YES];
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        SellectedHabitCollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"myHerder" forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[SellectedHabitCollectionReusableView alloc] init];
        }
        if (indexPath.section == 0) {
            headerView.titleLabel.text = @"热门";
        }
        else{
            headerView.titleLabel.text = @"健康";
        }
        return headerView;
    }
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 40);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.modelArray[indexPath.section][@"m"]];
    
        NSDictionary *dic = array[indexPath.row];
        NSMutableDictionary *dicc = [NSMutableDictionary dictionaryWithDictionary:dic];
        if ([[dicc valueForKey:@"b"] integerValue] == 0) {
            [dicc setValue:@"1" forKey:@"b"];
            self.nowNumber ++;
        }
        else{
            [dicc setValue:@"0" forKey:@"b"];
            self.nowNumber --;
        }
    [array replaceObjectAtIndex:indexPath.row withObject:dicc];
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithDictionary:self.modelArray[indexPath.section]];
    [d setValue:array forKey:@"m"];
    [self.modelArray replaceObjectAtIndex:indexPath.section withObject:d];
    [self.collectionView reloadData];
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((ScreenWidth - 60)/2, 110);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

- (void)buttonAction:(UIButton *)btn{
    
   // [self.collectionView reloadData];
    if (self.nowNumber <3 ) {
        [UIAlertView showWithTitle:@"提示" message:@"习惯不少于三个" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
    }
    else{
        //下一步
        CompleteDataOneViewController *vc = [[CompleteDataOneViewController alloc]init];
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

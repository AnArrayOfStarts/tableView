//
//  LXLFirstViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/6/3.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "LXLFirstViewController.h"

@interface LXLFirstViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
/** pickView */
@property (nonatomic ,strong) UIPickerView  *pickView;
/** tableView选择 */
@property (nonatomic ,strong) NSArray  *tableViewType;
/** cell类型选择 */
@property (nonatomic ,strong) NSArray  *cellType;
/** tableView选择 */
@property (nonatomic ,strong) NSString  *tableViewTypeSelect;
/** cell类型选择 */
@property (nonatomic ,strong) NSString  *cellTypeSelect;

/** 提示文本框 */
@property (nonatomic ,strong) UITextField  *hintTextField;
@property (nonatomic ,strong) UITextField  *hintTextField1;
/** 按钮 */
@property (nonatomic ,strong) UIButton  *btn;

@end

@implementation LXLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self getData];
    
}




/**
 *  行为
 */

#pragma mark - 生命周期

#pragma mark - 重写

#pragma mark - 初始化
-(void)config{
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIPickerView *pick = [UIPickerView new];
    pick.backgroundColor = [UIColor lightGrayColor];
    pick.delegate = self;
    pick.dataSource = self;
    self.hintTextField = TextField.fitSize.hint(@"提示tableView样式选择器选择");
    self.hintTextField1 = TextField.fitSize.hint(@"提示cell样式选择器选择");
    _btn = Button.fitSize.str(@"查看样式").onClick(^{
        LXLFirstTableViewController *first = [LXLFirstTableViewController new];
        first.cellType = self.cellTypeSelect;
        first.tableType = self.tableViewTypeSelect;
        first.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:first animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
    });
//    [_btn addTarget:self action:@selector(okBtn) forControlEvents:(UIControlEventTouchUpOutside)];
    
    HorStack(NERSpring,VerStack(@20,
                                self.hintTextField,
                                self.hintTextField1,
                                pick,
                                _btn,
                                @20),
             NERSpring).gap(10).embedIn(self.view);
    
    self.pickView = pick;
    
}
-(void)getData{
    _tableViewType = @[@"StylePlain",@"StyleGrouped"];
    _cellType = @[@"StyleValue1",@"StyleValue2",@"StyleDefault",@"StyleSubtitle"];
    _tableViewTypeSelect = @"StylePlain";
    _cellTypeSelect = @"StyleValue1";
}


#pragma mark - 方法

-(void)okBtn{
    

    
    

    
}

#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理

//pickView
// 返回分区数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
// 返回每个分区的cell个数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [_tableViewType count];
    }else{
        return _cellType.count;
    }
}

// 返回每个分区的title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return _tableViewType[row];
    }else{
        return _cellType[row];
    }
}
// 选择某一行调用
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger typeRow = [pickerView selectedRowInComponent:0];
    NSInteger cellRow = [pickerView selectedRowInComponent:1];
    [_hintTextField setText:[NSString stringWithFormat:@"tableview样式 ： %@",_tableViewType[typeRow]]];
    [_hintTextField1 setText:[NSString stringWithFormat:@"cell样式： %@",_cellType[cellRow]]];
    _tableViewTypeSelect = _tableViewType[typeRow];
    _cellTypeSelect = _cellType[cellRow];
}


#pragma mark - Get&Set
-(void)getTableViewTypeSelect:(id *)buffer range:(NSRange)inRange{
    
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

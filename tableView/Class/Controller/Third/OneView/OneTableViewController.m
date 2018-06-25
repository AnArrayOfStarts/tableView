//
//  OneTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/23.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "OneTableViewController.h"
#import "YSCellModel.h"

@interface OneTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation OneTableViewController




/**
 *  行为
 */

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    
}


#pragma mark - 重写

#pragma mark - 初始化

#pragma mark - 方法
-(void)config{
    
    UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tab.dataSource = self;
    tab.delegate = self;
    [self.view addSubview:tab];
    
    _nameArr = [NSMutableArray arrayWithObjects:@"名字1",@"名字2",@"名字3",@"名字4",@"名字5",@"名字6",@"名字7",@"名字8",@"名字9",@"名字10", nil];
    _messageArr = [NSMutableArray arrayWithObjects:@"你好1",@"你好2",@"你好3",@"你好4",@"你好5",@"你好6",@"你好7",@"你好8",@"你好9",@"你好10", nil];
    
    // 通过model赋值
    _model = [YSCellModel new];
    _model.name = @"名字（通过model赋值）";
    _model.message = @"你好";
    
}
#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理

#pragma mark - Get&Set
-(void)setNameArr:(NSMutableArray *)nameArr{
    if (_nameArr != nameArr) {
        _nameArr = nameArr;
    }
}
-(void)setMessageArr:(NSMutableArray *)messageArr{
    if (_messageArr != messageArr) {
        _messageArr = messageArr;
    }
}

#pragma mark - tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row%2 == 0) {
        // 通过cell的事件方法处理
        OneTableViewCell *oneCell = [OneTableViewCell createCellWithTableView:tableView];
        oneCell.myModel = _model;
        cell = oneCell;
    }else{
        // 通过传字符串处理
        TwoTableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId2];
        if (oneCell == nil) {
            oneCell = [[TwoTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kPlaceHolderCellId2];
        }
        oneCell.nameStr = _nameArr[indexPath.row];
        oneCell.messageStr = _messageArr[indexPath.row];
        cell = oneCell;
    }
    
    return cell;
}

@end

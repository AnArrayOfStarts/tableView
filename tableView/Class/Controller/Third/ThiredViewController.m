//
//  ThiredViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/19.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "ThiredViewController.h"

@interface ThiredViewController ()

@end

@implementation ThiredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    

    [self config];

}

-(void)config{
    self.navigationItem.title = @"选择界面";
    
    id oneCellLabel = Label.xy(10,10).fitSize.onClick(^{
        OneTableViewController * vc = [OneTableViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }).str(@"自定义cell界面(model传值，str传值)");
    id twoCellLabel = Label.fitSize.onClick(^{
        [self.navigationController pushViewController:[YSCanDeleteCellTableViewController new] animated:YES];
    }).str(@"可删除cell，自定义多个侧滑按钮");
    
    id threeCellLabel = Label.fitSize.onClick(^{
        [self.navigationController pushViewController:[YSCanRefreshTableViewController new] animated:YES];
    }).str(@"可刷新(MJRefesh)");
    
    
    id fourCellLabel = Label.fitSize.onClick(^{
        
        [self.navigationController pushViewController:[YSSystemStyleTableViewController new] animated:YES];
        self.hidesBottomBarWhenPushed = NO;// 退出时显示tabbar

    }).str(@"系统自带索引(多分区删除cell)");

    id fiveCellLabel = Label.fitSize.onClick(^{
        
        [self.navigationController pushViewController:[YSSearchTableViewController new] animated:YES];
        
    }).str(@"系统自带搜索、刷新");
    
    
    
    id hor1 = HorStack(NERSpring,oneCellLabel,NERSpring);
    id hor2 = HorStack(NERSpring,twoCellLabel,NERSpring);
    id hor3 = HorStack(NERSpring,threeCellLabel,NERSpring);
    id hor4 = HorStack(NERSpring,fourCellLabel,NERSpring);
    id hor5 = HorStack(NERSpring,fiveCellLabel,NERSpring);
    
    VerStack(NERSpring,
             @10,
             hor1,
             hor2,
             hor3,
             hor4,
             hor5,
             NERSpring).embedIn(self.view).gap(10);
    
    
    
}
/**
 *  行为
 */

#pragma mark - 生命周期

#pragma mark - 重写

#pragma mark - 初始化

#pragma mark - 方法
-(void)alertShow{
     Alert.title(@"Title").message(@"Message").action(@"OK",^{}).cancelAction(@"Cancel").show();
}

#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理

#pragma mark - Get&Set



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

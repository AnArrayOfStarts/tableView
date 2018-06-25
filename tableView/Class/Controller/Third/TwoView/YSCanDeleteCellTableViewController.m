//
//  YSCanDeleteCellTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/24.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSCanDeleteCellTableViewController.h"

@interface YSCanDeleteCellTableViewController ()

@end

@implementation YSCanDeleteCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self configData];

}

-(void)configData{
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity:1000];
    self.myArray = [NSMutableArray new];
    for (int i = 0; i<100; i++)
    {
        int n1 = arc4random()%26+97;
        int n2 = arc4random()%26+97;
        int n3 = arc4random()%26+97;
        int n4 = arc4random()%26+97;
        int n5 = arc4random()%26+97;
        //获得字符串
        NSString * str = [NSString stringWithFormat:@"%c%c%c%c%c",n1,n2,n3,n4,n5];
        
        [self.myArray addObject:str];
        
        //获得第一个字母，其实n1就是
        char ch = [str characterAtIndex:0];
        NSString * str01 = [NSString stringWithFormat:@"%c",ch-32];
        //从字典中获得关键字的集合
        NSArray * arr = [dict objectForKey:str01];
        //构建一个集合
        //NSArray * arr;
        NSMutableArray * array;
        //如果数组为空，则构建出来
        if (arr == nil)
        {
            //用这个字符串把集合创建出来
            arr = [NSArray arrayWithObject:str];
            //NSLog(@"test02=%@",arr);
            //构建动态数组
            array = [NSMutableArray arrayWithArray:arr];
        }
        //不为空，直接添加
        else
        {
            //用已有集合合成一个动态数组
            array = [NSMutableArray arrayWithArray:arr];
            //把字符串添加进去
            [array addObject:str];
        }
        [dict setObject:array forKey:str01];
    }
    self.allDictionary = [NSMutableDictionary new];
    self.allDictionary = dict;
    self.keysArray = [NSMutableArray new];
    self.keysArray = [NSMutableArray arrayWithArray:[[self.allDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.flag = NO;

    self.myArray = [NSMutableArray arrayWithArray:[self.myArray sortedArrayUsingSelector:@selector(compare:)]];
    
}

-(void)config{
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"进入编辑状态" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 初始化的时候是否是编辑状态
//    [self.tableView setEditing:YES animated:YES];

//    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRelodeData)];
//    self.tableView.mj_header.hidden = YES;
//    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [self.tableView.mj_header endRefreshing];
        });
    }];
    
    self.tableView.mj_footer= [MJRefreshFooter footerWithRefreshingBlock:^{
        [self.tableView.mj_footer beginRefreshing];
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [self.tableView.mj_footer endRefreshing];
        });
    }];
    
    
    
    
    
}

-(void)headerRelodeData{
//    [self.tableView.mj_header endRefreshing];
 
    kSHOW_TIP(@"头刷新");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

//    return self.keysArray.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

//    NSString *key = self.keysArray[section];
//    NSMutableArray *arr = [self.allDictionary objectForKey:key];
    
//    return arr.count;
    return self.myArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:kPlaceHolderCellId];
    }
    
//    NSString *key = [self.keysArray objectAtIndex:indexPath.section];
//    NSArray *arr = [[self.allDictionary objectForKey:key]sortedArrayUsingSelector:@selector(compare:)];
//    self.dataArray = [NSMutableArray arrayWithArray:arr];
//    cell.textLabel.text = self.dataArray[indexPath.row];
    
    cell.textLabel.text = self.myArray[indexPath.row];
    
    return cell;
}
// 返回分区头
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return self.keysArray[section];
//}

// 在编辑状态下可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}

// 选择cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 点击不变色（瞬间闪过）
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *str = [NSString stringWithFormat:@"选择了%ld区，%ld行",indexPath.section,indexPath.row];
    kSHOW_TIP(str);
}
// 返回cell支持的编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    //表示支持默认操作
//    return UITableViewCellEditingStyleNone;
    //表示支持删除操作
//    return UITableViewCellEditingStyleDelete;
    //表示支持新增操作
//    return UITableViewCellEditingStyleInsert;
    
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;

}

// 自定义编辑左滑后出现的界面。  不止只有一个delete按钮， 可以自行定义，返回一个数组。数组中放着UITableviewRowAction
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"关注" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了关注");

        // 收回左滑出现的按钮(退出编辑模式)
        tableView.editing = NO;
    }];

    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.myArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];

    return @[action1, action0];
}







// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}



// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//}

// 删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.myArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - 生命周期

#pragma mark - 重写

#pragma mark - 初始化

#pragma mark - 方法
-(void)rightAction{
    self.flag = !self.flag;
    self.tableView.editing = self.flag;
    self.tableView.allowsMultipleSelection = YES;
}
#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理

#pragma mark - Get&Set

@end

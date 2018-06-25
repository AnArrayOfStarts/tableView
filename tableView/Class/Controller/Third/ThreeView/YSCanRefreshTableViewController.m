//
//  YSCanRefreshTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/25.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSCanRefreshTableViewController.h"

@interface YSCanRefreshTableViewController ()

@end

@implementation YSCanRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray new];
    
    [self config];
    [self moreData];
    
    
    
}
-(void)loadNewData{
    [self moreData];
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });

    
}

-(void)loadfootData{
    [self moreData];
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];

    });
}

-(void)config{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    NSArray *test = [NSArray arrayWithObjects:Img(@"header4.jpg"),Img(@"header2.jpg"), nil];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态栏
    header.stateLabel.hidden = YES;
    
    // Set title
    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    
    // Set font
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // Set textColor
    header.stateLabel.textColor = [UIColor redColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    
    

    [header setImages:test forState:MJRefreshStateIdle];
    [header setImages:test forState:MJRefreshStatePulling];
    [header setImages:test forState:MJRefreshStateRefreshing];
    self.tableView.mj_header = header;

//    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        // 模拟延迟加载数据，因此2秒后才调用
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 结束刷新
//            [self.tableView.mj_header endRefreshing];
//        });
//    }];
    

    
    // 脚刷新
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        //Call this Block When enter the refresh status automatically
//    }];
    
    // Set the callback（Once you enter the refresh status，then call the action of target，that is call [self loadMoreData]）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadfootData)];
    
    
    // Hide the title of refresh status
    footer.refreshingTitleHidden = YES;
    
    //隐藏点击刷新
    footer.stateLabel.hidden = YES;
    
    self.tableView.mj_footer = footer;
    
    
    // 去掉空白行
    self.tableView.tableFooterView=[[UIView alloc] init];
    
    
}

-(void)moreData{
    
    for (int i = 0; i<3; i++)
    {
        int n1 = arc4random()%26+97;
        int n2 = arc4random()%26+97;
        int n3 = arc4random()%26+97;
        int n4 = arc4random()%26+97;
        int n5 = arc4random()%26+97;
        //获得字符串
        NSString * str = [NSString stringWithFormat:@"模拟数据：%c%c%c%c%c",n1,n2,n3,n4,n5];
        
        [self.dataArray addObject:str];
        
    }
    self.dataArray = [NSMutableArray arrayWithArray:[self.dataArray sortedArrayUsingSelector:@selector(compare:)]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:kPlaceHolderCellId];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// 返回cell支持的编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    //表示支持默认操作
    //return UITableViewCellEditingStyleNone;
    //表示支持删除操作
    //    return UITableViewCellEditingStyleDelete;
    //表示支持新增操作
    //    return UITableViewCellEditingStyleInsert;
    
    return UITableViewCellEditingStyleDelete ;
    
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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

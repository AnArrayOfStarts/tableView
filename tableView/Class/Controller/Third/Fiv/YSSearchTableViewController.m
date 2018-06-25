//
//  YSSearchTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/30.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSSearchTableViewController.h"

@interface YSSearchTableViewController ()<UISearchBarDelegate>

/** 全部数据 */
@property (nonatomic ,strong) NSMutableArray  *dataArray;

/** 模拟数据 */
@property (nonatomic ,strong) NSMutableArray  *tempArray;

/** searchBar */
@property (nonatomic ,strong) UISearchBar  *search;

@end

@implementation YSSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self moreData];
    
}

-(void)config{
    // 自带刷新控件。只可针对下拉刷新
    self.tableView.refreshControl = [UIRefreshControl new];
    [self.tableView.refreshControl addTarget:self action:@selector(tableViewGetMoreData) forControlEvents:(UIControlEventValueChanged)];
    self.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"lxl下拉刷新"];
    
    // 搜索框
//    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 120)];
    UISearchBar *search = [UISearchBar new];
    [search sizeToFit];
    search.placeholder = @"lxl搜索";
//    search.prompt = @"lxl的搜索框";
    search.autocorrectionType = UITextAutocorrectionTypeNo;
    search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.tableView.tableHeaderView = search;
    search.showsCancelButton = NO;
    search.tintColor = [UIColor orangeColor];
    
    search.delegate = self;
    self.search = search;
    
    self.tableView.tableFooterView = [UIView new];
    
    
}

-(void)tableViewGetMoreData{
    [self moreData];
    
    self.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"lxl加载中。。。"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束刷新
        [self.tableView.refreshControl endRefreshing];
        [self.tableView reloadData];

    });
    
}

// 获取新数据
-(void)moreData{
    
    if (self.dataArray.count == 0) {
        self.dataArray = [NSMutableArray new];
        
    }
    
    for (int i = 0; i<3; i++)
    {
        int n1 = arc4random()%26+97;
        int n2 = arc4random()%26+97;
        int n3 = arc4random()%26+97;
        int n4 = arc4random()%26+97;
        int n5 = arc4random()%26+97;
        //获得字符串
        NSString * str = [NSString stringWithFormat:@"%c%c%c%c%c",n1,n2,n3,n4,n5];
        
        [self.dataArray addObject:str];
        
    }
    self.dataArray = [NSMutableArray arrayWithArray:[self.dataArray sortedArrayUsingSelector:@selector(compare:)]];
    
    self.tempArray = [self.dataArray mutableCopy];
    
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

    return self.tempArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:kPlaceHolderCellId];
    }
    
    cell.textLabel.text = self.tempArray[indexPath.row];
    return cell;
}


/**
 *  行为
 */

#pragma mark - 生命周期

#pragma mark - 重写

#pragma mark - 初始化

#pragma mark - 方法

#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - searchBar 代理


-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"开始输入搜索内容");
    [searchBar setShowsCancelButton:YES animated:YES]; // 动画显示取消按钮
}

// 单机取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text= @"";
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
    self.tempArray = self.dataArray;
    [self.tableView reloadData];
    
}
// 单机搜索按钮
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"开始搜索");
    NSString * str1 = searchBar.text;
    NSMutableArray * temp = [NSMutableArray new];
    for (NSString *str in self.dataArray) {
        if ([str rangeOfString:str1].location != NSNotFound) {
            [temp addObject:str];
        }
    }
    self.tempArray = [temp mutableCopy];
    [self.tableView reloadData];
}


#pragma mark - Get&Set



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

@end

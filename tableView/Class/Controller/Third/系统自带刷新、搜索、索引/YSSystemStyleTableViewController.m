//
//  YSSystemStyleTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/29.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "YSSystemStyleTableViewController.h"

@interface YSSystemStyleTableViewController ()

@end

@implementation YSSystemStyleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    [self config];
    
    // 当删除单元后，dictionary 没有做排序
    
}


/**
 *  行为
 */

#pragma mark - 生命周期

#pragma mark - 重写

#pragma mark - 初始化

#pragma mark - 方法
-(void)config{
    
//    self.tableView.scrollEnabled = NO;
    
    
    
}

-(void)loadData{

    NSMutableDictionary * dict = [NSMutableDictionary new];
    
    if (self.dataArray.count == 0) {
        self.dataArray = [NSMutableArray new];
    }
    
    for (int i = 0; i<100; i++)
    {
        int n1 = arc4random()%26+97;
        int n2 = arc4random()%26+97;
        int n3 = arc4random()%26+97;
        int n4 = arc4random()%26+97;
        int n5 = arc4random()%26+97;
        //获得字符串
        NSString * str = [NSString stringWithFormat:@"%c%c%c%c%c",n1,n2,n3,n4,n5];
        
        [self.dataArray addObject:str];
        
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
            array = [NSMutableArray arrayWithArray:[arr sortedArrayUsingSelector:@selector(compare:)]];
        }
        //不为空，直接添加
        else
        {
            //用已有集合合成一个动态数组
            array = [NSMutableArray arrayWithArray:arr];
            //把字符串添加进去
            [array addObject:str];
            
            array = [NSMutableArray arrayWithArray:[array sortedArrayUsingSelector:@selector(compare:)]];
            
        }
        [dict setObject:array forKey:str01];
    }
    
    self.dictionary = [NSMutableDictionary new];
    self.dictionary = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    
    self.allKeys = [NSArray new];
    self.allKeys = [[self.dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
}

#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理

#pragma mark - Get&Set


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSString *str = self.allKeys[section];
    NSArray *arr = [self.dictionary mutableArrayValueForKey:str];
    
    return arr.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.allKeys[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:kPlaceHolderCellId];
    }
    
    NSString *str = self.allKeys[indexPath.section];
    self.dataArray = [self.dictionary mutableArrayValueForKey:str];

    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}


// 可以编辑
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {


        NSString *str = self.allKeys[indexPath.section];
        self.dataArray = [self.dictionary objectForKey:str];
        [self.dataArray removeObjectAtIndex:indexPath.row];
        if (self.dataArray.count == 0) {
            [self.dictionary removeObjectForKey:str];
            self.allKeys = [self.dictionary allKeys];
        }
        // 这样重新加载不能带动画的删除
//        [self.tableView reloadData];
        
        // 这样可以带动画的删除cell
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
        
        
        
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

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


//返回索引数组
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return [self.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSInteger count = 0;
    
    for (NSString *character in self.allKeys) {
        
        if ([[character uppercaseString] hasPrefix:title]) {
            return count;
        }
        count++;
    }
    
    return  0;
}






@end

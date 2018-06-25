//
//  LXLFirstTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/19.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "LXLFirstTableViewController.h"

@interface LXLFirstTableViewController ()


@end

@implementation LXLFirstTableViewController

@synthesize NameArr,NumArr;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    
}

#pragma mark 重写样式


#pragma mark 自定义行为


-(void)config{
//    self.title = @"系统tableViewController";
    self.navigationItem.title = @"系统tableView";
    NameArr = @[@"李一",@"姚二",@"张三",@"里斯",@"王五",@"找刘",@"钱七",@"刘八",@"学九",@"催十"];
    NumArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    
    
    if ([self.tableType isEqualToString:@"StylePlain"]) {
        
        self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    }else{
        
        self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    }
    self.tableView.tableFooterView = [UIView new];
    
}

#pragma mark - Table view data source
// 返回几个区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}
// 返回几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return NameArr.count;
}

// 返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    if (!cell) {
        if ([self.cellType isEqualToString:@"StyleValue1"]) {
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:kPlaceHolderCellId];
        }
        else if([self.cellType isEqualToString:@"StyleValue2"]){
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue2) reuseIdentifier:kPlaceHolderCellId];
        }
        else if([self.cellType isEqualToString:@"StyleDefault"]){
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kPlaceHolderCellId];
        }
        else{
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:kPlaceHolderCellId];
        }
    }
    // 默认就是以下4中可以调节的地方
    cell.imageView.image = [UIImage imageNamed:@"tab_0"];
    cell.textLabel.text = NameArr[indexPath.row];
    cell.detailTextLabel.text = NumArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}
// 点选cell行为
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"点击了  %@  的cell",NameArr[indexPath.row]];
    kSHOW_TIP(str);
}




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

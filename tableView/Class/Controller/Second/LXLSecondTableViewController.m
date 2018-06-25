//
//  LXLSecondTableViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/19.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "LXLSecondTableViewController.h"

@interface LXLSecondTableViewController ()

@end

@implementation LXLSecondTableViewController
@synthesize NameArr,NumArr;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

-(void)config{
    self.navigationItem.title = @"注册cell的复用";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kPlaceHolderCellId];
    NameArr = @[@"李一",@"姚二",@"张三",@"里斯",@"王五",@"找刘",@"钱七",@"刘八",@"学九",@"催十",@"李一",@"姚二",@"张三",@"里斯",@"王五",@"找刘",@"钱七",@"刘八",@"学九",@"催十"];
    NumArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
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

    return NameArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    
    
    cell.imageView.image = [UIImage imageNamed:@"tab_1"];
    cell.textLabel.text = NameArr[indexPath.row];
    cell.detailTextLabel.text = NumArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
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

//
//  LXLTabBarViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/19.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "LXLTabBarViewController.h"

@interface LXLTabBarViewController ()

@end

@implementation LXLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

-(void)config{
//    LXLFirstTableViewController *first = [[LXLFirstTableViewController alloc]initWithStyle:UITableViewStylePlain];
    LXLFirstViewController *first = [LXLFirstViewController new];
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:first];
    firstNav.tabBarItem.title = @"界面1";
    firstNav.tabBarItem.image = [UIImage imageNamed:@"tab_0"];
    firstNav.tabBarItem.badgeValue = @"5";
    
    LXLSecondTableViewController *second = [[LXLSecondTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:second];
    secondNav.tabBarItem.title = @"界面2";
    secondNav.tabBarItem.image = [UIImage imageNamed:@"tab_1"];
    secondNav.tabBarItem.badgeValue = @"1";
    
    
    ThiredViewController *thired = [ThiredViewController new];
    UINavigationController *thiredNav = [[UINavigationController alloc]initWithRootViewController:thired];
    thiredNav.tabBarItem.title = @"界面3";
    thiredNav.tabBarItem.image = [UIImage imageNamed:@"tab_2"];
    thiredNav.tabBarItem.badgeValue = @"0";
    
    
    FourViewController *four = [FourViewController new];
    UINavigationController *fourNav = [[UINavigationController alloc]initWithRootViewController:four];
    fourNav.tabBarItem.title = @"界面4";
    fourNav.tabBarItem.image = [UIImage imageNamed:@"tab_3"];
    
    
    self.viewControllers =  @[firstNav,secondNav,thiredNav,fourNav];
    
    // 当push隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;


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

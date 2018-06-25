//
//  FourViewController.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/19.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self config];
    
}

-(void)config{
    
    id lxlLable = Label.str(@"联动两个tableView").onClick(^{
        // 当push时隐藏底部栏，当pop时，显示
        YSLinkTwoTableViewViewController *linkTwo = [YSLinkTwoTableViewViewController new] ;
        linkTwo.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:linkTwo animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    });
    
    
    VerStack(NERSpring,
             HorStack(NERSpring,lxlLable,NERSpring),NERSpring).embedIn(self.view);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

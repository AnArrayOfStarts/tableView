//
//  OneTableViewController.h
//  tableView
//
//  Created by 李晓龙 on 2018/5/23.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSCellModel.h"
@interface OneTableViewController : UIViewController

/** 名字 */
@property (nonatomic ,strong) NSMutableArray  *nameArr;

/** 消息 */
@property (nonatomic ,strong) NSMutableArray  *messageArr;


/** model */
@property (nonatomic ,strong) YSCellModel  *model;

@end







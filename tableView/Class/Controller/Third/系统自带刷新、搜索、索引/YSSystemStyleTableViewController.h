//
//  YSSystemStyleTableViewController.h
//  tableView
//
//  Created by 李晓龙 on 2018/5/29.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSSystemStyleTableViewController : UITableViewController

/** 数据 */
@property (nonatomic ,strong) NSMutableArray  *dataArray;

/** 数据 - title */
@property (nonatomic ,strong) NSArray  *allKeys;


/** 字典 */
@property (nonatomic ,strong) NSMutableDictionary  *dictionary;



@end

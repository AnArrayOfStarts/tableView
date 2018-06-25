//
//  YSCanDeleteCellTableViewController.h
//  tableView
//
//  Created by 李晓龙 on 2018/5/24.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSCanDeleteCellTableViewController : UITableViewController

/** 数据数组 */
@property (nonatomic ,strong) NSMutableArray  *dataArray;

/** 关键字数组 */
@property (nonatomic ,strong) NSMutableArray  *keysArray;

/** 所有数据 */
@property (nonatomic ,strong) NSMutableDictionary  *allDictionary;

/** 数组 */
@property (nonatomic ,strong) NSMutableArray  *myArray;

/** bool */
@property (nonatomic ,assign) BOOL flag;

@end

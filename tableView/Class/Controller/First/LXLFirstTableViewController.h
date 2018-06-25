//
//  LXLFirstTableViewController.h
//  tableView
//
//  Created by 李晓龙 on 2018/5/19.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXLFirstTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *NameArr;
@property (nonatomic, strong) NSArray *NumArr;


/** cell类型 */
@property (nonatomic ,strong) NSString  *cellType;
/** tableType */
@property (nonatomic ,strong) NSString  *tableType;


@end

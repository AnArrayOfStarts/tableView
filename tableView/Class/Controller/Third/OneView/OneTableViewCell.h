//
//  OneTableViewCell.h
//  tableView
//
//  Created by 李晓龙 on 2018/5/23.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSCellModel.h"
@interface OneTableViewCell : UITableViewCell


+(instancetype)createCellWithTableView:(UITableView *)tableView;

/** model */
@property (nonatomic ,strong) YSCellModel  *myModel;

@end

//
//  OneTableViewCell.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/23.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "OneTableViewCell.h"


@interface OneTableViewCell()
/** 名字 */
@property (nonatomic ,strong) NSString  *nameStr;
/** label */
@property (nonatomic ,strong) UILabel  *nameLabel;

/** 消息 */
@property (nonatomic ,strong) NSString  *messageStr;
/** 消息 */
@property (nonatomic ,strong) UILabel  *messageLabel;
@end

@implementation OneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)createCellWithTableView:(UITableView *)tableView{
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceHolderCellId];
    if (cell == nil) {
        cell = [[OneTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kPlaceHolderCellId];
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        id headerView = ImageView.img(@"header2.jpg").borderRadius(40);
        _nameLabel = Label.fitSize.str(_myModel.name);
        _messageLabel = Label.fitSize.str(_myModel.message);
        id messageView = View;
        
        id verS1 = VerStack(@5,
                 _nameLabel,
                 _messageLabel,).gap(5).embedIn(messageView);
        id verS2 = VerStack(@5,
                            headerView,
                            @5);
        HorStack(@5,verS2,verS1,NERSpring).gap(15).embedIn(self);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMyModel:(YSCellModel *)myModel{
    _myModel = myModel;
    self.nameLabel.text = _myModel.name;
    self.messageLabel.text = _myModel.message;
    NSLog(@"执行了,%@",_myModel.name);
}

@end

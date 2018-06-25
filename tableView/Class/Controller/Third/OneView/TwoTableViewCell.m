//
//  TwoTableViewCell.m
//  tableView
//
//  Created by 李晓龙 on 2018/5/23.
//  Copyright © 2018年 李晓龙. All rights reserved.
//

#import "TwoTableViewCell.h"

@implementation TwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        id headerView = ImageView.img(@"header4.jpg").borderRadius(40);
        UILabel *nameLabel = Label.fitSize.str(_nameStr);
        UILabel *speakLabel = Label.fitSize.str(_messageStr);
        id messageView = View;
        
        id verS1 = VerStack(@5,
                            nameLabel,
                            speakLabel,).gap(5).embedIn(messageView);
        id verS2 = VerStack(@5,
                            headerView,
                            @5);
        HorStack(@5,verS2,verS1,NERSpring).gap(15).embedIn(self);
        
        [RACObserve(self, self.nameStr) subscribeNext:^(id  _Nullable x) {
            nameLabel.text = x;
        }];
        [RACObserve(self, messageStr) subscribeNext:^(id  _Nullable x) {
            speakLabel.text = x;
        }];
    }
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

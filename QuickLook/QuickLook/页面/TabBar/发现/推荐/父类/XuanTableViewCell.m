//
//  XuanTableViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/12.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "XuanTableViewCell.h"

@interface XuanTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *count;

@end
@implementation XuanTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(XuanCellModel *)model
{
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url]];
    self.title.text = model.title;
    float like = [model.likes_count floatValue];
    if (like > 10000.0)
    {
        like = like / 10000.0;
        self.count.text = [NSString stringWithFormat:@"%.0f万",like];
    }
    else
    {
        self.count.text = model.likes_count;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  XuanJiTableViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/11.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "XuanJiTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface XuanJiTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *likes_count;


@end

@implementation XuanJiTableViewCell

-(void)setModel:(XuanJiModel *)model
{
    [self.cover_image_url sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url]];
    self.title.text = model.title;
    float like = [model.likes_count floatValue];
    if (like > 10000.0)
    {
        like = like / 10000.0;
        self.likes_count.text = [NSString stringWithFormat:@"%.0f万",like];
    }
    else
    {
        self.likes_count.text = model.likes_count;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

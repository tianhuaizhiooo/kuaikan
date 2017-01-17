//
//  SuperReMenTableViewCell.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/19.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SuperReMenTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface SuperReMenTableViewCell  ()
@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;
@property (strong, nonatomic) IBOutlet UILabel *label_text;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UILabel *topTitle;
@property (strong, nonatomic) IBOutlet UILabel *buttomTitle;
@property (strong, nonatomic) IBOutlet UILabel *likes_count;
@property (strong, nonatomic) IBOutlet UILabel *comments_count;


@end

@implementation SuperReMenTableViewCell

-(void)setModel:(ReMenModel *)model
{
    
    [self.cover_image_url sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url]];
    self.label_text.text = model.label_text;
    self.buttomTitle.text = model.title;
    self.likes_count.text = model.likes_count;
    self.comments_count.text = model.comments_count;
    self.topTitle.text = model.topic.title;
    self.nickname.text = model.topic.user.nickname;
    
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

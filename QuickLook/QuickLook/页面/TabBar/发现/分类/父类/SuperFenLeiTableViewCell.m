//
//  SuperFenLeiTableViewCell.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/15.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SuperFenLeiTableViewCell.h"
#import "UIImageView+WebCache.h"


@interface SuperFenLeiTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel * nickname;
@property (strong, nonatomic) IBOutlet UILabel *likes_count;
@property (strong, nonatomic) IBOutlet UILabel *comments_count;


@end
@implementation SuperFenLeiTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(SuperModel *)model
{
    if (_model != model)
    {
        [self.cover_image_url sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url]];
        self.title.text = model.title;
        self.nickname.text = model.user.nickname;
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
        float comment = [model.comments_count floatValue];
        if (comment > 10000.0)
        {
            comment = comment / 10000.0;
            self.comments_count.text = [NSString stringWithFormat:@"%.0f万",comment];
        }
        else
        {
            self.comments_count.text = model.comments_count;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

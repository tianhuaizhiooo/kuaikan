//
//  SmallCollectionViewCell.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/16.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SmallCollectionViewCell.h"

@interface SmallCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UILabel *number;


@end

@implementation SmallCollectionViewCell

-(void)setModel:(PaiHangModel *)model
{
    _model = model;
    NSString * string = [model.pic stringByAppendingString:@"-w640"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    //NSLog(@"%@",model.pic);
    self.title.text = model.title;
    self.nickname.text = model.user.nickname;
    for (int i = 1; i < 1; i ++)
    {
        self.number.text = [NSString stringWithFormat:@"%d",i];
    }

}
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

@end

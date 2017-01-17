//
//  LiJianCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/23.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "LiJianCollectionViewCell.h"

@interface LiJianCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;


@end

@implementation LiJianCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

-(void)setLiJianModel:(LiJianModel *)liJianModel
{
    _liJianModel = liJianModel;
    NSString * string = [liJianModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = liJianModel.title;
    self.nickname.text = liJianModel.recommended_text;
}

@end

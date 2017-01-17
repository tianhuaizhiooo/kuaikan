//
//  KongBuCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/26.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "KongBuCollectionViewCell.h"

@interface KongBuCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;

@end
@implementation KongBuCollectionViewCell
-(void)setKongBuModel:(KongBuModel *)kongBuModel
{
    _kongBuModel = kongBuModel;
    NSString * string = [kongBuModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = kongBuModel.title;
    self.nickname.text = kongBuModel.user.nickname;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

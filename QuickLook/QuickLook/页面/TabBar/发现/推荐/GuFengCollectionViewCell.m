//
//  GuFengCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/26.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "GuFengCollectionViewCell.h"

@interface GuFengCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;

@end
@implementation GuFengCollectionViewCell
-(void)setGuFengModel:(GuFengModel *)guFengModel
{
    _guFengModel = guFengModel;
    NSString * string = [guFengModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = guFengModel.title;
    self.nickname.text = guFengModel.user.nickname;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

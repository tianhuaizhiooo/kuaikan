//
//  ShaoNvCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/26.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "ShaoNvCollectionViewCell.h"

@interface ShaoNvCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;

@end
@implementation ShaoNvCollectionViewCell
-(void)setShaoNvModel:(ShaoNvModel *)shaoNvModel
{
    _shaoNvModel = shaoNvModel;
    NSString * string = [shaoNvModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = shaoNvModel.title;
    self.nickname.text = shaoNvModel.user.nickname;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

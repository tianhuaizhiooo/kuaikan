//
//  ShaoNianCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/26.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "ShaoNianCollectionViewCell.h"

@interface ShaoNianCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;


@end

@implementation ShaoNianCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setShaoNianModel:(ShaoNianModel *)shaoNianModel
{
    _shaoNianModel = shaoNianModel;
    NSString * string = [shaoNianModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = shaoNianModel.title;
    self.nickname.text = shaoNianModel.user.nickname;
}

@end

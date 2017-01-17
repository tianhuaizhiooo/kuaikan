//
//  SmallerCollectionViewCell.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/16.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SmallerCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation SmallerCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

-(void)setNewModel:(NewModel *)NewModel
{
    _NewModel = NewModel;
    NSString * string = [NewModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = NewModel.title;
    [self.label_text setTitle:NewModel.label_text forState:UIControlStateNormal];
    self.xiangQing.text = NewModel.xiangQing;
    self.nickname.text = NewModel.user.nickname;
}

@end

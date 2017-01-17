//
//  FirstCollectionViewCell.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/15.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "FirstCollectionViewCell.h"

@interface FirstCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;


@end

@implementation FirstCollectionViewCell

-(void)setRenQiModel:(RenQimodel *)renQiModel
{
    _renQiModel = renQiModel;
    NSString * string = [renQiModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = renQiModel.title;
    self.nickname.text = renQiModel.recommended_text;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

@end

//
//  DanMeiCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/26.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "DanMeiCollectionViewCell.h"

@interface DanMeiCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;


@end
@implementation DanMeiCollectionViewCell
-(void)setDanMeiModel:(DanMeiModel *)danMeiModel
{
    _danMeiModel = danMeiModel;
    NSString * string = [danMeiModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = danMeiModel.title;
    self.nickname.text = danMeiModel.user.nickname;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

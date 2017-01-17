//
//  QingSongCollectionViewCell.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/26.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "QingSongCollectionViewCell.h"

@interface QingSongCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *nickname;

@end
@implementation QingSongCollectionViewCell
-(void)setQingSongModel:(QingSongModel *)qingSongModel
{
    _qingSongModel = qingSongModel;
    NSString * string = [qingSongModel.pic stringByAppendingString:@"-w320"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.title.text = qingSongModel.title;
    self.nickname.text = qingSongModel.user.nickname;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

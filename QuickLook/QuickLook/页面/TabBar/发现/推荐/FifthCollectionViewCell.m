//
//  FifthCollectionViewCell.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/15.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "FifthCollectionViewCell.h"

@interface FifthCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *target_title;

@end

@implementation FifthCollectionViewCell

-(void)setModel:(GuanFangModel *)model
{
    NSString * string = [model.pic stringByAppendingString:@"-w640"];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:string]];
    self.target_title.text = model.target_title;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

@end

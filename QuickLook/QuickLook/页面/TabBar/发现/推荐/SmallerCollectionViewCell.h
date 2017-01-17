//
//  SmallerCollectionViewCell.h
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/16.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModel.h"

@interface SmallerCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIButton * label_text;
@property (strong, nonatomic) IBOutlet UILabel *xiangQing;
@property(nonatomic,strong)NewModel * NewModel;
@property (strong, nonatomic) IBOutlet UILabel *nickname;

@end

//
//  ReMenCellViewController.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/30.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReMenModel.h"

@interface ReMenCellViewController : UIViewController

@property(nonatomic,strong)ReMenModel * model;
@property(nonatomic,copy)NSString * url;

@end

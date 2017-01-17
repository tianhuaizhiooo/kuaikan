//
//  NewModel.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/22.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewUserModel.h"

@interface NewModel : NSObject

@property(nonatomic,strong)NSString * pic;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * label_text;
@property(nonatomic,strong)NSString * xiangQing;
@property(nonatomic,strong)NewUserModel * user;

@end

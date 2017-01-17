//
//  ShaoNianModel.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/23.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewUserModel.h"

@interface ShaoNianModel : NSObject

@property(nonatomic,strong)NSString * pic;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NewUserModel * user;

@end

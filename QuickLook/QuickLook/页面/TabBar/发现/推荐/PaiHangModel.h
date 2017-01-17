//
//  PaiHangModel.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/23.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaiHangUserModel.h"

@interface PaiHangModel : NSObject

@property(nonatomic,strong)NSString * pic;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)PaiHangUserModel * user;

@end

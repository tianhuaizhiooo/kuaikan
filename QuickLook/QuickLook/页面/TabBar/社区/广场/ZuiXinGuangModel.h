//
//  ZuiXinGuangModel.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/28.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserGuangModel.h"
#import "ContentGuangModel.h"

@interface ZuiXinGuangModel : NSObject

@property(nonatomic,strong)NSString * likes_count;
@property(nonatomic,strong)NSString * comments_count;
@property(nonatomic,strong)UserGuangModel * user;
@property(nonatomic,strong)ContentGuangModel * content;

@end

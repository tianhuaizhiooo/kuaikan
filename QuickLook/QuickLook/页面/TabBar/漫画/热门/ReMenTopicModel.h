//
//  ReMenTopicModel.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/27.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReMenUserModel.h"
@interface ReMenTopicModel : NSObject

@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)ReMenUserModel * user;

@end

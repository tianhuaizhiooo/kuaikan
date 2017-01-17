//
//  TuiJianCellModel.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/11.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "TuiJianCellModel.h"

@implementation TuiJianCellModel

+(void)load
{
    [TuiJianCellModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *
     {
         return @{@"descriptiont":@"description"};
     }];
}

@end

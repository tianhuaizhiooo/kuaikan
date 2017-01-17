//
//  XiangCellModel.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/12.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "XiangCellModel.h"

@implementation XiangCellModel

+(void)load
{
    [XiangCellModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *
    {
        return @{@"descriptiont":@"description"};
    }];
}

@end

//
//  SuperModel.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/21.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SuperModel.h"

@implementation SuperModel

//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}

+(void)load
{
    [SuperModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *
    {
        return @{@"ID":@"id",@"descriptiont":@"description"};
    }];
}

@end

//
//  NewModel.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/22.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "NewModel.h"
#import "MJExtension.h"

@implementation NewModel

+(void)load
{
    [NewModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *
    {
        return @{@"xiangQing":@"description"};
    }];
}
/*
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _xiangQing = (NSString *)value;
    }
}
 */
@end

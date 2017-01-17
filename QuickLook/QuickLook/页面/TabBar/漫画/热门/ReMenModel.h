//
//  ReMenModel.h
//  QuickLook
//
//  Created by 田怀志 on 16/12/27.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReMenTopicModel.h"
typedef enum
{
    ListNumberOne = 1481040000,
    ListNumberTwo = 1481126400,
    ListNumberThree = 1481212800,
    ListNumberFore = 1481299200,
    ListNumberFive = 1481385600,
    ListNumberSix = 1,
    ListNumberSeven = 0
}ListNumber;

@interface ReMenModel : NSObject

@property(nonatomic,strong)NSString * cover_image_url;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * likes_count;
@property(nonatomic,strong)NSString * comments_count;
@property(nonatomic,strong)NSString * label_text;
@property(nonatomic,strong)ReMenTopicModel * topic;
@property(nonatomic,copy)NSString * url;

@end

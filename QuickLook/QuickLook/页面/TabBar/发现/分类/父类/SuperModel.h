//
//  SuperModel.h
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/21.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Usermodel.h"

typedef enum
{
    TagIDAll = 0, //全部
    TagIDLianAi = 20, //恋爱
    TagIDDanMei = 36, //耽美
    TagIDKongBu = 32, //恐怖
    TagIDGuFeng = 46, //古风
    TagIDBaoXiao = 24, //爆笑
    TagIDQiHuan = 22, //奇幻
    TagIDXiaoYuan = 47, //校园
    TagIDDuShi = 48, //都市
    TagIDShaoNian = 49, //少年
    TagIDZhiYu = 27, //治愈
    TagIDBaiHe = 45, //百合
    TagIDWanJie = 40 //完结
}TagID;
@interface SuperModel : NSObject
//封面图片
@property(nonatomic,strong)NSString * cover_image_url;
//标题
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)Usermodel * user;
//点赞数
@property(nonatomic,strong)NSString * likes_count;
//评论数
@property(nonatomic,strong)NSString * comments_count;

@property(nonatomic,strong)NSString * ID;

@property(nonatomic,strong)NSString * descriptiont;


@end

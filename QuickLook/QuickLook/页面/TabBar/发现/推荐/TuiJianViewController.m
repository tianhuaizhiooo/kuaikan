//
//  TuiJianViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/14.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "TuiJianViewController.h"
#import "FirstCollectionViewCell.h"
#import "SecondCollectionViewCell.h"
#import "FifthCollectionViewCell.h"
#import "CollectionReusableView.h"
#import "SecondCollectionReusableView.h"
#import "SmallConllectionCellViewController.h"
#import "SmallerCollectionViewController.h"
#import "DuanManViewController.h"
#import "WanJiaViewController.h"
#import "LiJianCollectionViewCell.h"
#import "ShaoNvCollectionViewCell.h"
#import "DanMeiCollectionViewCell.h"
#import "ShaoNianCollectionViewCell.h"
#import "GuFengCollectionViewCell.h"
#import "KongBuCollectionViewCell.h"
#import "QingSongCollectionViewCell.h"
#import "TuiJianCollectionViewController.h"

@interface TuiJianViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)SmallConllectionCellViewController * smallCVC;
@property(nonatomic,strong)SmallerCollectionViewController * smallerCVC;
@property(nonatomic,strong)DuanManViewController * duanManVC;
@property(nonatomic,strong)WanJiaViewController * wanJieVC;

@property(nonatomic,strong)AFHTTPSessionManager * manager;
@property(nonatomic,strong)NSMutableArray * muArray;
@property(nonatomic,strong)UICollectionView * collectionV;
@property(nonatomic,strong)NSMutableArray * renQiArray;
@property(nonatomic,strong)NSMutableArray * liJianArray;
@property(nonatomic,strong)NSMutableArray * shaoNianArray;
@property(nonatomic,strong)NSMutableArray * danMeiArray;
@property(nonatomic,strong)NSMutableArray * shaoNvArray;
@property(nonatomic,strong)NSMutableArray * guFengArray;
@property(nonatomic,strong)NSMutableArray * kongBuArray;
@property(nonatomic,strong)NSMutableArray * qingSongArray;
@property(nonatomic,strong)NSMutableArray * allArray;

@end

@implementation TuiJianViewController
static NSString * const cellResueIndentifire = @"collectionCell";
static NSString * const secondResueIndentifire = @"secondCollectionCell";
static NSString * const fifthResueIndentifire = @"fifthCollectionCell";
static NSString * const headerRe = @"header";
static NSString * const SecondHeaderRe = @"SecondHeader";
static NSString * const liJianRe = @"liJianCollectionCell";
static NSString * const shaoNianRE = @"shaoNianCollectionCell";
static NSString * const shaoNvRE = @"shaoNvCollectionCell";
static NSString * const danMeiRE = @"danMeiCollectionCell";
static NSString * const guFengRE = @"guFengCollectionCell";
static NSString * const kongBuRE = @"kongBuCollectionCell";
static NSString * const qingSongRE = @"qingSongCollectionCell";

-(AFHTTPSessionManager *)manager
{
    if (! _manager)
    {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //总的collectionview
    _muArray = [NSMutableArray array];
    _renQiArray = [NSMutableArray array];
    _liJianArray = [NSMutableArray array];
    _shaoNianArray = [NSMutableArray array];
    _danMeiArray = [NSMutableArray array];
    _shaoNvArray = [NSMutableArray array];
    _guFengArray = [NSMutableArray array];
    _kongBuArray = [NSMutableArray array];
    _qingSongArray = [NSMutableArray array];
    _allArray = [NSMutableArray array];
    
    UICollectionViewFlowLayout * flowLay =[[UICollectionViewFlowLayout alloc]init];
    UICollectionView * collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 62, self.view.frame.size.width, self.view.frame.size.height - 110) collectionViewLayout:flowLay];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    //注册人气的cell
    [collectionView registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellResueIndentifire];
    //注册的cell
    [collectionView registerNib:[UINib nibWithNibName:@"SecondCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:secondResueIndentifire];
    //注册第二种collectioview
    [collectionView registerNib:[UINib nibWithNibName:@"FifthCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:fifthResueIndentifire];
    //注册主编力荐的cell
    [collectionView registerNib:[UINib nibWithNibName:@"LiJianCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:liJianRe];
    //注册少年的cell
    [collectionView registerNib:[UINib nibWithNibName:@"ShaoNianCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:shaoNianRE];
    //注册少女的cell
    [collectionView registerNib:[UINib nibWithNibName:@"ShaoNvCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:shaoNvRE];
    //注册耽美的cell
    [collectionView registerNib:[UINib nibWithNibName:@"DanMeiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:danMeiRE];
    //注册古风的cell
    [collectionView registerNib:[UINib nibWithNibName:@"GuFengCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:guFengRE];
    //注册恐怖的cell
    [collectionView registerNib:[UINib nibWithNibName:@"KongBuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kongBuRE];
    //注册轻松的cell
    [collectionView registerNib:[UINib nibWithNibName:@"QingSongCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:qingSongRE];
    //注册第一种header
    [collectionView registerNib:[UINib nibWithNibName:@"CollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerRe];
    //注册第二种header
    [collectionView registerNib:[UINib nibWithNibName:@"SecondCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SecondHeaderRe];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    _collectionV = collectionView;
    [self.view addSubview:_collectionV];
    
    [self netWorking];
    [self renQiNetWorking];
    [self shaoNianNetWorking];
    [self liJianNetWorking];
    [self danMeiNetWorking];
    [self shaoNvNetWorking];
    [self guFengtWorking];
    [self kongBuNetWorking];
    [self qingSongNetWorking];
    [self allNetWorking];
    // Do any additional setup after loading the view.
}

-(void)allNetWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSMutableDictionary * muDic = [NSMutableDictionary dictionary];
         for (NSDictionary * dic in arrr)
         {
             
             muDic = [NSMutableDictionary dictionaryWithDictionary:dic];
         }
         NSArray * arrayt = muDic[@"topics"];        
         NSArray * array = [TuiJianCellModel mj_objectArrayWithKeyValuesArray:arrayt];
         [weakSelf.allArray addObjectsFromArray:array];
         
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSLog(@"===============%@==========",error);
     }];
}

//官方活动网络请求
-(void)netWorking
{
    //[self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSArray * arrr = responseObject[@"data"][@"infos"];
        NSDictionary * dic = arrr[9];
        NSArray * array = [GuanFangModel mj_objectArrayWithKeyValuesArray:dic[@"banners"]];
        [weakSelf.muArray addObjectsFromArray:array];
        // 刷新表格
        [weakSelf.collectionV reloadData];
        //NSLog(@"\n\n\n\n=============================%@\n\n\n\n",_muArray);
        // 结束刷新
        [weakSelf.collectionV.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"===============%@==========",error);
    }];
}

//人气飙升网络请求
-(void)renQiNetWorking
{
    //[self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[3];
         NSArray * array = [RenQimodel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.renQiArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//主编力荐网络请求
-(void)liJianNetWorking
{
    //[self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[4];
         NSArray * array = [LiJianModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.liJianArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//少年热血网络请求
-(void)shaoNianNetWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[6];
         NSArray * array = [ShaoNianModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.shaoNianArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//耽美BL网络请求
-(void)danMeiNetWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[7];
         NSArray * array = [DanMeiModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.danMeiArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//少女纯爱网络请求
-(void)shaoNvNetWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[8];
         NSArray * array = [ShaoNvModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.shaoNvArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//绝美古风网络请求
-(void)guFengtWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[10];
         NSArray * array = [GuFengModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.guFengArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//恐怖悬疑网络请求
-(void)kongBuNetWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[11];
         NSArray * array = [KongBuModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.kongBuArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}
//轻松爆笑网络请求
-(void)qingSongNetWorking
{
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[12];
         NSArray * array = [QingSongModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         [weakSelf.qingSongArray addObjectsFromArray:array];
         // 刷新表格
         [weakSelf.collectionV reloadData];
         
         // 结束刷新
         [weakSelf.collectionV.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 14;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 1;
    }
    else if (section == 3)
    {
        return MIN(_renQiArray.count, 6);
    }
    else if (section == 4)
    {
        
        return MIN(_liJianArray.count,6);
    }
    else if (section == 5)
    {
        return 1;
    }
    else if (section == 6)
    {
        return MIN(_shaoNianArray.count,6);
    }
    else if (section == 7)
    {
        return MIN(_danMeiArray.count,6);
        return 6;
    }
    else if (section == 8)
    {
        return MIN(_shaoNvArray.count, 6);
    }
    else if (section == 9)
    {
        return MIN(_muArray.count,2);
        //return 2;
    }
    else if (section == 10)
    {
        return MIN(_guFengArray.count, 6);
    }
    else if (section == 11)
    {
        return MIN(_kongBuArray.count, 6);
    }
    else if (section == 12)
    {
        return MIN(_qingSongArray.count, 6);
    }
    else
    {
        return 1;
    }
}

//最小左右间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//最下上下间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//上左下右边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 10, 10);
}

//设置每一个section中item的大小 1  2  5  13
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 9)
    {
        return CGSizeMake(190, 130);
    }
    else if (indexPath.section == 2 || indexPath.section == 5 || indexPath.section == 13)
    {
        return CGSizeMake(self.view.frame.size.width - 20, 200);
    }
    else if (indexPath.section == 1 )
    {
        return CGSizeMake(self.view.frame.size.width - 20, 300);
    }
    else
    {
        return CGSizeMake(120, 200);
    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 9)
    {
        FifthCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:fifthResueIndentifire forIndexPath:indexPath];
        cell.model = self.muArray[indexPath.item];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 1)
    {
        SecondCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondResueIndentifire forIndexPath:indexPath];
        _smallCVC = [[SmallConllectionCellViewController alloc]init];
        [self addChildViewController:_smallCVC];
        
        [cell addSubview:_smallCVC.view];
        return cell;
    }
    else if (indexPath.section == 2)
    {
        SecondCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondResueIndentifire forIndexPath:indexPath];
        
        _smallerCVC = [[SmallerCollectionViewController alloc]init];
        [self addChildViewController:_smallerCVC];
        
        [cell addSubview:_smallerCVC.view];
        return cell;
    }
    else if (indexPath.section == 3)
    {
        FirstCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellResueIndentifire forIndexPath:indexPath];
        cell.renQiModel = self.renQiArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 4)
    {
        LiJianCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:liJianRe forIndexPath:indexPath];
        cell.liJianModel = self.liJianArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 5)
    {
        SecondCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondResueIndentifire forIndexPath:indexPath];
        
        _duanManVC = [[DuanManViewController alloc]init];
        [self addChildViewController:_duanManVC];
        
        [cell addSubview:_duanManVC.view];
        return cell;
    }
    else if (indexPath.section == 6)
    {
        ShaoNianCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:shaoNianRE forIndexPath:indexPath];
        cell.shaoNianModel = self.shaoNianArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 7)
    {
        DanMeiCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:danMeiRE forIndexPath:indexPath];
        cell.danMeiModel = self.danMeiArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 8)
    {
        ShaoNvCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:shaoNvRE forIndexPath:indexPath];
        cell.shaoNvModel = self.shaoNvArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 10)
    {
        GuFengCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:guFengRE forIndexPath:indexPath];
        cell.guFengModel = self.guFengArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 11)
    {
        KongBuCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:kongBuRE forIndexPath:indexPath];
        cell.kongBuModel = self.kongBuArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 12)
    {
        QingSongCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:qingSongRE forIndexPath:indexPath];
        cell.qingSongModel = self.qingSongArray[indexPath.item];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 13)
    {
        SecondCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondResueIndentifire forIndexPath:indexPath];
        _wanJieVC = [[WanJiaViewController alloc]init];
        [self addChildViewController:_wanJieVC];
        [cell addSubview:_wanJieVC.view];
        return cell;
    }
    else
    {
        FirstCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellResueIndentifire forIndexPath:indexPath];
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(0, 0);
    }
    else
    {
        return CGSizeMake(30, 40);
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 5 || indexPath.section == 13)
    {
        SecondCollectionReusableView * header =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SecondHeaderRe forIndexPath:indexPath];
        
        header.backgroundColor=[UIColor whiteColor];
        return header;
    }
    else
    {
        CollectionReusableView * header=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerRe forIndexPath:indexPath];
        header.backgroundColor=[UIColor whiteColor];
        return header;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TuiJianCollectionViewController * tuiJianCVC = [[TuiJianCollectionViewController alloc]init];
    
    TuiJianCellModel * model = self.allArray[indexPath.row];
    tuiJianCVC.ID = [model target_id];
    NSLog(@"???????????%@",tuiJianCVC.ID);
    //NSString * str = [model pic];
    tuiJianCVC.pic = [[model pic] stringByAppendingString:@"-w640"];
    tuiJianCVC.xiangqing = [model descriptiont];
    [self.navigationController pushViewController:tuiJianCVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

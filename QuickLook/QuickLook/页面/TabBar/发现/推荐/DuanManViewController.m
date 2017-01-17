//
//  DuanManViewController.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/23.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "DuanManViewController.h"
#import "SmallerCollectionViewCell.h"

@interface DuanManViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)AFHTTPSessionManager * manager;
@property(nonatomic,strong)NSMutableArray * muArray;

@end

@implementation DuanManViewController

-(AFHTTPSessionManager *)manager
{
    if (!_manager)
    {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _muArray = [NSMutableArray array];
    
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 20, 200) collectionViewLayout:flowlayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"SmallerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    [self netWorking];
    // Do any additional setup after loading the view.
}

-(void)netWorking
{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSString * url = @"http://api.kkmh.com/v1/topic_new/discovery_list?sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5peg5rOV6I635Y-WIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLmjqjojZAiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTQ1NTQ5NTMsInR5cGUiOiJ0cmFjayJ9";
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         NSArray * arrr = responseObject[@"data"][@"infos"];
         NSDictionary * dic = arrr[5];
         
         NSArray * arr = [NewModel mj_objectArrayWithKeyValuesArray:dic[@"topics"]];
         //NSLog(@"%lu",(unsigned long)arr.count);
         [weakSelf.muArray addObjectsFromArray:arr];
         // 刷新表格
         [weakSelf.collectionView reloadData];
         
         // 结束刷新
         [weakSelf.collectionView.mj_header endRefreshing];
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _muArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width - 100, 200);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SmallerCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.NewModel = self.muArray[indexPath.item];
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
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

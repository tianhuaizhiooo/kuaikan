//
//  SuperFenLeiViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/15.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SuperFenLeiViewController.h"
#import "SuperFenLeiTableViewCell.h"
#import "AFNetworking.h"
#import "FenLeiCellViewController.h"
#import "XiangQingViewController.h"

@interface SuperFenLeiViewController ()

@property(nonatomic,strong)AFHTTPSessionManager * manger;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,assign)int page;

@end

@implementation SuperFenLeiViewController

static NSString * const SuperCellResue = @"FenLeiCell";

-(AFHTTPSessionManager *)manger
{
    if (!_manger)
    {
        _manger = [AFHTTPSessionManager manager];
    }
    return _manger;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _page = 0;
    _dataArray = [NSMutableArray array];
    [self refresh];
    //[self request];
    [self setUpTableView];
    
}

-(void)setUpTableView
{
    self.tableView.backgroundColor = [UIColor whiteColor];
    //更改tableviewde位置(顶部位置)
    //self.tableView.contentInset = UIEdgeInsetsMake(0, 62, 0, 0);
    
    //更改右侧指示条位置
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SuperFenLeiTableViewCell" bundle:nil] forCellReuseIdentifier:SuperCellResue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)request
{
    [self.manger.tasks makeObjectsPerformSelector:@selector(cancel)];
    
        NSString * url = [NSString stringWithFormat:@"http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=%d&since=0&count=20&sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5YWo6YOoIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5YiG57G7IiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLliIbnsbsiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTU0NjcxMDEsInR5cGUiOiJ0cmFjayJ9",self.tagIds];
    
    WeakSelf;
    [self.manger GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSArray * array = responseObject[@"data"][@"topics"];
        //NSLog(@"%@",responseObject[@"data"][@"topics"]);
        NSArray * arrr = [SuperModel mj_objectArrayWithKeyValuesArray:array];
        
        [weakSelf.dataArray addObjectsFromArray:arrr];
        
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"%@",error);
    }];
}

-(void)moreReauest
{
    [self.manger.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    self.page =+ 20 ;
    
        NSString * url = [NSString stringWithFormat:@"http://api.kkmh.com/v1/topic_new/lists/get_by_tag?tag=%d&since=%d&count=20&sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEZpbmRQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkNhdGVnb3J5Ijoi5YWo6YOoIiwiRmluZENhdGVnb3J5VGFiTmFtZSI6IuWFqOmDqCIsIkZpbmRUYWJOYW1lIjoi5YiG57G7IiwiRnJvbUZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGcm9tRmluZFRhYk5hbWUiOiLliIbnsbsiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjEsIlRyaWdnZXJQYWdlIjoiSG9tZVBhZ2UiLCJWQ29tbXVuaXR5VGFiTmFtZSI6IueDremXqCIsIlByb3BlcnR5RXZlbnQiOiJSZWFkRmluZFBhZ2UiLCIkYXBwX3ZlcnNpb24iOiIzLjUuMSIsIiRsaWJfdmVyc2lvbiI6IjEuNi4xMyIsIiRtYW51ZmFjdHVyZXIiOiJIVUFXRUkiLCIkbW9kZWwiOiJGUkQtQUwxMCIsIiRvcyI6IkFuZHJvaWQiLCIkb3NfdmVyc2lvbiI6IjYuMCIsIiRzY3JlZW5faGVpZ2h0IjoxOTIwLCIkc2NyZWVuX3dpZHRoIjoxMDgwLCIkd2lmaSI6dHJ1ZSwiJGNhcnJpZXIiOiLkuK3lm73nlLXkv6EiLCIkbmV0d29ya190eXBlIjoiV0lGSSIsImFidGVzdF9ncm91cCI6MH0sInRpbWUiOjE0ODE1OTU0NjcxMDEsInR5cGUiOiJ0cmFjayJ9",self.tagIds,self.page];
    WeakSelf;
    [self.manger GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSArray * array = responseObject[@"data"][@"topics"];
        NSArray * arrr = [SuperModel mj_objectArrayWithKeyValuesArray:array];
        [weakSelf.dataArray addObjectsFromArray:arrr];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        
    }];
    
}

-(void)refresh
{
    [self request];
    WeakSelf;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^
    {
        [weakSelf request];
    }];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^
    {
        [weakSelf moreReauest];
    }];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuperFenLeiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SuperCellResue];
    cell.model = self.dataArray[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FenLeiCellViewController * fenLeiVC = [[FenLeiCellViewController alloc]init];
    //NSLog(@"\n\n\n\n\n%f+++++++",fenLeiVC.view.frame.size.width);
    
    SuperModel * model = self.dataArray[indexPath.row];
    fenLeiVC.ID = [model ID];
    [self.navigationController pushViewController:fenLeiVC animated:YES];
    fenLeiVC.xiangqing = [model descriptiont];
    fenLeiVC.cover_image_urll = [model cover_image_url];
    self.tabBarController.tabBar.hidden = YES;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

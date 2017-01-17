//
//  XuanTableViewController.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/11.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "XuanTableViewController.h"
#import "XuanTableViewCell.h"
#import "XuanDianViewController.h"

@interface XuanTableViewController ()

@property(nonatomic,strong)AFHTTPSessionManager * manger;
@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation XuanTableViewController

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
    _dataArray = [NSMutableArray array];
    NSLog(@"******%@",self.ID);
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XuanTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self AFNetworking];
    
}

-(void)AFNetworking
{
    [self.manger.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSString * url = [NSString stringWithFormat:@"http://api.kkmh.com/v1/topics/%@?sort=0&sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZFRvcGljIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkF1dGhvcklEIjoyODQ1NjY4NiwiQ2F0ZWdvcnkiOiLml6Dms5Xojrflj5YiLCJDb21pY0lEIjowLCJDb21pY05hbWUiOiLml6Dms5Xojrflj5YiLCJDb21pY1BhZ2VJdGVtTmFtZSI6IuaXoOazleiOt-WPliIsIkNvbWljUGFnZVRyaWdnZXJJdGVtIjowLCJGaW5kQ2F0ZWdvcnlTb3J0VHlwZSI6IuaXoOazleiOt-WPliIsIkZpbmRDYXRlZ29yeVRhYk5hbWUiOiLlhajpg6giLCJGaW5kVGFiTmFtZSI6IuaOqOiNkCIsIkdlbmRlclR5cGUiOiLlpbPniYgiLCJIb21lcGFnZVRhYk5hbWUiOiLng63pl6giLCJIb21lcGFnZVVwZGF0ZURhdGUiOjAsIkxpc3RUeXBlIjoi5peg5rOV6I635Y-WIiwiTmlja05hbWUiOiJZdWUgQW1leWEiLCJTb3J0VHlwZSI6IuaXoOazleiOt-WPliIsIlRvcGljSUQiOjk4MywiVG9waWNOYW1lIjoi6Kej5byA5L2g55qE5Yi25pyNIiwiVG9waWNUYWJOYW1lIjoi5YaF5a65IiwiVHJpZ2dlckl0ZW0iOjIsIlRyaWdnZXJJdGVtTmFtZSI6Iuino-W8gOS9oOeahOWItuacjSIsIlRyaWdnZXJJdGVtVHlwZSI6MTQsIlRyaWdnZXJPcmRlck51bWJlciI6MSwiVHJpZ2dlclBhZ2UiOiJGaW5kUGFnZSIsIlZpc2l0UGFnZU5hbWUiOiLml6Dms5Xojrflj5YiLCJQcm9wZXJ0eUV2ZW50IjoiUmVhZFRvcGljIiwiYWJ0ZXN0X2dyb3VwIjo2MywiJGFwcF92ZXJzaW9uIjoiMy42LjIiLCIkbGliX3ZlcnNpb24iOiIxLjYuMTMiLCIkbWFudWZhY3R1cmVyIjoiSFVBV0VJIiwiJG1vZGVsIjoiRlJELUFMMTAiLCIkb3MiOiJBbmRyb2lkIiwiJG9zX3ZlcnNpb24iOiI2LjAiLCIkc2NyZWVuX2hlaWdodCI6MTkyMCwiJHNjcmVlbl93aWR0aCI6MTA4MCwiJHdpZmkiOnRydWUsIiRjYXJyaWVyIjoi5Lit5Zu955S15L-hIiwiJG5ldHdvcmtfdHlwZSI6IldJRkkifSwidGltZSI6MTQ4NDEyNjM4NDIyNywidHlwZSI6InRyYWNrIn0@%%3D",self.ID];
    WeakSelf;
    [self.manger GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSArray * array = responseObject[@"data"][@"comics"];
         NSArray * arrr = [XuanCellModel mj_objectArrayWithKeyValuesArray:array];
         [weakSelf.dataArray addObjectsFromArray:arrr];
         [weakSelf.tableView reloadData];
         [weakSelf.tableView.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XuanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XuanDianViewController * view = [[XuanDianViewController alloc]init];
    XuanCellModel * model = self.dataArray[indexPath.row];
    view.url = [model url];
    [self.navigationController pushViewController:view animated:YES];
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

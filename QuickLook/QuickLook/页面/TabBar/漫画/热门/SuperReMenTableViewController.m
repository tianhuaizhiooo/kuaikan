//
//  SuperReMenTableViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/19.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "SuperReMenTableViewController.h"
#import "SuperReMenTableViewCell.h"
#import "ReMenCellViewController.h"

@interface SuperReMenTableViewController ()

@property(nonatomic,strong)AFHTTPSessionManager * manager;
@property(nonatomic,strong)NSMutableArray * dataArray;
//@property(nonatomic,strong)NSString * url;

@end

@implementation SuperReMenTableViewController
static NSString * const SuperCellResue = @"ReMenCell";

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
    _dataArray = [NSMutableArray array];
    
    [self setUpTableView];
    [self request];
}

-(void)setUpTableView
{
    self.tableView.backgroundColor = [UIColor whiteColor];
    //更改tableviewde位置(顶部位置)
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 113, 0);
    
    //更改右侧指示条位置
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SuperReMenTableViewCell class]) bundle:nil] forCellReuseIdentifier:SuperCellResue];
}

-(void)request
{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSString * url = [NSString stringWithFormat:@"http://api.kkmh.com/v1/daily/comic_lists/%d?since=0&sa_event=eyJkaXN0aW5jdF9pZCI6IkE6ZWVkYmE4YWJkZGIxNGZkZSIsImV2ZW50IjoiUmVhZEhvbWVQYWdlIiwib3JpZ2luYWxfaWQiOiJBOmVlZGJhOGFiZGRiMTRmZGUiLCJwcm9qZWN0Ijoia3VhaWthbl9hcHAiLCJwcm9wZXJ0aWVzIjp7IkZpbmRUYWJOYW1lIjoi5o6o6I2QIiwiRnJvbUhvbWVwYWdlVGFiTmFtZSI6IueDremXqCIsIkZyb21Ib21lcGFnZVVwZGF0ZURhdGUiOjIsIkhvbWVwYWdlVGFiTmFtZSI6IueDremXqCIsIkhvbWVwYWdlVXBkYXRlRGF0ZSI6MywiVHJpZ2dlclBhZ2UiOiJIb21lUGFnZSIsIlZDb21tdW5pdHlUYWJOYW1lIjoi54Ot6ZeoIiwiUHJvcGVydHlFdmVudCI6IlJlYWRIb21lUGFnZSIsIiRhcHBfdmVyc2lvbiI6IjMuNS4xIiwiJGxpYl92ZXJzaW9uIjoiMS42LjEzIiwiJG1hbnVmYWN0dXJlciI6IkhVQVdFSSIsIiRtb2RlbCI6IkZSRC1BTDEwIiwiJG9zIjoiQW5kcm9pZCIsIiRvc192ZXJzaW9uIjoiNi4wIiwiJHNjcmVlbl9oZWlnaHQiOjE5MjAsIiRzY3JlZW5fd2lkdGgiOjEwODAsIiR3aWZpIjp0cnVlLCIkY2FycmllciI6IuS4reWbveeUteS_oSIsIiRuZXR3b3JrX3R5cGUiOiJXSUZJIiwiYWJ0ZXN0X2dyb3VwIjowfSwidGltZSI6MTQ4MTU5NDQ5MDI3MSwidHlwZSI6InRyYWNrIn0@%%3D",self.listNumber];
    WeakSelf;
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSArray * array = responseObject[@"data"][@"comics"];
//        for (NSDictionary * dic in array)
//        {
//            _url = dic[@"url"];
//            //NSLog(@"%@",str);
//        }
        //NSLog(@"~~~~~~~~%@",_urlDic);
        NSArray * arrr = [ReMenModel mj_objectArrayWithKeyValuesArray:array];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 310;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuperReMenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SuperCellResue forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.item];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReMenCellViewController * view = [[ReMenCellViewController alloc]init];
    
    ReMenModel * mode = self.dataArray[indexPath.row];
    view.url = [mode url];
    [self.navigationController pushViewController:view animated:YES];
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

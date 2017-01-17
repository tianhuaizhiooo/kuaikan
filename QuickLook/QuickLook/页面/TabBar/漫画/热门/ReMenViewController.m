//
//  ReMenViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/16.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "ReMenViewController.h"

#import "SGSegmentedControl.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SisthViewController.h"
#import "SeventhViewController.h"

@interface ReMenViewController ()<UIScrollViewDelegate, SGSegmentedControlDelegate>
@property (nonatomic, strong) SGSegmentedControl *SG;
@property (nonatomic, strong) UIScrollView *mainScrollView;

@property(nonatomic,strong)NSMutableArray * muArray;

@end

@implementation ReMenViewController

- (void)viewDidLoad
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"漫画";
    [super viewDidLoad];
    [self getWeek];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController];
    [self setupSegmentedControl];
    
    // Do any additional setup after loading the view.
}

-(void)setupSegmentedControl
{
    self.mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * _muArray.count, 0);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _mainScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _mainScrollView.bounces = NO;
    // 隐藏水平滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    
    FifthViewController * oneVC = [[FifthViewController alloc] init];
    [self.mainScrollView addSubview:oneVC.view];
    [self addChildViewController:oneVC];
    
    self.SG = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 44) delegate:self segmentedControlType:(SGSegmentedControlTypeScroll) titleArr:_muArray];
    [self.view addSubview:_SG];
}

- (void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.view.frame.size.width;
    self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}

// 显示控制器的view
- (void)showVc:(NSInteger)index
{
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    [self.SG titleBtnSelectedWithScrollView:scrollView];
}

- (void)getWeek
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate * now;
    NSDateComponents * comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    now = [NSDate date];
    comps = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSArray * arrWeek = [NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSString * string =[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:[comps weekday] - 1]];
    
    if ([string  isEqual: @"星期一"])
    {
        NSArray * array = @[@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
        
    }
    else if ([string isEqualToString:@"星期二"])
    {
        NSArray * array = @[@"星期三",@"星期四",@"星期五",@"星期六",@"星期日",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
    }
    else if ([string isEqualToString:@"星期三"])
    {
        NSArray * array = @[@"星期四",@"星期五",@"星期六",@"星期日",@"星期一",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
    }
    else if ([string isEqualToString:@"星期四"])
    {
        NSArray * array = @[@"星期五",@"星期六",@"星期日",@"星期一",@"星期二",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
    }
    else if ([string isEqualToString:@"星期五"])
    {
        NSArray * array = @[@"星期六",@"星期日",@"星期一",@"星期二",@"星期三",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
    }
    else if ([string isEqualToString:@"星期六"])
    {
        NSArray * array = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
    }
    else
    {
        NSArray * array = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"昨天",@"今天"];
        _muArray = [NSMutableArray arrayWithArray:array];
    }
}

-(void)addChildViewController
{
    FirstViewController * firstVC = [[FirstViewController alloc]init];
    [self addChildViewController:firstVC];
    
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    [self addChildViewController:secondVC];
    
    ThirdViewController * thirdVC = [[ThirdViewController alloc]init];
    [self addChildViewController:thirdVC];
    
    ForthViewController * forthVC = [[ForthViewController alloc]init];
    [self addChildViewController:forthVC];
    
    FifthViewController * fifthVC = [[FifthViewController alloc]init];
    [self addChildViewController:fifthVC];
    
    SisthViewController * sisthVC = [[SisthViewController alloc]init];
    [self addChildViewController:sisthVC];
    
    SeventhViewController * seventhVC = [[SeventhViewController alloc]init];
    [self addChildViewController:seventhVC];
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

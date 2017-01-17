//
//  FenLeiViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/14.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "FenLeiViewController.h"
#import "AllViewController.h"
#import "LianAiViewController.h"
#import "DanMeiViewController.h"
#import "KongBuViewController.h"
#import "GuFengViewController.h"
#import "BaoXiaoViewController.h"
#import "QiHuanViewController.h"
#import "XiaoYuanViewController.h"
#import "DuShiViewController.h"
#import "ShaoNianViewController.h"
#import "ZhiYuViewController.h"
#import "BaiHeViewController.h"
#import "OverViewController.h"
#import "SGSegmentedControl.h"

@interface FenLeiViewController ()<UIScrollViewDelegate, SGSegmentedControlDelegate>

@property (nonatomic, strong) SGSegmentedControl * SG;
@property (nonatomic, strong) UIScrollView * mainScrollView;

@end

@implementation FenLeiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self addChildViewController];
    [self setupSegmentedControl];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setupSegmentedControl
{
    NSArray * array = @[@"全部",@"恋爱",@"耽美",@"恐怖",@"古风",@"爆笑",@"奇幻",@"校园",@"都市",@"少年",@"治愈",@"百合",@"完结"];
    self.mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 105, self.view.frame.size.width, self.view.frame.size.height - 150);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * array.count, 0);
    
    
    _mainScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _mainScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _mainScrollView.bounces = YES;
    // 隐藏水平滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    
//    AllViewController * oneVC = [[AllViewController alloc] init];
//    [self.mainScrollView addSubview:oneVC.view];
//    [self addChildViewController:oneVC];
    
    self.SG = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 62, self.view.frame.size.width, 44) delegate:self segmentedControlType:(SGSegmentedControlTypeScroll) titleArr:array];
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
    
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height - 150);
    
    [self.mainScrollView addSubview:vc.view];
    
}

-(void)addChildViewController
{
    AllViewController * allVC = [[AllViewController alloc]init];
    allVC.title = @"全部";
    [self addChildViewController:allVC];
    
    LianAiViewController * lianAiVC = [[LianAiViewController alloc]init];
    lianAiVC.title = @"恋爱";
    [self addChildViewController:lianAiVC];
    
    DanMeiViewController * danMeiVC = [[DanMeiViewController alloc]init];
    danMeiVC.title = @"耽美";
    [self addChildViewController:danMeiVC];
    
    KongBuViewController * kongBuVC = [[KongBuViewController alloc]init];
    kongBuVC.title = @"恐怖";
    [self addChildViewController:kongBuVC];
    
    GuFengViewController * guFengVC = [[GuFengViewController alloc]init];
    guFengVC.title = @"古风";
    [self addChildViewController:guFengVC];
    
    BaoXiaoViewController * baoXiaoVC = [[BaoXiaoViewController alloc]init];
    baoXiaoVC.title = @"爆笑";
    [self addChildViewController:baoXiaoVC];
    
    QiHuanViewController * qiHuanVC = [[QiHuanViewController alloc]init];
    qiHuanVC.title = @"奇幻";
    [self addChildViewController:qiHuanVC];
    
    XiaoYuanViewController * xiaoYuanVC = [[XiaoYuanViewController alloc]init];
    xiaoYuanVC.title = @"校园";
    [self addChildViewController:xiaoYuanVC];
    
    DuShiViewController * duShiVC = [[DuShiViewController alloc]init];
    duShiVC.title = @"都市";
    [self addChildViewController:duShiVC];
    
    ShaoNianViewController * shaoNianVC = [[ShaoNianViewController alloc]init];
    shaoNianVC.title = @"少年";
    [self addChildViewController:shaoNianVC];
    
    ZhiYuViewController * zhiYuVC = [[ZhiYuViewController alloc]init];
    zhiYuVC.title = @"治愈";
    [self addChildViewController:zhiYuVC];
    
    BaiHeViewController * baiHeVC = [[BaiHeViewController alloc]init];
    baiHeVC.title = @"百合";
    [self addChildViewController:baiHeVC];
    
    OverViewController * overVC = [[OverViewController alloc]init];
    overVC.title = @"完结";
    [self addChildViewController:overVC];
    
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

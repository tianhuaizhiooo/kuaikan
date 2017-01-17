//
//  ManHuaViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/13.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "ManHuaViewController.h"
#import "GuanZhuViewController.h"
#import "ReMenViewController.h"

@interface ManHuaViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)NSMutableArray * segmentArray;
@property(nonatomic,strong)UISegmentedControl * selectedSegment;


@end

@implementation ManHuaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray * array = @[@"关注",@"热门"];
    _segmentArray = [NSMutableArray arrayWithArray:array];
    UISegmentedControl * segment = [[UISegmentedControl alloc]initWithItems:array];
    segment.selectedSegmentIndex = 2;
    segment.frame = CGRectMake(self.view.frame.size.width / 2 - 50, 5, 100, 25);
    [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex = 0;
    _selectedSegment = segment;
    
    self.navigationItem.titleView = segment;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatScrollView];
    [self addChildViewController];
    
}

-(void)addChildViewController
{
//    GuanZhuViewController * guanZhuVC = [[GuanZhuViewController alloc]init];
//    [self addChildViewController:guanZhuVC];
    
    ReMenViewController * reMenVC = [[ReMenViewController alloc]init];
    [self addChildViewController:reMenVC];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIViewController * childVC = self.childViewControllers[index];
    if(childVC.isViewLoaded) return;
    childVC.view.frame = scrollView.bounds;
    [scrollView addSubview:childVC.view];
}

-(void)segmentChange:(UISegmentedControl *)segment
{
    if (segment.selectedSegmentIndex == 0)
    {
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = self.view.frame.size.width * 0;
        [self.scrollView setContentOffset:offset animated:YES];
    }
    else
    {
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = self.view.frame.size.width * 1;
        [self.scrollView setContentOffset:offset animated:YES];
    }
    
}

-(void)creatScrollView
{
    //关闭自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(_segmentArray.count * self.view.frame.size.width, 0);
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_scrollView];
    
    //[self scrollViewDidEndScrollingAnimation:_scrollView];
}

//滚动scrollView后segment跟着变动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //[self scrollViewDidEndScrollingAnimation:scrollView];
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (index == 0)
    {
        _selectedSegment.selectedSegmentIndex = 0;
    }
    else
    {
        _selectedSegment.selectedSegmentIndex = 1;
    }
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

//
//  FaXianViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/13.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "FaXianViewController.h"
#import "FenLeiViewController.h"
#import "TuiJianViewController.h"

@interface FaXianViewController ()

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)NSMutableArray * segmentArray;
@property(nonatomic,strong)UISegmentedControl * selectedSegment;


@end

@implementation FaXianViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    NSArray * array = @[@"推荐",@"分类"];
    UISegmentedControl * segment = [[UISegmentedControl alloc]initWithItems:array];
    segment.apportionsSegmentWidthsByContent = YES;
    [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex = 1;
    
    self.navigationItem.titleView = segment;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //[self creatScrollView];
    [self addChildViewController];
}

-(void)segmentChange:(UISegmentedControl *)segment
{
    if (segment.selectedSegmentIndex == 0)
    {
//        CGPoint offset = self.scrollView.contentOffset;
//        offset.x = self.view.frame.size.width * 0;
//        [self.scrollView setContentOffset:offset animated:YES];
        TuiJianViewController * faXianVC = [[TuiJianViewController alloc]init];
        [self addChildViewController:faXianVC];
        [self.view addSubview:faXianVC.view];
    }
    else
    {
//        CGPoint offset = self.scrollView.contentOffset;
//        offset.x = self.view.frame.size.width * 1;
//        [self.scrollView setContentOffset:offset animated:YES];
        FenLeiViewController * fenLeiVC = [[FenLeiViewController alloc]init];
        [self addChildViewController:fenLeiVC];
        [self.view addSubview:fenLeiVC.view];
    }
    
}

-(void)addChildViewController
{
    TuiJianViewController * faXianVC = [[TuiJianViewController alloc]init];
    [self addChildViewController:faXianVC];
    [self.view addSubview:faXianVC.view];
    
    FenLeiViewController * fenLeiVC = [[FenLeiViewController alloc]init];
    [self addChildViewController:fenLeiVC];
    [self.view addSubview:fenLeiVC.view];
}

/*
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



-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIViewController * childVC = self.childViewControllers[index];
    if(childVC.isViewLoaded) return;
    childVC.view.frame = scrollView.bounds;
    [scrollView addSubview:childVC.view];
}
*/
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

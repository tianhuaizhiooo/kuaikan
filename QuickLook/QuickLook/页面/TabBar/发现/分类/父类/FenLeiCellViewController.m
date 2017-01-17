//
//  FenLeiCellViewController.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/30.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "FenLeiCellViewController.h"
#import "XiangQingViewController.h"
#import "XuanJiTableViewController.h"
#import "UIImageView+WebCache.h"

@interface FenLeiCellViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UIView * redLineView;
@property(nonatomic,strong)NSMutableArray * titleMuArray;
@property(nonatomic,strong)UIButton * selectedTitleButton;
@property(nonatomic,strong)UIView * titleView;


@end

@implementation FenLeiCellViewController

-(NSMutableArray *)titleMuArray
{
    if (! _titleMuArray)
    {
        _titleMuArray = [NSMutableArray array];
    }
    return _titleMuArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.cover_image_url sd_setImageWithURL:[NSURL URLWithString:self.cover_image_urll]];
    //NSLog(@"%@",self.ID);
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(backTouch:)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    [self addChildViewController];
    [self setUpScrollView];
    [self setUpTitleView];
    // Do any additional setup after loading the view from its nib.
}

-(void)setUpTitleView
{
    //标签栏整体(全部,视频,声音...)
    UIView * titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    titleView.frame = CGRectMake(0, 316 - 2 - 50, self.view.width, 50);
    [self.view addSubview:titleView];
    self.titleView = titleView;
    //标签栏内部的按钮
    NSInteger count = self.childViewControllers.count;
    CGFloat titleButtonHeight = titleView.height;
    CGFloat titleButtonWidth = titleView.width / count;
    for (int i = 0; i < count; i ++)
    {
        //创建
        UIButton * titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:26];
        [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        [self.titleMuArray addObject:titleButton];
        //按钮上的文字
        NSString * titleStr = [self.childViewControllers[i] title];
        [titleButton setTitle:titleStr forState:UIControlStateNormal];
        //按钮大小及位置
        titleButton.width = titleButtonWidth;
        titleButton.height = titleButtonHeight;
        titleButton.x = titleButton.width * i;
        titleButton.y = 0;
    }
    //标签栏下部的指示条
    UIView * redLineView = [[UIView alloc]init];
    redLineView.backgroundColor = [self.titleMuArray.lastObject titleColorForState:UIControlStateSelected];
    redLineView.height = 2;
    redLineView.y = titleView.height - redLineView.height;
    [titleView addSubview:redLineView];
    self.redLineView = redLineView;
    //默认为最前面的第一个
    UIButton * firstTitleButton = self.titleMuArray.firstObject;
    [firstTitleButton.titleLabel sizeToFit];
    redLineView.width = firstTitleButton.titleLabel.width;
    redLineView.centerX = firstTitleButton.centerX;
    [self buttonClick:firstTitleButton];
}

-(void)setUpScrollView
{
    //不要调整scrollView的contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _scrollView = [[UIScrollView alloc]init];
    //_scrollView.backgroundColor = [UIColor blueColor];
    _scrollView.frame = CGRectMake(0, 316, self.view.frame.size.width, self.view.frame.size.height - 316);
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    //默认显示第0个控制器
    [self scrollViewDidEndScrollingAnimation:_scrollView];
}


//监听
-(void)buttonClick:(UIButton *)titleButton
{
    //按钮的状态
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    //底部指示条的大小及位置
    [UIView animateWithDuration:0.25 animations:^
     {
         self.redLineView.width = titleButton.titleLabel.width;
         self.redLineView.centerX = titleButton.centerX;
     }];
    //让scrollView滚动到对应位置
    CGPoint offSet = self.scrollView.contentOffset;
    offSet.x = self.view.width * [self.titleMuArray indexOfObject:titleButton];
    [self.scrollView setContentOffset:offSet animated:YES];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //取出对应的控制器
    int index = scrollView.contentOffset.x / scrollView.width;
    UIViewController * willShowChildVC = self.childViewControllers[index];
    //如果控制器的view被创建过,直接返回
    if (willShowChildVC.isViewLoaded) return;
    //添加子控制器的view到scrollView上
    willShowChildVC.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVC.view];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    //int index = scrollView.contentOffset.x / scrollView.width;
    //[self buttonClick:self.titleMuArray[index]];
}



-(void)addChildViewController
{
    XiangQingViewController * xiangQing = [[XiangQingViewController alloc]init];
    xiangQing.xiangQing = self.xiangqing;
    //NSLog(@"%@",self.xiangqing);
    xiangQing.title = @"详情";
    [self addChildViewController:xiangQing];
    
    XuanJiTableViewController * xuanJi = [[XuanJiTableViewController alloc]init];
    xuanJi.ID = self.ID;
    xuanJi.title = @"选集";
    [self addChildViewController:xuanJi];
}

-(void)backTouch:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
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

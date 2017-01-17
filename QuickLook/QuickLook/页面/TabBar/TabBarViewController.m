//
//  TabBarViewController.m
//  QuicklyLook
//
//  Created by 田怀志 on 16/12/13.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "TabBarViewController.h"
#import "ManHuaViewController.h"
#import "FaXianViewController.h"
#import "SheQuViewController.h"
#import "WoDeViewController.h"
#import "SuperReMenTableViewController.h"
#import "ReMenViewController.h"
#import "ZuiXinGuangTableViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [self tabBarStyle];
    [self addChildViewController];
    
    
    // Do any additional setup after loading the view.
}

-(void)tabBarStyle
{
    //未选择状态下
    NSMutableDictionary * normal = [NSMutableDictionary dictionary];
    normal[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    normal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    //选择状态下
    NSMutableDictionary * selected = [NSMutableDictionary dictionary];
    selected[NSForegroundColorAttributeName] = [UIColor yellowColor];
    selected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    //将两种状态添加到tabbar上
    UITabBarItem * item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normal forState:UIControlStateNormal];
    [item setTitleTextAttributes:selected forState:UIControlStateSelected];
}

-(void)addChildViewController
{
    ReMenViewController * manHuaVC = [[ReMenViewController alloc]init];
    [self addChildViewController:manHuaVC title:@"漫画" image:@"漫画0" selectedImage:@"漫画1"];
    
    FaXianViewController * faXianVC = [[FaXianViewController alloc]init];
    [self addChildViewController:faXianVC title:@"发现" image:@"发现0" selectedImage:@"发现1"];
    
//    ZuiXinGuangTableViewController * sheQuVC = [[ZuiXinGuangTableViewController alloc]init];
//    [self addChildViewController:sheQuVC title:@"社区" image:@"社区0" selectedImage:@"社区1"];
    
    WoDeViewController * woDeVC = [[WoDeViewController alloc]init];
    [self addChildViewController:woDeVC title:@"我的" image:@"我的0" selectedImage:@"我的1"];
}

-(void)addChildViewController:(UIViewController*)viewController
                        title:(NSString *)title
                        image:(NSString *)image
                selectedImage:(NSString *)selectedImage
{
    UINavigationController * navigation = [[UINavigationController alloc]initWithRootViewController:viewController];
    navigation.tabBarItem.title = title;
    navigation.tabBarItem.image = [UIImage imageNamed:image];
    navigation.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:navigation];
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

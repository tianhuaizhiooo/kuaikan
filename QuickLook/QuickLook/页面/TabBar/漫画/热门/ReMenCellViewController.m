//
//  ReMenCellViewController.m
//  QuickLook
//
//  Created by 田怀志 on 16/12/30.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "ReMenCellViewController.h"

@interface ReMenCellViewController ()

@end

@implementation ReMenCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.tabBarController.tabBar.hidden = YES;
    // Do any additional setup after loading the view from its nib.
    UIWebView * webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //self.url = _model.url;
    NSURL * url = [NSURL URLWithString:self.url];
    NSURLRequest * reauest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:reauest];
    [self.view addSubview:webView];
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(backTouch:)];
    self.navigationItem.leftBarButtonItem = backButton;
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

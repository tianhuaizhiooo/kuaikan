//
//  WenViewController.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/11.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "WenViewController.h"

@interface WenViewController ()

@end

@implementation WenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSURL * url = [NSURL URLWithString:self.url];
    NSURLRequest * reauest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:reauest];
    [self.view addSubview:webView];
    
    // Do any additional setup after loading the view.
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

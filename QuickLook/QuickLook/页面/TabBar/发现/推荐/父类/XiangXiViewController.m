//
//  XiangXiViewController.m
//  QuickLook
//
//  Created by 田怀志 on 17/1/11.
//  Copyright © 2017年 WYZC. All rights reserved.
//

#import "XiangXiViewController.h"

@interface XiangXiViewController ()

@end

@implementation XiangXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = self.xiangqing;
    // Do any additional setup after loading the view from its nib.
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

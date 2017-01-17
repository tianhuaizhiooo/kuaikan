//
//  TuiJianCollectionViewController.h
//  
//
//  Created by 田怀志 on 17/1/9.
//
//

#import <UIKit/UIKit.h>
#import "TuiJianCellModel.h"

@interface TuiJianCollectionViewController : UIViewController

@property(nonatomic,strong)TuiJianCellModel * model;
@property(nonatomic,strong)NSString * ID;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property(nonatomic,strong)NSString * pic;
@property(nonatomic,strong)NSString * xiangqing;

@end

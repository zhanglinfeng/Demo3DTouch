//
//  SearchViewController.h
//  Demo3DTuch
//
//  Created by 张林峰 on 16/1/12.
//  Copyright © 2016年 张林峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

@property (strong, nonatomic) NSString *str;
@property (strong, nonatomic) IBOutlet UILabel *lb;
@property (strong, nonatomic) IBOutlet UILabel *lbForce;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@end

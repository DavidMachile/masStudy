//
//  UpdateViewController.m
//  topScrollView
//
//  Created by cctv-person on 2018/11/27.
//  Copyright © 2018 cctv-person. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
    btn1.layer.borderColor = UIColor.greenColor.CGColor;
    btn1.layer.borderWidth = 3;
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    btn2.layer.borderColor = UIColor.greenColor.CGColor;
    btn2.layer.borderWidth = 3;
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn3 setTitle:@"按钮3" forState:UIControlStateNormal];
    btn3.layer.borderColor = UIColor.greenColor.CGColor;
    btn3.layer.borderWidth = 3;
    [self.view addSubview:btn3];
    
    
    [@[btn1, btn2, btn3] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:80 leadSpacing:15 tailSpacing:15];
    
    [@[btn1, btn2, btn3] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        //        make.top.equalTo(@100);

    }];
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

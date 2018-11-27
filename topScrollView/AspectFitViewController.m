//
//  AspectFitViewController.m
//  topScrollView
//
//  Created by cctv-person on 2018/11/27.
//  Copyright © 2018 cctv-person. All rights reserved.
//

#import "AspectFitViewController.h"

@interface AspectFitViewController ()

@end

@implementation AspectFitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor redColor];
    [self.view addSubview:topView];
    
    UIView *topInnerView = [[UIView alloc] init];
    topInnerView.backgroundColor = [UIColor greenColor];
    [topView addSubview:topInnerView];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bottomView];
    
    UIView *bottomInnerView = [[UIView alloc] init];
    bottomInnerView.backgroundColor = [UIColor blueColor];
    [bottomView addSubview:bottomInnerView];
    
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(bottomView);
    }];
    
    [topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(topView);
    make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
        make.center.mas_equalTo(topInnerView);
        
        make.width.height.mas_equalTo(topInnerView).priorityLow();
        make.width.height.lessThanOrEqualTo(topView);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    
    [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(bottomView);
        make.center.mas_equalTo(bottomView);
        
        make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
        make.width.height.mas_equalTo(bottomView).priorityLow();
        make.width.height.lessThanOrEqualTo(bottomView);
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

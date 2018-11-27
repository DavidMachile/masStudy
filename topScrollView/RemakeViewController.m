//
//  RemakeViewController.m
//  topScrollView
//
//  Created by cctv-person on 2018/11/27.
//  Copyright © 2018 cctv-person. All rights reserved.
//

#import "RemakeViewController.h"

@interface RemakeViewController ()

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, strong) MASConstraint *height;

@end

@implementation RemakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    self.growingButton.backgroundColor = [UIColor redColor];
    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingButton];
    self.isExpanded = NO;
    [self updateViewConstraints];
    // Do any additional setup after loading the view.
}


- (void)updateViewConstraints{
    __weak __typeof(self) weakSelf = self;
    [self.growingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        if (weakSelf.isExpanded) {
            make.bottom.mas_equalTo(0);
        }else{
            make.bottom.mas_equalTo(-350);
        }
    }];
    [super updateViewConstraints];
}

- (void)onGrowButtonTaped:(UIButton *)sender {
    self.isExpanded = !self.isExpanded;
    if (!self.isExpanded) {
        [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    } else {
        [self.growingButton setTitle:@"点我收起" forState:UIControlStateNormal];
    }
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
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

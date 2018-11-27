//
//  BasicAnimatedViewController.m
//  topScrollView
//
//  Created by cctv-person on 2018/11/27.
//  Copyright © 2018 cctv-person. All rights reserved.
//

#import "BasicAnimatedViewController.h"

@interface BasicAnimatedViewController ()
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;

@property (nonatomic, assign) CGFloat padding;

@end

@implementation BasicAnimatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    self.greenView = greenView;
    self.redView = redView;
    self.blueView = blueView;
    // 使这三个控件等高
    self.padding = 10;
    CGFloat padding = self.padding;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padding),
        make.left.mas_equalTo(padding),
        make.right.mas_equalTo(redView.mas_left).offset(-padding),
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding).priorityLow(),
        // 三个控件等高
        make.height.mas_equalTo(@[redView, blueView]);
        // 红、绿这两个控件等高
        make.width.mas_equalTo(redView);
        make.height.lessThanOrEqualTo(self.view);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.bottom.mas_equalTo(greenView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(greenView.mas_right).offset(padding);
        make.height.mas_equalTo(@[greenView, blueView]);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@[greenView, redView]);
        make.bottom.mas_equalTo(-padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
    }];
    
    [self updateAnimated:NO];
}

- (void)updateAnimated:(BOOL)animated {
    CGFloat padding = self.padding >= 350 ? 10 : 350;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-padding);
        make.top.mas_equalTo((screenHeight - 64) / 2 - 5);
        //    make.right.mas_equalTo(self.view.mas_right).offset(-padding);
    }];
    
    if (animated) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.padding = padding;
            [self updateAnimated:YES];
        }];
    } else {
        [self.view layoutIfNeeded];
        
        [self updateAnimated:YES];
    }
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

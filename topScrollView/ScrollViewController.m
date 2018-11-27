//
//  ScrollViewController.m
//  topScrollView
//
//  Created by cctv-person on 2018/11/27.
//  Copyright © 2018 cctv-person. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.pagingEnabled = NO;
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = UIColor.lightGrayColor;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *lastLabel = nil;
    for (NSUInteger i = 0 ; i < 20; ++i) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.layer.borderColor = [UIColor greenColor].CGColor;
        label.layer.borderWidth = 2.0;
        label.text = [self randomText];
        
        label.preferredMaxLayoutWidth = screenWidth - 30;
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = UIColor.redColor;
        [self.scrollView addSubview:label];
        
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(self.view).offset(-15);
            
            if (lastLabel) {
                make.top.mas_equalTo(lastLabel.mas_bottom).offset(20);
            }else{
                make.top.mas_equalTo(self.scrollView).offset(20);
            }
        }];
        lastLabel = label;
    }
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.bottom.mas_equalTo(lastLabel.mas_bottom).offset(20);
    }];
    // Do any additional setup after loading the view.
}


- (NSString *)randomText{
    CGFloat length = arc4random()%50 +5;
    NSMutableString *str = [NSMutableString new];
    for (NSUInteger i = 0; i < length; ++i) {
        [str appendString:@"这是一段文字,"];
    }
    return str;
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

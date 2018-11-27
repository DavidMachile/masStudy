//
//  ViewController.m
//  topScrollView
//
//  Created by cctv-person on 2018/11/27.
//  Copyright © 2018 cctv-person. All rights reserved.
//

#import "ViewController.h"
#import "BasicViewController.h"
#import "UpdateViewController.h"
#import "RemakeViewController.h"
#import "AspectFitViewController.h"
#import "BasicAnimatedViewController.h"
#import "ScrollViewController.h"
@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) NSArray * controllers;
@property (nonatomic , strong) UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview = [[UITableView alloc]init];
    self.tableview.delegate = self;
    self.tableview.dataSource  = self;
    [self.view addSubview:self.tableview];
    
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.controllers = @[
                         [[BasicViewController alloc]initWithTitle:@"Basic表格"],
                         [[UpdateViewController alloc]initWithTitle:@"update表格"],
                         [[RemakeViewController alloc]initWithTitle:@"Remake"],
                         [[AspectFitViewController alloc]initWithTitle:@"aspectFit"],
                         [[BasicAnimatedViewController alloc]initWithTitle:@"basicAnimated"],
                         [[ScrollViewController alloc]initWithTitle:@"scroll"]
                         ];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *KCellIdentifier = @"CellIdentifier";
    UIViewController *viewController = self.controllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KCellIdentifier];
    }
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllers.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = self.controllers[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

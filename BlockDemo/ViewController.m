//
//  ViewController.m
//  BlockDemo
//
//  Created by 李兴东 on 2018/9/10.
//  Copyright © 2018年 lixingdong. All rights reserved.
//

#import "ViewController.h"
#import "CycleOneViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray *requestInfo;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"demo";
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.requestInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *info = self.requestInfo[indexPath.row];
    
    cell.textLabel.text = info[@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *info = self.requestInfo[indexPath.row];
    Class clase = NSClassFromString(info[@"view"]);
    UIViewController *viewController = (UIViewController *)[[clase alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}


- (NSArray *)requestInfo {
    if (!_requestInfo) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TestInfos" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        _requestInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    return _requestInfo;
}
@end

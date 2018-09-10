//
//  cycle1ViewController.m
//  BlockDemo
//
//  Created by 李兴东 on 2018/9/10.
//  Copyright © 2018年 lixingdong. All rights reserved.
//

#import "CycleOneViewController.h"
#import "ModelOne.h"
@interface CycleOneViewController ()

@property (nonatomic, strong)ModelOne *model;

@end

@implementation CycleOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.model cycle:^{
        self.view.backgroundColor = [UIColor yellowColor];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"dealloc");
}

- (ModelOne *)model{
    if(!_model){
        _model = [ModelOne new];
    }
    return _model;
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

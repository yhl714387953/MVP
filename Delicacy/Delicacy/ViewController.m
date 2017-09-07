//
//  ViewController.m
//  Delicacy
//
//  Created by mac on 2017/9/5.
//  Copyright © 2017年 zuiye. All rights reserved.
//

#import "ViewController.h"
#import "Presenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clicked:(UIButton *)sender {
    Presenter* vc = [[Presenter alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  Presenter.m
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Presenter.h"
#import "DishTableViewController.h"
#import "DishModel.h"

#import "CategoryTableViewController.h"
#import "CategoryModel.h"

#import "Masonry.h"

@interface Presenter ()<CategoryTableViewControllerDelegate, DishTableViewControllerDelegate>

/** 分类控制器 */
@property (nonatomic, strong) CategoryTableViewController* categoryVC;

/** 菜品控制器 */
@property (nonatomic, strong) DishTableViewController* dishVC;

@end

@implementation Presenter

#pragma mark -
#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.categoryVC = [[CategoryTableViewController alloc] initWithStyle:(UITableViewStylePlain)];
    self.categoryVC.delegate = self;
    [self.view addSubview:self.categoryVC.tableView];
    [self addChildViewController:self.categoryVC];
    
    
    self.dishVC = [[DishTableViewController alloc] initWithStyle:(UITableViewStylePlain)];
    self.dishVC.delegate = self;
    [self.view addSubview:self.dishVC.tableView];
    [self addChildViewController:self.dishVC];
    
    
    [self.categoryVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.width.mas_equalTo(@(100));
    }];
    
    [self.dishVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.categoryVC.tableView.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.categoryVC.tableView.mas_right).offset(0);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - CategoryTableViewControllerDelegate
-(void)categoryTableViewController:(CategoryTableViewController *)controller didSelectCategoryId:(NSInteger)categoryId{

    [self.dishVC scrollRowWithCategoryId:categoryId];
}

#pragma mark -
#pragma mark - DishTableViewControllerDelegate
-(void)dishTableViewController:(DishTableViewController *)controller willShowCategoryId:(NSInteger)categoryId{
    
    [self.categoryVC selectRowWithCategoryId:categoryId];
}

-(void)dishTableViewController:(DishTableViewController *)controller didSelectDish:(DishModel *)dishModel{
    
    NSLog(@"当前选中的菜品名称：%@", dishModel.dishName);
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

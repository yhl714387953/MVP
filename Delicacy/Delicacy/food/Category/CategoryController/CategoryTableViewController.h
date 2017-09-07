//
//  CategoryTableViewController.h
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryTableViewController;
@protocol CategoryTableViewControllerDelegate <NSObject>
@optional


/**
 选中分类的时候

 @param controller 分类控制器
 @param categoryId 当前选中的分类id
 */
-(void)categoryTableViewController:(CategoryTableViewController*)controller didSelectCategoryId:(NSInteger)categoryId;

@end

@interface CategoryTableViewController : UITableViewController

/** 代理 */
@property (nonatomic, weak) id<CategoryTableViewControllerDelegate> delegate;


/**
 根据分类ID选择某个分类

 @param categoryId 分类id
 */
-(void)selectRowWithCategoryId:(NSInteger)categoryId;

@end

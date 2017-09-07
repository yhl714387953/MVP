//
//  DishTableViewController.h
//  Delicacy
//
//  Created by mac on 2017/9/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DishTableViewController;
@class DishModel;
@protocol DishTableViewControllerDelegate <NSObject>
@optional


/**
 滚动菜品section变化的时候

 @param controller 菜品控制器
 @param categoryId 当前最顶部展现的菜品的分类id
 */
-(void)dishTableViewController:(DishTableViewController*)controller willShowCategoryId:(NSInteger)categoryId;


/**
 选中一个菜品的时候

 @param controller 菜品控制器
 @param dishModel 菜品数据模型
 */
-(void)dishTableViewController:(DishTableViewController*)controller didSelectDish:(DishModel*)dishModel;

@end

@interface DishTableViewController : UITableViewController

/** 代理 */
@property (nonatomic, weak) id<DishTableViewControllerDelegate> delegate;


/**
 根据分类ID滚动某个菜品

 @param categoryId 分类id
 */
-(void)scrollRowWithCategoryId:(NSInteger)categoryId;

@end

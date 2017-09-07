//
//  DishTableViewCell.h
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DishModel.h"

@interface DishTableViewCell : UITableViewCell
@property (nonatomic, strong) DishModel* model;

@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishSoldCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *dishDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;

@end

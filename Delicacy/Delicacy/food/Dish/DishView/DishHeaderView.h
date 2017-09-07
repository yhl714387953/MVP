//
//  DishHeaderView.h
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DishModel.h"

@interface DishHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong)SectionModel* model;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

//
//  CategoryModel.h
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DishModel.h"

@interface CategoryModel : NSObject
@property (nonatomic, copy)     NSString* categoryName;
@property (nonatomic)           NSInteger categoryID;

+(NSMutableArray<CategoryModel*>*)forgeDataSource;

@end

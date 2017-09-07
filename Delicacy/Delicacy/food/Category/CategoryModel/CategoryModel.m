//
//  CategoryModel.m
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+(NSMutableArray<CategoryModel*>*)forgeDataSource{
    NSMutableArray* categories = [NSMutableArray array];
    
    for (int i = 0; i < 30; i++) {
        CategoryModel* cModel = [[CategoryModel alloc] init];
        cModel.categoryID = i;
        cModel.categoryName = [NSString stringWithFormat:@"嘴爷分类%d", i];
        [categories addObject:cModel];
    }
    
    return categories;
}

@end

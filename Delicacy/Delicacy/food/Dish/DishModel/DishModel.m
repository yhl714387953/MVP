//
//  DishModel.m
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DishModel.h"

@implementation DishModel

+(NSMutableArray<DishModel *> *)forgeDishes:(NSInteger)categoryId{

    NSMutableArray* dishes = [NSMutableArray array];
    for (int j = 0; j < arc4random() % 5 + 2; j++) {
        DishModel* dModel = [[DishModel alloc] init];
        dModel.dishID = categoryId * 100 + j;
        dModel.dishName = [NSString stringWithFormat:@"梅菜扣肉%d", j];
        dModel.soldCount = arc4random() % 888 + 666;
        dModel.dishDetail = @"鸡排+鸡排+鸡排";
        dModel.dishImageUrl = @"http://www.51ppt.com.cn/Article/Uploadphotos_0708/200604/200641474815848.png";
        if (j % 3 == 0) {
            dModel.dishDetail = @"鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排";
            dModel.dishImageUrl = @"http://www.51ppt.com.cn/Article/Uploadphotos_0708/200604/200641315844978.png";
        }else if (j % 2 == 0) {
            dModel.dishDetail = @"鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排+鸡排";
            dModel.dishImageUrl = @"http://img.web07.cn/uploads/Png/c101117/12Y955214230-4IZ.png";
        }
        
        [dishes addObject:dModel];
    }

    return dishes;
}

@end


@implementation SectionModel

@end

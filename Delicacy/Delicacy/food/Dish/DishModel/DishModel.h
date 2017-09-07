//
//  DishModel.h
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DishModel : NSObject
@property (nonatomic, copy)     NSString*   dishName;
@property (nonatomic)           NSInteger   dishID;
@property (nonatomic, copy)     NSString*   dishDetail;
@property (nonatomic)           NSUInteger  soldCount;
@property (nonatomic)           CGFloat     price;
@property (nonatomic, copy)     NSString*   dishImageUrl;


/**
 构造菜品

 @param categoryId 分类ID
 @return 菜品数组
 */
+(NSMutableArray<DishModel*>*)forgeDishes:(NSInteger)categoryId;

@end


@interface SectionModel : NSObject

@property (nonatomic, copy)     NSString* categoryName;
@property (nonatomic)           NSInteger categoryID;
@property (nonatomic, strong)   NSMutableArray<DishModel*>* dishes;

@end

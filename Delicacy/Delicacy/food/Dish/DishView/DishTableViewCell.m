//
//  DishTableViewCell.m
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DishTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation DishTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.model) {
        self.dishNameLabel.text = [NSString stringWithFormat:@"%@ %ld", self.model.dishName, (long)self.model.dishID];
//        self.dishDetailLabel.text = [NSString stringWithFormat:@"%@", self.model.dishDetail];
        self.dishSoldCountLabel.text = [NSString stringWithFormat:@"月销售%lu份", (unsigned long)self.model.soldCount];
        [self.dishImageView sd_setImageWithURL:[NSURL URLWithString:self.model.dishImageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //        NSLog(@"%@", error);
        }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

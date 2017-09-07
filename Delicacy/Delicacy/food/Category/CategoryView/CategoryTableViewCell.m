//
//  CategoryTableViewCell.m
//  Delicacy
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = [UIColor colorWithRed:241 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1];
    UIView* selectView = [[UIView alloc] initWithFrame:self.bounds];
    selectView.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = selectView;
    
//    为什么要用imageView呢，用一个view在select状态下就没有颜色了
    self.selectImageView.image = [self imageWithColor:[UIColor blueColor]];
}

-(UIImage*) imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectImageView.hidden = !selected;
    // Configure the view for the selected state
}

@end

//
//  DIELifeTableViewCell.h
//  DayByDay
//
//  Created by apple on 15/10/23.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIELifeTableViewCell : UITableViewCell
//1.
@property (nonatomic,strong,readonly)UIImageView *KindImageView;
@property (nonatomic,strong,readonly) UILabel *KindnameLabel;
@property (nonatomic,strong,readonly) UILabel *floatTextLabel;//活动时弹出
//2.
@property (nonatomic,strong,readonly)UIImageView *titleImageView;
@property (nonatomic,strong,readonly) UILabel *nameLabel;
@property (nonatomic,strong,readonly) UILabel *contentTextLabel;
//其他
@property (nonatomic,strong,readonly) UIImageView *iConImage;
@property (nonatomic,strong,readonly) UILabel *titleLabel;
@property (nonatomic,strong,readonly) UILabel *contentLabel;

@end

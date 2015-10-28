//
//  DIELifeTableViewCell.m
//  DayByDay
//
//  Created by apple on 15/10/23.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIELifeTableViewCell.h"
#import "Masonry.h"
@interface DIELifeTableViewCell ()
{
    
}
@end
@implementation DIELifeTableViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.
        _KindImageView=[[UIImageView alloc]init];
        _KindnameLabel=[[UILabel alloc]init];
        _floatTextLabel=[[UILabel alloc]init];
        _KindImageView.layer.cornerRadius=5;
        _KindImageView.layer.masksToBounds = YES;
        _KindnameLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_KindnameLabel];
        [self addSubview:_KindImageView];
        [self.KindImageView addSubview:_floatTextLabel];
        //2.
        _titleImageView=[[UIImageView alloc]init];
        _nameLabel=[[UILabel alloc]init];
        _contentTextLabel=[[UILabel alloc]init];
        [self addSubview:_titleImageView];
        [self addSubview:_nameLabel];
        [self addSubview:_contentTextLabel];
        //其他
        _iConImage=[[UIImageView alloc]init];
        _titleLabel=[[UILabel alloc]init];
        _contentLabel=[[UILabel alloc]init];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        _iConImage.layer.cornerRadius=5;
        _iConImage.layer.masksToBounds=YES;
        [self addSubview:_iConImage];
        [self addSubview:_titleLabel];
        [self addSubview:_contentLabel];
        
    }
    self.backgroundColor=[UIColor clearColor];
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //1.四个并排的图标
    [_KindImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.width.equalTo(self);
        make.height.equalTo(self.mas_width);
    }];
    [_KindnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.equalTo(self);
        make.bottom.equalTo(self).offset(-5);
        make.height.equalTo(self.mas_height).multipliedBy(0.25);
    }];
    
    //其他
    [_iConImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.width.equalTo(self);
        make.height.equalTo(self.mas_width);
        
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.equalTo(self);
        make.bottom.equalTo(self).offset(-5);
        make.height.equalTo(self.mas_height).multipliedBy(0.25);
        
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.equalTo(self);
        make.bottom.equalTo(self).offset(-15);
        make.height.equalTo(self.mas_height).multipliedBy(0.25);
    }];
}
@end

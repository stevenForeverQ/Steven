//
//  HomeTableViewCell.m
//  DayByDay
//
//  Created by apple on 15/11/3.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "HomeTableViewCell.h"
#define HScreen [[UIScreen mainScreen] bounds].size.height
#define WScreen [[UIScreen mainScreen] bounds].size.width
#define iOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        float CellHeight=100-1;
        float orginY=10;
        float orginX=10;
        float spaceImageAndTitle=10;
        
        float imageWidth=100;
        float imageHeight=CellHeight-orginY*2;
        float mainHeight=imageHeight/3;
        float detailHeight=mainHeight*2;
        float labelWidth=WScreen-imageWidth-2*orginX-spaceImageAndTitle;
        self.contentView.backgroundColor=[UIColor colorWithRed:0.91f green:0.91f blue:0.91f alpha:1.00f];
        //        self.contentView.backgroundColor=[UIColor redColor];
        UIView *bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WScreen, CellHeight)];
        
        [self.contentView addSubview:bgView];
        
        bgView.backgroundColor=[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
        
        _mainIV=[[UIImageView alloc] initWithFrame:CGRectMake(orginX, orginY+4, imageWidth,imageHeight-8 )];
        [bgView addSubview:_mainIV];
        
        
        _mainLabel=[[UILabel alloc] initWithFrame:CGRectMake(orginX+imageWidth+spaceImageAndTitle, orginY, labelWidth, mainHeight)];
        [bgView addSubview:_mainLabel];
        
        
        _detailLabel=[[UILabel alloc] initWithFrame:CGRectMake(orginX+imageWidth+spaceImageAndTitle, orginY+mainHeight, labelWidth, detailHeight)];
        [bgView addSubview:_detailLabel];
        
        _mainLabel.font=[UIFont systemFontOfSize:18];
        
        _mainLabel.backgroundColor=[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
        _detailLabel.backgroundColor=[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
        _detailLabel.font=[UIFont systemFontOfSize:14];
        _detailLabel.numberOfLines=0;
        _detailLabel.textColor=[UIColor colorWithRed:0.73f green:0.73f blue:0.73f alpha:1.00f];
        
        
        
        
    }
    
    return self;
    
}


@end

//
//  SwitchView.h
//  DayByDay
//
//  Created by apple on 15/11/3.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchView : UIView
@property UIButton *button1;
@property UIButton *button2;
@property UIButton *button3;
@property UIButton *button4;
@property ( strong) void (^ButtonActionBlock)(int buttonTag);
-(void)swipeAction:(int)tag;
@end

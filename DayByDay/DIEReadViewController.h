//
//  DIEReadViewController.h
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIEReadViewController : UIViewController
@property (nonatomic, assign) BOOL shouldInitPullToRefresh;

- (void)shouldAddPullToRefresh:(BOOL)isAdd;

@end

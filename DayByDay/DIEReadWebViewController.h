//
//  DIEReadWebViewController.h
//  DayByDay
//
//  Created by apple on 15/10/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIEReadWebViewController : UIViewController
@property (nonatomic,assign) NSInteger curtIndexPath;
@property (nonatomic,strong) NSMutableArray *UrlArray;
@property (nonatomic,strong) NSURL * SelfUrl;
@end

//
//  DIEHomeViewController.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEHomeViewController.h"
#import "DIEReadViewController.h"
#import "DIELifeViewController.h"
#import "DIEDataManager.h"
@implementation DIEHomeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
   self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didNewClicked:)];
    
    

}
- (void)didNewClicked:(UIButton *)sender
{
    DIELifeViewController *Ctr=[[DIELifeViewController alloc]init];
    [[DIEDataManager sharedManager] UpdateWithTravelsApiKey];
    [[DIEDataManager sharedManager] UpdateWithSocialNewsApiKey];
    [self.navigationController pushViewController:Ctr animated:YES];

}
@end

//
//  DIEUserViewController.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEUserViewController.h"
@interface DIEUserViewController()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_userTableView;
}
@end
@implementation DIEUserViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    [self tableViewLoad];
    
}
- (void)tableViewLoad
{
    _userTableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _userTableView.dataSource=self;
    _userTableView.delegate=self;
    [_userTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}
@end

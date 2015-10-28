//
//  DIEReadViewController.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEReadViewController.h"

@interface DIEReadViewController()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_readTableView;
}
@end
@implementation DIEReadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    [self tableViewLoad];
    
}
- (void)tableViewLoad
{
    _readTableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _readTableView.dataSource=self;
    _readTableView.delegate=self;
    [_readTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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

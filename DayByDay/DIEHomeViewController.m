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
#import "SwitchView.h"
#import "HomeTableViewCell.h"
#import "DIENotificationConfig.h"
#import "UIImageView+WebCache.h"
#import "DIESocialNewsModel.h"
#import "DIESportsModel.h"
#import "DIEInternationalNewsModel.h"
#import "DIETechnologyNewsModel.h"
#import "DIEAmusementModel.h"
#define HScreen [[UIScreen mainScreen] bounds].size.height
#define WScreen [[UIScreen mainScreen] bounds].size.width
#define iOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
@interface DIEHomeViewController()<UITableViewDataSource,UITableViewDelegate>{
    UIScrollView *scrollView;
    int currentIndex;
    UITableView *tableView1;
    UITableView *tableView2;
    UITableView *tableView3;
    UITableView *tableView4;
    float titleHeight;
    float bgViewHeight;
    SwitchView *switchView;
    
}

@end
@implementation DIEHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self initTitle];
    
    titleHeight=35;
    bgViewHeight=HScreen-64-titleHeight;
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
        
    }
    self.view.backgroundColor=[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    
    
    switchView=[[SwitchView alloc] initWithFrame:CGRectMake(0, 0, WScreen, titleHeight)];
    [self.view addSubview:switchView];
    
    [self initScroll];
    [self initTable];
    [self loadReadData];
    
    
}
- (void)loadReadData
{
    DIEAddObserver(self, @selector(didUpdate:), kDIESociaNewsUpdateNotif, nil);//网络加载成功后数据重载
    [[DIEDataManager sharedManager] UpdateWithSocialNewsApiKey];
    [[DIEDataManager sharedManager] UpdateWithInternationalNewsApiKey];
    [[DIEDataManager sharedManager] UpdateWithTechnologyNewsApiKey];
    [[DIEDataManager sharedManager] UpdateWithAmusementApiKey];
}
- (void)didUpdate:(UIButton *)sender
{
    [tableView1 reloadData];
    [tableView2 reloadData];
    [tableView3 reloadData];
    [tableView4 reloadData];

}
-(void)initTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    titleLabel.textColor = [UIColor whiteColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.text = @"新闻";
    self.navigationItem.titleView = titleLabel;
    self.navigationItem.title=@"新闻";
}
-(void)initScroll{
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, titleHeight, WScreen, bgViewHeight)];
    scrollView.alwaysBounceHorizontal=YES;
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];

    [scrollView setContentSize:CGSizeMake(WScreen * (4), bgViewHeight)];
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [scrollView scrollRectToVisible:CGRectMake(0,0,WScreen,bgViewHeight) animated:NO];
    
}

-(void)initTable{
    
    
    tableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
    [scrollView addSubview:tableView1];
    tableView1.showsVerticalScrollIndicator = NO;
    
    tableView1.dataSource=self;
    tableView1.delegate=self;
    tableView1.tag=11;
    tableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    UIImageView *title1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 185)];
    title1.image=[UIImage imageNamed:@"t1"];
    [tableView1 setTableHeaderView:title1];
    
    
    switchView.ButtonActionBlock=^(int buttonTag){
        
        currentIndex=buttonTag-100;
        [scrollView scrollRectToVisible:CGRectMake(WScreen * (currentIndex-1),0,WScreen,bgViewHeight) animated:NO];
        [scrollView setContentOffset:CGPointMake(WScreen* (currentIndex-1),0)];
        
        if (currentIndex==1) {
            
            
        }else if (currentIndex==2){
            if (tableView2==nil) {
                tableView2=[[UITableView alloc] initWithFrame:CGRectMake(WScreen, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
                [scrollView addSubview:tableView2];
                tableView2.showsVerticalScrollIndicator = NO;
                
                tableView2.tag=12;
                tableView2.dataSource=self;
                tableView2.delegate=self;
                tableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
                
                
            }
            
        }else if (currentIndex==3){
            if (tableView3==nil) {
                tableView3=[[UITableView alloc] initWithFrame:CGRectMake(WScreen*2, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
                [scrollView addSubview:tableView3];
                tableView3.showsVerticalScrollIndicator = NO;
                
                UIImageView *title3=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 185)];
                title3.image=[UIImage imageNamed:@"t2"];
                [tableView3 setTableHeaderView:title3];
                tableView3.tag=13;
                
                tableView3.dataSource=self;
                tableView3.delegate=self;
                tableView3.separatorStyle=UITableViewCellSeparatorStyleNone;
                
                
            }
            
        }else if (currentIndex==4){
            if (tableView4==nil) {
                tableView4=[[UITableView alloc] initWithFrame:CGRectMake(WScreen*3, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
                [scrollView addSubview:tableView4];
                tableView4.showsVerticalScrollIndicator = NO;
                
                UIImageView *title4=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 185)];
                title4.image=[UIImage imageNamed:@"t3"];
                [tableView4 setTableHeaderView:title4];
                
                
                tableView4.tag=14;
                
                tableView4.dataSource=self;
                tableView4.delegate=self;
                tableView4.separatorStyle=UITableViewCellSeparatorStyleNone;
                
            }
            
        }
        
        
    };
    
    currentIndex=1;
    
    
}


#pragma mark scrollView

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView1
{
    CGFloat pagewidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pagewidth/ (4)) / pagewidth) + 1;
    
    if (currentPage==0)
    {
        
        [scrollView scrollRectToVisible:CGRectMake(0,0,WScreen,bgViewHeight) animated:NO];
        [scrollView setContentOffset:CGPointMake(0,0)];
    }
    else if (currentPage==(3))
    {
        
        [scrollView scrollRectToVisible:CGRectMake(WScreen * 3,0,WScreen,bgViewHeight) animated:NO];
        [scrollView setContentOffset:CGPointMake(WScreen* 3,0)];
    }
    
    currentIndex=currentPage+1;
    
    [switchView swipeAction:(100+currentPage+1)];
    
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==11) {
        return [[DIEDataManager sharedManager].SocialNewsArray count];
    }else if (tableView.tag==12){
        return [[DIEDataManager sharedManager].AmusementArray count];
        
    }else if (tableView.tag==13){
        return [[DIEDataManager sharedManager].TechnologyNewsArray count];
        
    }else if (tableView.tag==14){
        
        return [[DIEDataManager sharedManager].InternationalNewsArray count];
    }
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag==11) {
        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
        
        
        if (cell == nil) {
            cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id1"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
        }
        // Configure the cell...
        DIESocialNewsModel * socialNewsModel=[DIESocialNewsModel modelFromJSONDictionary:[DIEDataManager sharedManager].SocialNewsArray[indexPath.row]];
        [cell.mainIV sd_setImageWithURL:[NSURL URLWithString:socialNewsModel.picUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        //
        cell.mainLabel.text=socialNewsModel.title;
        cell.detailLabel.text=socialNewsModel.desc;
        cell.detailLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.detailLabel.numberOfLines = 0;
        return cell;
        
    }else if (tableView.tag==12){
        
         HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id2"];
        if (cell == nil) {
            cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id2"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        // Configure the cell...
        DIEAmusementModel * amusementModelModel=[DIEAmusementModel modelFromJSONDictionary:[DIEDataManager sharedManager].AmusementArray[indexPath.row]];
        //
        [cell.mainIV sd_setImageWithURL:[NSURL URLWithString:amusementModelModel.picUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        //
        cell.mainLabel.text=amusementModelModel.title;
        cell.detailLabel.text=amusementModelModel.desc;
        cell.detailLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.detailLabel.numberOfLines = 0;
        return cell;
        
        
        
    }else if (tableView.tag==13){
        
       HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
        
        
        if (cell == nil) {
            cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id1"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
        }
        DIETechnologyNewsModel * technologyNewsModel=[DIETechnologyNewsModel modelFromJSONDictionary:[DIEDataManager sharedManager].TechnologyNewsArray[indexPath.row]];
        [cell.mainIV sd_setImageWithURL:[NSURL URLWithString:technologyNewsModel.picUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.mainLabel.text=technologyNewsModel.title;
        cell.detailLabel.text=technologyNewsModel.desc;
        cell.detailLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.detailLabel.numberOfLines = 0;
        // Configure the cell...
        return cell;
        
        
        
    }else if (tableView.tag==14){
        
        
        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
        
        
        if (cell == nil) {
            cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id1"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
        }
        DIEInternationalNewsModel * internationalNewsModel=[DIEInternationalNewsModel modelFromJSONDictionary:[DIEDataManager sharedManager].InternationalNewsArray[indexPath.row]];
        [cell.mainIV sd_setImageWithURL:[NSURL URLWithString:internationalNewsModel.picUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.mainLabel.text=internationalNewsModel.title;
        cell.detailLabel.text=internationalNewsModel.desc;
        cell.detailLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.detailLabel.numberOfLines = 0;
        // Configure the cell...
        return cell;
        
        
        
    }
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==11) {
        return 100;
    }else if (tableView.tag==12){
        return 170;
        
    }else if (tableView.tag==13){
        return 100;
        
    }else if (tableView.tag==14){
        
        return 100;
    }
    return 11;
}
@end

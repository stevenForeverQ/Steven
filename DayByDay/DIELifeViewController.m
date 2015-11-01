  //
//  DIELifeViewController.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIELifeViewController.h"
#import "SDCycleScrollView.h"
#import "MJRefresh.h"
#import "DIELifeTableViewCell.h"
#import "DIENetworkManager.h"
#import "DIEDataManager.h"
#import "ScrollViewHeaderView.h"
#import "DIEMovieViewController.h"
#import "DIEHomeViewController.h"
const static CGFloat kMinimumInteritemSpacing = 10.f;
@interface DIELifeViewController()<UITableViewDataSource,UITableViewDelegate>
{
    
    SDCycleScrollView *_LifeCycleScrollView;
    NSMutableArray *pullAnimationImages;
    NSMutableArray *shakeAnimationImages;
    NSArray * dataSource;
    NSArray * sectionHeaderTexts;
    CGSize size;
    NSInteger i;
}
@property (nonatomic, strong) UITableView *LifeTableView;
@end
static NSString * const SecondCell = @"SecondCell";
static NSString * const firstCell = @"firstCell";
@implementation DIELifeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    size=self.view.frame.size;//界面的size
    sectionHeaderTexts = @[@"",@"休闲娱乐", @"出行游玩", @"生活查询"];
    dataSource = @[@[@"电影 ",@"团购",@"旅游",@"健康"],
                   @[@"电影",@"音乐",@"团购"],
                   @[@"火车票",@"油价",@"景点"],
                   @[@"天气查询",@"空气质量",@"汇率查询",@"违章查询",@"邮编查询",@"成语查询"]
                   ];
    self.navigationItem.title=@"生活";
    pullAnimationImages = [NSMutableArray array];
    shakeAnimationImages = [NSMutableArray array];
    
    NSArray *pullAnimationName = @[@"icon_pull_animation_1",@"icon_pull_animation_2",@"icon_pull_animation_3",@"icon_pull_animation_4",@"icon_pull_animation_5"];
    NSArray *shakeAnimationName = @[@"icon_shake_animation_1",@"icon_shake_animation_2",@"icon_shake_animation_3",@"icon_shake_animation_4", @"icon_shake_animation_5",@"icon_shake_animation_6",@"icon_shake_animation_7",@"icon_shake_animation_8"];
    for (NSString *str in pullAnimationName) {
        UIImage *image = [UIImage imageNamed:str];
        [pullAnimationImages addObject:image];
    }
    
    for (NSString *str in shakeAnimationName) {
        UIImage *image = [UIImage imageNamed:str];
        [shakeAnimationImages addObject:image];
    }

  
    [self TableViewLoad];
    _shouldInitPullToRefresh=YES;
    //[self shouldAddPullToRefresh:_shouldInitPullToRefresh];
   
}
- (void)TableViewLoad
{
    _LifeTableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

     _LifeTableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imageBg.jpg"]];
   // _LifeTableView.scrollEnabled=NO;//滚动禁止
    [_LifeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:firstCell];
    [_LifeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SecondCell];
    //[_LifeTableView registerClass:[ScrollViewHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
//    [_LifeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    _LifeTableView.dataSource = self;
    _LifeTableView.delegate = self;
    _LifeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.LifeTableView];
   
}

- (void)dealloc {
    self.LifeTableView.delegate = nil;
    self.LifeTableView.dataSource = nil;
    [self.LifeTableView removeFromSuperview];
    self.LifeTableView=nil;
}
- (void)shouldAddPullToRefresh:(BOOL)isAdd
{
    if (isAdd) {
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        // 设置普通状态的动画图片
        [header setImages:@[[UIImage imageNamed:@"icon_transform_animation"]] forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [header setImages:pullAnimationImages forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [header setImages:shakeAnimationImages forState:MJRefreshStateRefreshing];
        
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        // 设置header
        self.LifeTableView.header = header;
    }else{
        self.LifeTableView.header = nil;
    }
}

- (void)loadNewData
{
    _shouldInitPullToRefresh=NO;
    [self shouldAddPullToRefresh:_shouldInitPullToRefresh];
    
    
}
#pragma mark UITableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowsData = dataSource[section];
    return rowsData.count;
    //一个组中 items的个数
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID;
    UITableViewCell *cell=nil;
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.item<4) {
                cellID = SecondCell;
                cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
                // cell.KindImageView.image=[UIImage imageNamed:@"placeholder.png"];
                cell.textLabel.text=dataSource[indexPath.section][indexPath.item];
                 cell.textLabel.textColor = [UIColor whiteColor];
                cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
                cell.backgroundColor=[UIColor clearColor];
                return cell;
            }
            
        }
            break;
        case 1:
        {
            if (indexPath.item<3) {
                cellID = firstCell;
                cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
                // cell.KindImageView.image=[UIImage imageNamed:@"placeholder.png"];
                cell.textLabel.text=dataSource[indexPath.section][indexPath.item];
                 cell.textLabel.textColor = [UIColor whiteColor];
                cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
                cell.backgroundColor=[UIColor clearColor];
                return cell;
                
            }
            
        }
            break;
        case 2:
        {
            if (indexPath.item<3) {
                cellID = firstCell;
                cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
                // cell.KindImageView.image=[UIImage imageNamed:@"placeholder.png"];
                cell.textLabel.text=dataSource[indexPath.section][indexPath.item];
                 cell.textLabel.textColor = [UIColor whiteColor];
                cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
                cell.backgroundColor=[UIColor clearColor];
                return cell;
            }
           
        }
            break;
        case 3:
        {
            if (indexPath.item<6) {
                cellID = SecondCell;
                cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
                // cell.KindImageView.image=[UIImage imageNamed:@"placeholder.png"];
                cell.textLabel.text=dataSource[indexPath.section][indexPath.item];
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
                cell.backgroundColor=[UIColor clearColor];
                return cell;
            }
            
        }
            break;
    }
     cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor=[UIColor clearColor];
   
    return cell;
    
    
}
#pragma mark UICollectionViewDelegateFlowLayout

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ScrollViewHeaderView *Header=nil;
    if (section==0) {
        Header=[[ScrollViewHeaderView alloc]initWithFrame:CGRectMake(0,0,size.width, 100)];
        
        return Header;
    }
    else
    {
        UILabel *la= [[UILabel alloc]initWithFrame:self.view.frame];
        la.text=sectionHeaderTexts[section];
        la.textColor=[UIColor whiteColor];
        la.textAlignment=NSTextAlignmentLeft;
        return la;
       
    }
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 100;
    }
    else{
        return 30;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section==0 && indexPath.row==0) {
        DIEMovieViewController *movieCtr=[DIEMovieViewController new];
        DIEHomeViewController *homeCtr =[ DIEHomeViewController new];
        self.tabBarController.tabBar.hidden=YES;
        self.hidesBottomBarWhenPushed=YES;
        
        [self.navigationController pushViewController:movieCtr animated:YES];
        
    }
}




@end

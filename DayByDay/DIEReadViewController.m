//
//  DIEReadViewController.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEReadViewController.h"
#import "DIENetworkManager.h"
#import "DIEDataManager.h"
#import "DIENotificationConfig.h"
#import "DIESocialNewsModel.h"
#import "DIEAnecdotesModel.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "DIEReadWebViewController.h"
@interface DIEReadViewController()<UITableViewDataSource,UITableViewDelegate>
{
    
    // 当前一共有多少篇文章，默认为3篇
    NSInteger numberOfItems;
    // 保存当前查看过的数据
    NSMutableDictionary *readItems;
    // 最后更新的日期
    NSString *lastUpdateDate;
    // 当前是否正在右拉刷新标记
    BOOL isRefreshing;
    //
    NSMutableArray *ReadWebArray;
    NSURL * ReadWebUrl;
    //下拉刷新数组
    NSMutableArray *pullAnimationImages;
    NSMutableArray *shakeAnimationImages;
}
@property(nonatomic,strong)UITableView *readTableView;;
@end
@implementation DIEReadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    [self loadReadData];
    [self tableViewLoad];
    ReadWebArray = [NSMutableArray array];
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
    _shouldInitPullToRefresh=YES;
    [self shouldAddPullToRefresh:_shouldInitPullToRefresh];

    
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
        self.readTableView.header = header;
    }else{
        self.readTableView.header = nil;
        
    }
}

- (void)loadNewData
{
    _shouldInitPullToRefresh=NO;
    [self shouldAddPullToRefresh:_shouldInitPullToRefresh];
    
    [[DIEDataManager sharedManager] UpdateWithAnecdotesApiKey];
    
}
- (void)loadReadData
{
    DIEAddObserver(self, @selector(didUpdate:), kDIEAnecdotesUpdateNotif, nil);//网络加载成功后数据重载

    [[DIEDataManager sharedManager] UpdateWithAnecdotesApiKey];
}
- (void)didUpdate:(UIButton *)sender
{
    [_readTableView reloadData];
}
- (void)tableViewLoad
{
    _readTableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _readTableView.backgroundColor = [UIColor whiteColor];
    _readTableView.dataSource=self;
    _readTableView.delegate=self;
    _readTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _readTableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"imageBg.jpg"]];
    [_readTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _readTableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去除cell下的线
    [self.view addSubview:_readTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[DIEDataManager sharedManager].AnecdotesArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    DIEAnecdotesModel * anecdotesModel=[DIEAnecdotesModel modelFromJSONDictionary:[DIEDataManager sharedManager].AnecdotesArray[indexPath.row]];
    cell.textLabel.text= anecdotesModel.desc;
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor whiteColor];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:anecdotesModel.picUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [ReadWebArray addObject:anecdotesModel.url];
    ReadWebUrl=anecdotesModel.url;
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%d,%d",indexPath.row,indexPath.section);
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];//点击的效果
    DIEReadWebViewController *WedView=[DIEReadWebViewController new];
    WedView.curtIndexPath=indexPath.row;
    WedView.UrlArray = ReadWebArray;
    WedView.SelfUrl=ReadWebUrl;
    [self.navigationController pushViewController:WedView animated:YES];
}
@end

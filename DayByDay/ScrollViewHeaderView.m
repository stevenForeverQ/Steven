//
//  ScrollViewHeaderView.m
//  DayByDay
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "ScrollViewHeaderView.h"
#import "SDCycleScrollView.h"
@interface ScrollViewHeaderView ()
{
    SDCycleScrollView *cycleScrollView;
}
@end
@implementation ScrollViewHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ScrollImageUrl = [NSMutableArray array];
        cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.frame imageURLStringsGroup:nil];
        [self addSubview:cycleScrollView];
    }
    return self;
}
- (void)layoutSubviews
{
    NSArray *images = @[[UIImage imageNamed:@"1.jpg"],
                        [UIImage imageNamed:@"2.jpg"],
                        [UIImage imageNamed:@"3.jpg"],
                        [UIImage imageNamed:@"4.jpg"]
                        ];
    
    NSArray *imagesURLStrings=_ScrollImageUrl;
    if (imagesURLStrings.count==0) {
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:self.frame imagesGroup:images];
        cycleScrollView2.dotColor = [UIColor orangeColor];
        cycleScrollView2.infiniteLoop = YES;
        cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        [self addSubview:cycleScrollView2];
        cycleScrollView2.autoScrollTimeInterval = 3.0f;// 自定义轮播时间间隔
    }
    else{
    //网络加载 --- 创建带标题的图片轮播器
    // 模拟网络延时情景
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.dotColor = [UIColor orangeColor]; // 自定义分页控件小圆标颜色
    cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];//站位图
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //     --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    });
    cycleScrollView.autoScrollTimeInterval = 3.0f;// 自定义轮播时间间隔
    }

}
@end

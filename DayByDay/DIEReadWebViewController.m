//
//  DIEReadWebViewController.m
//  DayByDay
//
//  Created by apple on 15/10/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEReadWebViewController.h"
@interface DIEReadWebViewController()
{
    UIWebView * NewsWebView;
}
@end
@implementation DIEReadWebViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    NewsWebView=nil;
    NSLog(@"%ld",self.curtIndexPath);
    NSLog(@"%@",self.UrlArray);
    NSLog(@"%@",self.SelfUrl);
    NewsWebView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:self.SelfUrl];
    [NewsWebView loadRequest:urlRequest];
    [self.view addSubview:NewsWebView];
}
@end

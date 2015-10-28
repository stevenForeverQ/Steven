//
//  AppDelegate.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "AppDelegate.h"
#import "DIEHomeViewController.h"
#import "DIELifeViewController.h"
#import "DIEReadViewController.h"
#import "DIEUserViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc]initWithFrame:frame];
    self.window.backgroundColor = [UIColor whiteColor];
    DIEHomeViewController *HomeViewController=[[DIEHomeViewController alloc]init];
    DIELifeViewController *LifeViewController=[[DIELifeViewController alloc]init];
    DIEReadViewController *ReadViewController=[[DIEReadViewController alloc]init];
    DIEUserViewController *UserViewController=[[DIEUserViewController alloc]init];
    //导航栏
    UINavigationController *HomeNavigationController = [[UINavigationController alloc]initWithRootViewController:HomeViewController];
    UINavigationController *LifeNavigationController = [[UINavigationController alloc]initWithRootViewController:LifeViewController];
    UINavigationController *UserNavigationController = [[UINavigationController alloc]initWithRootViewController:UserViewController];
    UINavigationController *ReadNavigationController = [[UINavigationController alloc]initWithRootViewController:ReadViewController];
    //设置标签图片
    HomeNavigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[[UIImage imageNamed:@"Task_Normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Task@2x"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    //life 标题栏图片 上下设法
    UITabBarController *lifeTabBarController = [[UITabBarController alloc] init];
    lifeTabBarController.viewControllers = @[LifeNavigationController];
    lifeTabBarController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"生活" image:[[UIImage imageNamed:@"Task_Normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Task@2x"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    //[LifeNavigationController.navigationBar setBarTintColor:[UIColor colorWithRed:12/255.0 green:92/225.0 blue:119/255.0 alpha:0.7]];
    [LifeNavigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    //用户
    UITabBarController *UserTabBarController = [[UITabBarController alloc] init];
    UserTabBarController.viewControllers = @[UserNavigationController];
    UserTabBarController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"isMe" image:[[UIImage imageNamed:@"Task_Normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Task@2x"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    //阅读
    UITabBarController *ReadTabBarController = [[UITabBarController alloc]init];
    ReadTabBarController.viewControllers = @[ReadNavigationController];
    ReadTabBarController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"阅读" image:[[UIImage imageNamed:@"Task_Normal@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Task@2x"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    //根界面标签栏
    UITabBarController *homeTabBarController = [[UITabBarController alloc] init];
    homeTabBarController.viewControllers = @[HomeNavigationController,lifeTabBarController,ReadTabBarController,UserTabBarController];
    
    
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    self.window.rootViewController=homeTabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

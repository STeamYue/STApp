//
//  AppDelegate.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark -获取AppDelegate
+ (instancetype)shareAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self showMainTarBarC];//进入主页面TabBar
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
}


- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark -TarBarC
- (void)showMainTarBarC
{
    STMainTabBarC *tabBars = [[STMainTabBarC alloc]init];
    self.window.rootViewController = tabBars;
}


@end

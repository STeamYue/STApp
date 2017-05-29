//
//  AppDelegate.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark -获取AppDelegate
+ (instancetype)shareAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   // [self showLoginViewC];// 登录
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

#pragma mark - Login 登录
-  (void)showLoginViewC{
    LoginViewC *loginViewC = (LoginViewC *)[LoginViewC showSTBaseViewCOnSuperViewC:nil
                                                                      andFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                          andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                       andComplete:^(BOOL finished,
                                                                                     STBaseViewC *stBaseViewC) {
        
    }];
    loginViewC.title = @"登录";
    [loginViewC loginView];
    UINavigationController *loginNavC = [[UINavigationController alloc]initWithRootViewController:loginViewC];
    self.window.rootViewController = loginNavC;
}
#pragma mark -TarBarC
- (void)showMainTarBarC
{
    STMainTabBarC *tabBars = [[STMainTabBarC alloc]init];
    self.window.rootViewController = tabBars;
}


@end

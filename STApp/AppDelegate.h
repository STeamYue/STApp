//
//  AppDelegate.h
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STMainTabBarC.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//1.拿到AppDelegate
+ (instancetype)shareAppDelegate;

@end


//
//  STMainTabBarC.h
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarCPopMenu.h"
@interface STMainTabBarC : UITabBarController
@property(nonatomic,strong)  UINavigationController *popNavC;
@property (strong, nonatomic)TabBarCPopMenu *tabBarCPopMenu;
@end

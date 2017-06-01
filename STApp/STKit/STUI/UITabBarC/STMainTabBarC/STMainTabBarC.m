//
//  STMainTabBarC.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STMainTabBarC.h"
#import "PersonalViewC.h"
#import "HomeViewC.h"
#import "ChatViewC.h"
#import "ZoneViewC.h"
#import "FindViewC.h"
@interface STMainTabBarC () <UITabBarControllerDelegate>

@end

@implementation STMainTabBarC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self personalViewC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//设置个人中心
- (void)personalViewC{
    //0-- 发现
    FindViewC *findViewC = (FindViewC *)[FindViewC showSTBaseViewCOnSuperViewC:nil
                                                                  andFrameRect:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_HEIGHT)
                                                      andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                   andComplete:^(BOOL finished,
                                                                                 STBaseViewC *stBaseViewC) {
                                                                   }];
    findViewC.recordTabBarC = self;     //记录
    //findViewC.title = @"发现";
    [findViewC findView];
    findViewC.automaticallyAdjustsScrollViewInsets = false;//拮据scrollow 里子View向下偏移问题
    UINavigationController *findNavC = [[UINavigationController alloc] initWithRootViewController:findViewC];
    findNavC.navigationBar.hidden = YES;

    //2-- 中间动态
    ZoneViewC *zoneViewC = (ZoneViewC *)[ChatViewC showSTBaseViewCOnSuperViewC:nil
                                                                  andFrameRect:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_HEIGHT)
                                                      andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                   andComplete:^(BOOL finished,
                                                                                 STBaseViewC *stBaseViewC) {
                                                                   }];
    zoneViewC.recordTabBarC = self;     //记录
   // findViewC.title = @"动态";
    UINavigationController *zoneNavC = [[UINavigationController alloc] initWithRootViewController:zoneViewC];
    
    //4--个人中心
    PersonalViewC *personalViewC = (PersonalViewC *)[PersonalViewC showSTBaseViewCOnSuperViewC:nil
                                                                                  andFrameRect:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_HEIGHT)
                                                                      andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                                   andComplete:^(BOOL finished,
                                                                                                 STBaseViewC *stBaseViewC) {
                                                                                   }];
    personalViewC.recordTabBarC = self;  //记录
    personalViewC.title = @"我的";
    UINavigationController *personalNavC = [[UINavigationController alloc] initWithRootViewController:personalViewC];

    self.viewControllers = @[findNavC,zoneNavC,personalNavC];
    //0--发现
    UITabBarItem *findViewCItem = [self.tabBar.items objectAtIndex:0];
    [self showTabBarItem:findViewCItem
              itemImgStr:@"tabBar_find_select"
        selectItemImgStr:@"tabBar_find_unselect"
            itemTitleStr:@"发现"];
    //1--中间
    UITabBarItem *zoneViewCItem = [self.tabBar.items objectAtIndex:1];
    [self showTabBarItem:zoneViewCItem
              itemImgStr:@"tabBar_add"
        selectItemImgStr:@"tabBar_add"
            itemTitleStr:@"中间"];
    //2--个人中心
    UITabBarItem *personalItem = [self.tabBar.items objectAtIndex:2];
    [self showTabBarItem:personalItem
              itemImgStr:@"tabBar_personal_select"
        selectItemImgStr:@"tabBar_personal_unselect"
            itemTitleStr:@"我的"];
    
    
    UITabBarItem* item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    
       self.tabBar.tintColor = [UIColor greenColor];
      self.delegate = self;
}
#pragma mark 设置tabBarItem默认图标和选中图标
- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController{
    //找到选择索引
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if(index == 1){
        //弹出  菜单界面
        [self tabBarCPopMenu] ;
        self.tabBarCPopMenu.menu.animationType =  HyPopMenuViewAnimationTypeSina;
        self.tabBarCPopMenu.menu.backgroundType = HyPopMenuViewBackgroundTypeLightTranslucent;
        [[self tabBarCPopMenu] showPopViewOfThemeImgMArray:@[@"pop_0",@"pop_1"].mutableCopy
                                            themeNameMArray:@[@"美颜相机",@"发布动态"].mutableCopy
                                             themeNameColor:[UIColor redColor]
                                             transitionType:PopMenuTransitionTypeCustomizeApi
                                   transitionRenderingColor:[UIColor clearColor]];
        return NO;//iteam 不响应TabBatC的select事件
    }
    return YES;
}
#pragma mark -  设置UITabBarItem
- (void)showTabBarItem:(UITabBarItem *) tabBarItem
            itemImgStr:(NSString *)itemImgStr
      selectItemImgStr:(NSString *)selectItemImgStr
          itemTitleStr:(NSString *)itemTitleStr
{
    [tabBarItem setImage:[[UIImage imageNamed:itemImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem setSelectedImage:[[UIImage imageNamed:selectItemImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem setTitle:itemTitleStr];
    tabBarItem.imageInsets=UIEdgeInsetsMake(2, 2, 2, 2);

}
#pragma mark - 点击+号弹出菜单
- (TabBarCPopMenu *)tabBarCPopMenu
{
    if (!_tabBarCPopMenu) {
        _tabBarCPopMenu = [TabBarCPopMenu new];
    }
    return _tabBarCPopMenu;
}

@end

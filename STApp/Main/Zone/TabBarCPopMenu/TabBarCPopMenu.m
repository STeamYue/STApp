//
//  TabBarCPopMenu.m
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "TabBarCPopMenu.h"
#import "STBeautyViewC.h"
#import "AppDelegate.h"
@implementation TabBarCPopMenu
#pragma mark - <HyPopMenuViewDelegate> 子重写
-(void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index{
    // 子重写
    if (index == 0 ) {
        [self show01];
    }
    if (index == 1 ) {
        [self show02];
    }
    
}
#pragma mark - QQ
- (void)show01{
    STBeautyViewC *stBeautyViewC =  [[STBeautyViewC alloc]init];
    stBeautyViewC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //stBeautyViewC.view.backgroundColor = [UIColor redColor];
    [[stBeautyViewC stBeautyView] videoCamera];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:stBeautyViewC];
    nav.navigationBar.hidden = YES;
    [AppDelegate shareAppDelegate].window.rootViewController = nav;
}
#pragma mark - Wechat
- (void)show02{

}
@end

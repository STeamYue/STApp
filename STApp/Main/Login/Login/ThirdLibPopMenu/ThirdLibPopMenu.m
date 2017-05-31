//
//  ThirdLibPopMenu.m
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "ThirdLibPopMenu.h"
#import "AppDelegate.h"
@implementation ThirdLibPopMenu
#pragma mark - <HyPopMenuViewDelegate> 子重写
-(void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index{
    // 子重写
    if (index == 0 ) {
        [self showQQ];
    }
    if (index == 1 ) {
        [self showWechat];
    }
    
}
#pragma mark - QQ
- (void)showQQ{
    [[AppDelegate shareAppDelegate]showMainTarBarC];
}
#pragma mark - Wechat
- (void)showWechat{
    [[AppDelegate shareAppDelegate]showMainTarBarC]; 
}
@end

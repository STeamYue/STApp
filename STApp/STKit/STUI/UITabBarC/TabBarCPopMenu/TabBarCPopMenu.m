//
//  TabBarCPopMenu.m
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "TabBarCPopMenu.h"

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

}
#pragma mark - Wechat
- (void)show02{

}
@end

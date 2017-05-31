//
//  STPopMenu.h
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HyPopMenuView.h"
typedef NS_ENUM(NSInteger, STPopMenuShowState) {
    STPopMenuHidden   = 0,//消失
    STPopMenuShow      = 1,//显示
};
@interface STPopMenu : NSObject <HyPopMenuViewDelegate>
@property (nonatomic, strong) HyPopMenuView       *menu;             //点击TabBarC中间btn弹出菜单View
@property (nonatomic,assign)  STPopMenuShowState  stPopMenuShowState;//控制menu的显示
@property (nonatomic, strong) UITabBarController  *tabBarC;          //记录tabBarC
#pragma mark -显示pop菜单界面
-(void)showPopViewOfThemeImgMArray:(NSMutableArray <NSString *>*)themeImgMArray
                   themeNameMArray:(NSMutableArray <NSString *>*)themeNameMArray
                    themeNameColor:(UIColor *)themeNameColor
                    transitionType:(PopMenuTransitionType)transitionType
          transitionRenderingColor:(UIColor*)transitionRenderingColor;
@end

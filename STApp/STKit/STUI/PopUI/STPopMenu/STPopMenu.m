//
//  STPopMenu.m
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STPopMenu.h"

@implementation STPopMenu
#pragma mark -显示pop菜单界面
-(void)showPopViewOfThemeImgMArray:(NSMutableArray <NSString *>*)themeImgMArray
                   themeNameMArray:(NSMutableArray <NSString *>*)themeNameMArray
                    themeNameColor:(UIColor *)themeNameColor
                    transitionType:(PopMenuTransitionType)transitionType
          transitionRenderingColor:(UIColor*)transitionRenderingColor{
    //判断menu 是否存在
    if (!_menu) {
        [self menu];
    }
    //构建数据
    NSMutableArray *tempDSMArray = @[].mutableCopy;
    //    NSMutableArray *picStrMArray = @[@"pop_0",
    //                                     @"pop_1",
    //                                     @"pop_2",
    //                                     @"pop_3",
    //                                     @"pop_4",
    //                                     @"pop_2"].mutableCopy;
    //    NSMutableArray *titleStrMArray = @[@"出售商品",
    //                                       @"红包照片",
    //                                       @"出售微信",
    //                                       @"写真相册",
    //                                       @"图文动态",
    //                                       @"视频动态"].mutableCopy;
    
    if (themeImgMArray.count == themeNameMArray.count) {
        for (int i = 0;i<themeNameMArray.count;i++) {
            [tempDSMArray addObject: [PopMenuModel
                                      allocPopMenuModelWithImageNameString:themeImgMArray[i]
                                      AtTitleString:themeNameMArray[i]
                                      AtTextColor:themeNameColor
                                      AtTransitionType:transitionType
                                      AtTransitionRenderingColor:transitionRenderingColor]];
        }
    }else{
        return;
    }
    //ds
    _menu.dataSource = tempDSMArray.copy;
    //显示
    [_menu openMenu];
}


#pragma mark ********************************* Delegate 协议方法  ************************************
#pragma mark ********************************* <HyPopMenuViewDelegate>
-(void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index{
    // 子重写
}

#pragma mark ---------------------------------- getter区域 ---------------------------------
#pragma mark - pop menu 控制菜单View
-(HyPopMenuView *)menu{
    if (!_menu) {
        _menu = [HyPopMenuView sharedPopMenuManager];
        //delegate
        _menu.delegate = self;
        //controlelr animation speed
        _menu.popMenuSpeed = 12.0f;
        //自动填充颜色
        _menu.automaticIdentificationColor = false;
        //pop动画类型
        _menu.animationType = HyPopMenuViewAnimationTypeCenter;
        _menu.backgroundType = HyPopMenuViewBackgroundTypeDarkTranslucent;
    }
    return _menu;
}
#pragma mark --------------------------------- setter 管控区域 --------------------------------
-(void)setStPopMenuShowState:(STPopMenuShowState)stPopMenuShowState{
    //menu
    if (!_menu) {
        [self menu];
    }
    
    switch (stPopMenuShowState) {
        case STPopMenuHidden:
            [_menu closeMenu];
            
            break;
        case STPopMenuShow:
           // [self showPopView];
            break;
            
        default:
            break;
    }
    _stPopMenuShowState = stPopMenuShowState;
}






@end

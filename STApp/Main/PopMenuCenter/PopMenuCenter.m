//
//  PopMenuCenter.m
//  FanweApp
//
//  Created by 岳克奎 on 17/3/10.
//  Copyright © 2017年 xfg. All rights reserved.
//

#import "PopMenuCenter.h"

@implementation PopMenuCenter
#pragma mark ----------------------- life cycle生命周期管控区域 -------------------
/**
 * @brief: 单利
 *
 * @discussion:我的想法是，用单利管理，这样能够通过的player对应的控制器来控制。播放，暂停。如果不这样，需要频繁的
 */
static PopMenuCenter *signleton = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signleton = [super allocWithZone:zone];
    });
    return signleton;
}
+(PopMenuCenter *)sharePopMenuCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signleton = [[self alloc] init];
    });
    
    return signleton;
}
+ (id)copyWithZone:(struct _NSZone *)zone
{
    return signleton;
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return signleton;
}
#pragma mark ---------------------------------- Delegate 协议区域-------------------------------------
#pragma mark ---------------------------------- STPop的menu菜单delegate 协议方法------------------------
-(void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index{
    //目前我写的是6个
    if (index>5) {
        return;
    }
    switch (index) {
        case 0:
            [self showGoodsDynamicViewC];          //商品动态
            break;
        case 1:
            [self showRedEnvelopeDynamicViewC];   //红包动态
            break;
        case 2:
            [self showSaleWeChatViewC];           //出售微信
            break;
        case 3:
            [self showPhotoAlbumSelectViewC];     //写真动态
            break;
        case 4:
            [self showGraphicDynamicViewC];       //图文动态
            break;
        case 5:
            [self showVideoDynamicViewC];         //视频动态
            break;
        default:
            break;
            
    }
}

#pragma mark ---------------------------------private methods  私有方法区域---------------------
//私有方法 不允许外部调用
#pragma mark -显示pop菜单界面
-(void)showPopView{
    //开启定位
//    [[STBMKCenter shareManager] showUserLocationServiceWithComplete:^(BMKUserLocation *bmkUserLocation) {
//        //拿到定位坐标 BMKUserLocation给具体ViewC
//        //        [[STBMKCenter shareManager] showNearbySearchwithUserLocation:bmkUserLocation];
////        [[STBMKCenter shareManager]  showAddressWithuserLocation:bmkUserLocation Complete:^(BMKGeoCodeSearch *search, BMKReverseGeoCodeResult *result, BMKSearchErrorCode error) {
////            NSLog(@"===address  ======== %@",result.address);
////            
////        }];
//    }];
    
    //判断menu 是否存在
    if (!_menu) {
        [self menu];
    }
    //构建数据
    NSMutableArray *tempDSMArray = @[].mutableCopy;
    NSMutableArray *picStrMArray = @[@"pop_0",
                                     @"pop_1",
                                     @"pop_2",
                                     @"pop_3",
                                     @"pop_4",
                                     @"pop_2"].mutableCopy;
    NSMutableArray *titleStrMArray = @[@"出售商品",
                                       @"红包照片",
                                       @"出售微信",
                                       @"写真相册",
                                       @"图文动态",
                                       @"视频动态"].mutableCopy;
    
    if (picStrMArray.count == titleStrMArray.count) {
        for (int i = 0;i<picStrMArray.count;i++) {
            [tempDSMArray addObject: [PopMenuModel
                                      allocPopMenuModelWithImageNameString:picStrMArray[i]
                                      AtTitleString:titleStrMArray[i]
                                      AtTextColor:[UIColor grayColor]
                                      AtTransitionType:PopMenuTransitionTypeSystemApi
                                      AtTransitionRenderingColor:nil]];
        }
    }
    //ds
    _menu.dataSource = tempDSMArray.copy;
    //显示
    [_menu openMenu];
}
#pragma mark -  0 - 商品动态
-(void)showGoodsDynamicViewC{

    
}
#pragma mark -  1 - 红包照片
-(void)showRedEnvelopeDynamicViewC{
    
}
#pragma mark - 2 -出售微信
-(void)showSaleWeChatViewC{
  
    
}
#pragma mark - 3 - 写真相册选择首页
-(void)showPhotoAlbumSelectViewC{
}
#pragma mark -  4 - 图文动态页面
-(void)showGraphicDynamicViewC{

}
#pragma mark -  5 - 视频动态页面
-(void)showVideoDynamicViewC{

}
//VideoDynamicViewC
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
            [self showPopView];
            break;
            
        default:
            break;
    }
    _stPopMenuShowState = stPopMenuShowState;
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
        _menu.animationType = HyPopMenuViewAnimationTypeSina;
        _menu.backgroundType = HyPopMenuViewBackgroundTypeLightTranslucent;
    }
    return _menu;
}
@end

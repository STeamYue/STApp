//
//  LoginView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "LoginView.h"
//#import "PopMenuCenter.h"
@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)showThirdLogin:(UIButton *)sender {
//    PopMenuCenter *popMenuCenter = [PopMenuCenter sharePopMenuCenter];
//    [popMenuCenter setStPopMenuShowState:STPopMenuShow];
    //弹出 第三方登录 菜单界面
    [self thirdLibPopMenu];
    self.thirdLibPopMenu.menu.animationType =  HyPopMenuViewAnimationTypeViscous;
    self.thirdLibPopMenu.menu.backgroundType = HyPopMenuViewBackgroundTypeDarkTranslucent;
    [[self thirdLibPopMenu] showPopViewOfThemeImgMArray:@[@"pop_0",@"pop_1"].mutableCopy
                                        themeNameMArray:@[@"QQ",@"微信"].mutableCopy
                                         themeNameColor:[UIColor redColor]
                                         transitionType:PopMenuTransitionTypeSystemApi
                               transitionRenderingColor:[UIColor blackColor]];
    sender.hidden = YES;
    //增加 退出时候的监听 HyPopMenuViewWillHideNotification
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(showLoginBtn)
                                                name:@"HyPopMenuViewDidHideNotification"
                                              object:nil];
}
- (void)showLoginBtn{
    _thirdLoginBtn.hidden = NO;
}
- (ThirdLibPopMenu *)thirdLibPopMenu
{
    if (!_thirdLibPopMenu) {
        _thirdLibPopMenu = [ThirdLibPopMenu new];
    }
    return _thirdLibPopMenu;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

//
//  LoginView.h
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"
#import "ThirdLibPopMenu.h"
@interface LoginView : STBaseView
@property (weak, nonatomic) IBOutlet UIButton *thirdLoginBtn;
@property (nonatomic, strong)ThirdLibPopMenu  *thirdLibPopMenu;
@end

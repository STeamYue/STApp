//
//  LoginViewC.h
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"
#import "LoginView.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import "STStarMovieAVPlayerViewC.h"
@interface LoginViewC : STStarMovieAVPlayerViewC
@property (strong, nonatomic) LoginView *loginView;  //登录View

@end

//
//  STStarMovieAVPlayerViewC.h
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseViewC.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface STStarMovieAVPlayerViewC : STBaseViewC <AVPlayerViewControllerDelegate>
@property (nonatomic,strong) AVPlayerViewController *playerViewC;
@property (nonatomic,strong) AVPlayer               *player;
- (BOOL)playOfMovieStr:(NSURL *)movieUrl;
@end


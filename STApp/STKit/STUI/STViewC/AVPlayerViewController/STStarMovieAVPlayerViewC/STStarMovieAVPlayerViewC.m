//
//  STStarMovieAVPlayerViewC.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STStarMovieAVPlayerViewC.h"

@interface STStarMovieAVPlayerViewC ()

@end

@implementation STStarMovieAVPlayerViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AVPlayerViewController *)playerViewC{
    if (!_playerViewC) {
        _playerViewC = [AVPlayerViewController new];
        _playerViewC.delegate = self;
        _playerViewC.showsPlaybackControls = false;
        _playerViewC.videoGravity = AVLayerVideoGravityResizeAspect;
       // _playerViewC.view.backgroundColor = [UIColor redColor];
        _playerViewC.view.frame = self.view.frame;
        _playerViewC.allowsPictureInPicturePlayback = false;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(runLoopTheMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

    }
    return _playerViewC;
}

- (BOOL)playOfMovieStr:(NSURL *)movieUrl{
    [self playerViewC];
    _player = [[AVPlayer alloc] initWithURL:movieUrl];
    [_player play];
    _player.allowsExternalPlayback = YES;
    _playerViewC.player = _player;
    
    return NO;
}
#pragma mark --- AVPlayerViewControllerDelegate
/*!
	@method		playerViewControllerWillStartPictureInPicture:
	@abstract	Delegate can implement this method to be notified when Picture in Picture will start.
 */
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerWillStartPictureInPicture");
}

/*!
	@method		playerViewControllerDidStartPictureInPicture:

	@abstract	Delegate can implement this method to be notified when Picture in Picture did start.
 */
- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerDidStartPictureInPicture");
}

/*!
	@method		playerViewController:failedToStartPictureInPictureWithError:
   An error describing why it failed.
	@abstract	Delegate can implement this method to be notified when Picture in Picture failed to start.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"failedToStartPictureInPictureWithError");
}

/*!
	@method		playerViewControllerWillStopPictureInPicture:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method to be notified when Picture in Picture will stop.
 */
- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerWillStopPictureInPicture");
    
}

/*!
	@method		playerViewControllerDidStopPictureInPicture:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method to be notified when Picture in Picture did stop.
 */
- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController{
    NSLog(@"playerViewControllerDidStopPictureInPicture");
}

/*!
	@method		playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:
	@param		playerViewController
 The player view controller.
	@abstract	Delegate can implement this method and return NO to prevent player view controller from automatically being dismissed when Picture in Picture starts.
 */
- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController {
    NSLog(@"playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart");
    return false;
}

/*!
	@method		playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:
	@param		playerViewController
 The player view controller.
	@param		completionHandler
 The completion handler the delegate needs to call after restore.
	@abstract	Delegate can implement this method to restore the user interface before Picture in Picture stops.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler{
    NSLog(@"restoreUserInterfaceForPictureInPictureStopWithCompletionHandler");
    completionHandler(true);
}
- (void)runLoopTheMovie:(NSNotification *)n{
    //注册的通知  可以自动把 AVPlayerItem 对象传过来，只要接收一下就OK
    
    AVPlayerItem * p = [n object];
    //关键代码
    [p seekToTime:kCMTimeZero];
    
    [_player play];
    NSLog(@"=========重播");
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

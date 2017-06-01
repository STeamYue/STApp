//
//  STBeautyView.m
//  STApp
//
//  Created by 岳克奎 on 2017/6/1.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBeautyView.h"

#define kMARGap 20.0
#define kMARSwitchW 30
#define kLimitRecLen 15.0f
#define kCameraWidth 540.0f
#define kCameraHeight 960.0f
#define kRecordW 87
#define kRecordCenter CGPointMake(self.frame.size.width / 2, self.frame.size.height - 50)
#define kFaceUColor [UIColor colorWithRed:66 / 255.0 green:222 / 255.0 blue:182 / 255.0 alpha:1]
#define kScaleKey @"scale_layer"
#define kWeakSelf __weak typeof(self) weakSelf = self;
#define STDefaultVideoPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Movie.mov"]
@implementation STBeautyView

// 1.重写initWithFrame:方法，创建子控件并添加到自己上面
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        //加载子空间
        [self takePictureBtn];
        [self changeCameraBtn];
        [self openBeautyBtn];
        [self lightBtn];
        [self savePictureBtn];
        [self cancelPictureBtn];
    }
    return self;
}
// 2.重写layoutSubviews，给自己内部子控件设置frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    //拍色照片
    self.takePictureBtn.frame = CGRectMake(100, 328, 60, 60);
    [self.takePictureBtn setTitle:@"拍"
                         forState:UIControlStateNormal];
    self.takePictureBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.takePictureBtn];
    //切换摄像头
    self.changeCameraBtn.frame = CGRectMake(8, 28, 30, 30);
    [self.changeCameraBtn setTitle:@"切"
                          forState:UIControlStateNormal];
    self.changeCameraBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.changeCameraBtn];
    //美颜
    self.openBeautyBtn.frame = CGRectMake(8+30+10, 28, 30, 30);
    [self.openBeautyBtn setTitle:@"美"
                        forState:UIControlStateNormal];
    self.openBeautyBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.openBeautyBtn];
    //闪关灯
    self.lightBtn.frame =  CGRectMake(8+30*2+30, 28, 30, 30);
    [self.lightBtn setTitle:@"灯"
                   forState:UIControlStateNormal];
    self.lightBtn.backgroundColor = [UIColor redColor];
    self.lightBtn.hidden = YES;
    [self addSubview:self.lightBtn];
    
    //保存照片
    //    self.savePictureBtn.hidden = YES;
    self.savePictureBtn.frame = CGRectMake(SCREEN_WIDTH-100, SCREEN_HEIGHT-100, 30, 30);
    [self.savePictureBtn setTitle:@"存"
                         forState:UIControlStateNormal];
    [self.savePictureBtn addTarget:self
                            action:@selector(savePictureAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    self.savePictureBtn.backgroundColor = [UIColor redColor];
    //    [self bringSubviewToFront:self.savePictureBtn];
    [self addSubview:self.savePictureBtn];
    // 不保存照片
    //    self.cancelPictureBtn.hidden = YES;
    self.cancelPictureBtn.frame = CGRectMake(100, SCREEN_HEIGHT-100, 30, 30);
    [self.cancelPictureBtn setTitle:@"消"
                           forState:UIControlStateNormal];
    [self.cancelPictureBtn addTarget:self
                              action:@selector(cancelSavePictureAction:)
                    forControlEvents:UIControlEventTouchUpInside];
    self.cancelPictureBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.cancelPictureBtn];
}
// 3.调用模型的set方法，给书的子控件赋值，

#pragma mark -- 拍照
- (UIButton *)takePictureBtn{
    if (!_takePictureBtn) {
        _takePictureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_takePictureBtn setBackgroundImage:[UIImage imageNamed:@"camera_btn_camera_normal_87x87_"]
                                   forState:UIControlStateNormal];
        [_takePictureBtn setBackgroundImage:[UIImage imageNamed:@"camera_btn_camera_normal_87x87_"]
                                   forState:UIControlStateHighlighted];
        [_takePictureBtn addTarget:self
                            action:@selector(startTakePicture:)
                  forControlEvents:UIControlEventTouchDown];
        [_takePictureBtn addTarget:self action:@selector(endTakePicture:)
                  forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    }
    return _takePictureBtn;
}
#pragma mark -- 开始 录制
-  (void)startTakePicture:(UIButton *)sender{
    
    unlink([[self moviePath] UTF8String]);
    // 需要隐藏所有
    //    [self hideAllFunctionButton:YES];
    //    self.cancelPictureBtn.hidden = YES;
    //    self.savePictureBtn.hidden = YES;
    //Layer  处理
    [self.layer addSublayer:[self cycleLayer]];
    [self.layer addSublayer:[self progressLayer]];
    [self.layer addSublayer:[self ballLayer]];
    //美颜下
    [[self leveBeautyFilter] addTarget:[self movieWriter]];
    //开始录制
    [[self movieWriter] startRecording];
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerupdating)];
    _timer.frameInterval = 3;
    [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _allTime = 0;
}
- (void)timerupdating {
    _allTime += 0.05;
    [self updateProgress:_allTime / kLimitRecLen];
}
- (void)updateProgress:(CGFloat)value {
    //    NSAssert(value <= 1.0 && value >= 0.0, @"Progress could't accept invail number .");
    if (value > 1.0) {
        [self endTakePicture:nil];
    }else {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:kRecordCenter
                                                            radius:kRecordW / 2 startAngle:- M_PI_2 endAngle:2 * M_PI * (value) - M_PI_2
                                                         clockwise:YES];
        if (value - 0.1 <= CGFLOAT_MIN) {
            CGFloat val = value / 0.1;
            UIBezierPath *ballpath = [UIBezierPath bezierPathWithArcCenter:kRecordCenter
                                                                    radius:(kRecordW / 2  - 10) *val startAngle:0 endAngle:2 * M_PI clockwise:YES];
            self.ballLayer.path = ballpath.CGPath;
        }
        self.progressLayer.path = path.CGPath;
    }
}
#pragma mark -- 结束录制
- (void)endTakePicture:(UIButton *)sender{
    if (!_timer) {
        return;
    }
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    if (self.cycleLayer)
    {
        [self.cycleLayer removeFromSuperlayer];
    }
    if (self.progressLayer) {
        [self.progressLayer removeFromSuperlayer];
    }
    if (self.ballLayer) {
        [[self ballLayer] removeFromSuperlayer];
    }
    if ( self.leveBeautyFilter) {
        [self.leveBeautyFilter removeTarget:self.movieWriter];
    }
    if (_allTime < 0.5) {
        [self.movieWriter finishRecording];        // 储存到图片库,并且设置回调.
        
        
        sender.hidden = YES;
        self.cancelPictureBtn.hidden = NO;
        self.savePictureBtn.hidden = NO;
        [self bringSubviewToFront:self.savePictureBtn];
        
        
        
        kWeakSelf
        [self.videoCamera capturePhotoAsImageProcessedUpToFilter:self.leveBeautyFilter
                                           withCompletionHandler:^(UIImage *processedImage,
                                                                   NSError *error) {
                                               // _tempImg = processedImage;
                                               [self createNewWritter];
                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                   [weakSelf imageView].frame = weakSelf.frame;
                                                   [weakSelf addSubview:weakSelf.imageView];
                                                   [weakSelf.imageView setImage:processedImage];
                                                   weakSelf.imageView.hidden = NO;
                                               });
                                           }];
        
    }else {
        // 储存到图片库,并且设置回调.
        kWeakSelf
        [self.movieWriter finishRecordingWithCompletionHandler:^{
            [self createNewWritter];
            dispatch_async(dispatch_get_main_queue(), ^{
                _avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:[AVPlayer playerWithURL:[NSURL fileURLWithPath:STDefaultVideoPath]]];
                _avPlayerLayer.frame = weakSelf.bounds;
                [self.layer insertSublayer:_avPlayerLayer above:self.cameraView.layer];
                [_avPlayerLayer.player play];
            });
        }];
    }
}
- (void)createNewWritter {
    
    _movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:[NSURL fileURLWithPath:self.moviePath]
                                                            size:CGSizeMake(kCameraWidth, kCameraWidth)
                                                        fileType:AVFileTypeQuickTimeMovie
                                                  outputSettings:self.videoSettings];
    /// 如果不加上这一句，会出现第一帧闪现黑屏
    [[self videoCamera] addAudioInputsAndOutputs];
    _videoCamera.audioEncodingTarget = _movieWriter;
}
#pragma mark -- 切换摄像头
- (UIButton *)changeCameraBtn{
    if (!_changeCameraBtn) {
        _changeCameraBtn = [[UIButton alloc]init];
        [_changeCameraBtn addTarget:self
                             action:@selector(SwitchCamera:)
                   forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeCameraBtn;
}
- (void)SwitchCamera:(UIButton *)sender{
    [self.videoCamera pauseCameraCapture];//暂停 相机
    if (self.videoCamera.cameraPosition == AVCaptureDevicePositionBack) {
        [[self lightBtn] setHidden:YES]; // 闪光灯 功能关闭
    }else{
        [[self lightBtn] setHidden:NO];// 闪光灯按钮 显示
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.videoCamera rotateCamera];
        [self.videoCamera resumeCameraCapture];//恢复录制
    });
    
    [self performSelector:@selector(animationCamera) withObject:self afterDelay:0.2f];
}
- (void)animationCamera {
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = @"oglFlip";
    animation.subtype = kCATransitionFromRight;
    [self.cameraView.layer addAnimation:animation forKey:nil];
    
}
#pragma mark -- 美颜
- (UIButton *)openBeautyBtn{
    if (!_openBeautyBtn) {
        _openBeautyBtn = [[UIButton alloc]init];
    }
    return _openBeautyBtn;
}
#pragma mark -- 闪光灯
- (UIButton *)lightBtn{
    if (!_lightBtn) {
        _lightBtn = [[UIButton alloc]init];
        [_lightBtn addTarget:self
                      action:@selector(SwitchLight:)
            forControlEvents:UIControlEventTouchUpInside];
    }
    return _lightBtn;
}
#pragma mark -- 闪光灯 控制
- (void)SwitchLight:(UIButton *)sender{
    [self videoCamera];
    if (sender.tag == 0) {
        if ([self.videoCamera.inputCamera lockForConfiguration:nil]) {
            [self.videoCamera.inputCamera setTorchMode:AVCaptureTorchModeOn];
            [self.videoCamera.inputCamera setFlashMode:AVCaptureFlashModeOn];
            [self.videoCamera.inputCamera unlockForConfiguration];
            sender.tag = 1;
        }
    }
    else if (sender.tag == 1) {
        if ([self.videoCamera.inputCamera lockForConfiguration:nil]) {
            [self.videoCamera.inputCamera setTorchMode:AVCaptureTorchModeOff];
            [self.videoCamera.inputCamera setFlashMode:AVCaptureFlashModeOff];
            [self.videoCamera.inputCamera unlockForConfiguration];
            sender.tag = 0;
        }
    }
}
#pragma mark -- 保存照片Btn
- (UIButton *)savePictureBtn{
    if (!_savePictureBtn) {
        _savePictureBtn = [[UIButton alloc]init];
    }
    return _savePictureBtn;
}
-  (void)savePictureAction:(UIButton *)sender{
    if (self.imageView.image) {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, nil, nil);
    }else {
        UISaveVideoAtPathToSavedPhotosAlbum(STDefaultVideoPath, self, nil, nil);
    }
    [self cancelSavePictureAction:nil];
    
}
#pragma mark -- 取消保存 -事件
- (void)cancelSavePictureAction:(UIButton *)sender {
    if(_avPlayerLayer){
        [_avPlayerLayer.player pause];
        [_avPlayerLayer removeFromSuperlayer];
        _avPlayerLayer = nil;
    }
    [self.imageView  removeFromSuperview];
    self.takePictureBtn.hidden = NO;     //拍色按钮出现
}

#pragma mark -- 不保存照片Btn
- (UIButton *)cancelPictureBtn{
    if (!_cancelPictureBtn) {
        _cancelPictureBtn = [[UIButton alloc]init];
    }
    return _cancelPictureBtn;
}

- (GPUImageView *)cameraView{
    if (!_cameraView) {
        _cameraView = [[GPUImageView alloc]init];
        [_cameraView setFillMode:kGPUImageFillModePreserveAspectRatioAndFill];
        _cameraView.frame = self.frame;
        [self addSubview:_cameraView];
    }
    return _cameraView;
}
#pragma - videoCamera
- (GPUImageStillCamera *)videoCamera {
    if (!_videoCamera) {
        _videoCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionFront];
        _videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
        _videoCamera.horizontallyMirrorFrontFacingCamera = YES;
        _movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:[NSURL fileURLWithPath:self.moviePath]
                                                                size:CGSizeMake(540.0f,  960.0f)
                                                            fileType:AVFileTypeQuickTimeMovie
                                                      outputSettings:self.videoSettings];
        _videoCamera.audioEncodingTarget = _movieWriter;
    }
    
    [_videoCamera addTarget:[self leveBeautyFilter]];
    [_videoCamera startCameraCapture];
    return _videoCamera;
}
- (NSMutableDictionary *)videoSettings {
    if (!_videoSettings) {
        _videoSettings = [[NSMutableDictionary alloc] init];
        [_videoSettings setObject:AVVideoCodecH264 forKey:AVVideoCodecKey];
        [_videoSettings setObject:[NSNumber numberWithInteger:kCameraWidth] forKey:AVVideoWidthKey];
        [_videoSettings setObject:[NSNumber numberWithInteger:kCameraHeight] forKey:AVVideoHeightKey];
    }
    return _videoSettings;
}
#pragma - normalFilter
- (GPUImageFilterGroup *)normalFilter {
    if (!_normalFilter) {
        GPUImageFilter *filter = [[GPUImageFilter alloc] init]; //默认
        _normalFilter = [[GPUImageFilterGroup alloc] init];
        [(GPUImageFilterGroup *) _normalFilter setInitialFilters:[NSArray arrayWithObject: filter]];
        [(GPUImageFilterGroup *) _normalFilter setTerminalFilter:filter];
    }
    return _normalFilter;
}
- (LFGPUImageBeautyFilter *)leveBeautyFilter {
    if (!_leveBeautyFilter) {
        _leveBeautyFilter = [[LFGPUImageBeautyFilter alloc] init];
    }
    [_leveBeautyFilter addTarget:[self cameraView]];
    return _leveBeautyFilter;
}
#pragma - 存储路径
- (NSString *)moviePath {
    if (!_moviePath) {
        _moviePath = STDefaultVideoPath;
        NSLog(@"maru: %@",_moviePath);
    }
    return _moviePath;
}
- (CAShapeLayer *)progressLayer{
    if (!_progressLayer) {
        _progressLayer =  [CAShapeLayer layer];
        _progressLayer.lineWidth = 5.0f;
        _progressLayer.fillColor = nil;
        _progressLayer.strokeColor = kFaceUColor.CGColor;
        _progressLayer.lineCap = kCALineCapRound;
    }
    return _progressLayer;
}
- (CAShapeLayer *)ballLayer{
    if (!_ballLayer) {
        _ballLayer = [CAShapeLayer layer];
        _ballLayer.lineWidth = 1.0f;
        _ballLayer.fillColor = kFaceUColor.CGColor;
        _ballLayer.strokeColor = kFaceUColor.CGColor;
        _ballLayer.lineCap = kCALineCapRound;
    }
    return _ballLayer;
}
- (CAShapeLayer *)cycleLayer{
    if (!_cycleLayer) {
        _cycleLayer = [CAShapeLayer layer];
        _cycleLayer.lineWidth = 5.0f;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:kRecordCenter radius:kRecordW / 2 startAngle:0 endAngle:2 * M_PI clockwise:YES];
        _cycleLayer.path = path.CGPath;
        _cycleLayer.fillColor = nil;
        _cycleLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    
    return _cycleLayer;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
#pragma mark -- 录制时候影藏一些控件
- (void)hideAllFunctionButton:(BOOL)isHidden{
    self.changeCameraBtn.hidden = isHidden;
    self.openBeautyBtn.hidden = isHidden;
    self.takePictureBtn.hidden = isHidden;
    self.cancelPictureBtn.hidden = !isHidden;
    self.savePictureBtn.hidden = !isHidden;
}
@end

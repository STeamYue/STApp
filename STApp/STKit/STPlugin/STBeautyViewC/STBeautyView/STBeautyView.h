//
//  STBeautyView.h
//  STApp
//
//  Created by 岳克奎 on 2017/6/1.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"
#import <GPUImage.h>
#import "LFGPUImageBeautyFilter.h"
@interface STBeautyView : UIView <CAAnimationDelegate>
@property (nonatomic,strong)UIButton *takePictureBtn;    //拍照btn
@property (nonatomic,strong)UIButton *changeCameraBtn;   //切换摄像头
@property (nonatomic,strong)UIButton *openBeautyBtn;     //美颜btn
@property (nonatomic,strong)UIButton *lightBtn;          //闪光灯btn
@property (nonatomic,strong)UIButton *savePictureBtn;    //保存照片btn
@property (nonatomic,strong)UIButton *cancelPictureBtn;  //不保存照片btn

@property (nonatomic, strong) UIImageView *        imageView;
@property (nonatomic, strong) GPUImageView          *cameraView;
@property (nonatomic, strong) GPUImageStillCamera   *videoCamera;
@property (nonatomic, strong) GPUImageFilterGroup   *normalFilter;
@property (nonatomic, strong) GPUImageMovieWriter   *movieWriter;
@property (nonatomic, strong) LFGPUImageBeautyFilter *leveBeautyFilter;

@property (nonatomic, copy) NSString *moviePath;
@property (nonatomic, strong) NSMutableDictionary *videoSettings;
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, assign) CGFloat allTime;

@property (nonatomic, strong) CAShapeLayer   *cycleLayer;
@property (nonatomic, strong) CAShapeLayer   *progressLayer;
@property (nonatomic, strong) CAShapeLayer   *ballLayer;
@property (nonatomic, strong)  AVPlayerLayer *avPlayerLayer;
@end

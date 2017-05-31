//
//  STMoreViewCScrollView.h
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"

@interface STMoreViewCScrollView : STBaseView
@property (nonatomic,strong) UIView   *titleView;
@property (nonatomic,strong) UIScrollView   *scrollView;
@property (nonatomic,strong) NSMutableArray <NSString*>*titleMArray;  //存放标题
@property (nonatomic,strong) NSMutableArray <UIViewController*>*viewCMArray; //存放对应的ViewC
@end

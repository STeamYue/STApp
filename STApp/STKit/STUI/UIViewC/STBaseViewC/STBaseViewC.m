//
//  STBaseViewC.m
//  FanweApp
//
//  Created by 岳克奎 on 17/3/13.
//  Copyright © 2017年 xfg. All rights reserved.
//

#import "STBaseViewC.h"

@interface STBaseViewC ()

@end

@implementation STBaseViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ***************************** Public 公有方法“+”方法区域 **********************
#pragma mark - new < STBaseViewC *>
/**
 * @brief:  new ViewC methods
 *
 * @attention: 1. base class declaration 2.subclass implementation、
 */
+(STBaseViewC *)showSTBaseViewCOnSuperViewC:(UIViewController *)superViewC
                               andFrameRect:(CGRect)frameRect
                   andSTViewCTransitionType:(STViewCTransitionType)stViewCTransitionType
                                andComplete:(void(^)(BOOL finished,STBaseViewC *stBaseViewC))block{
    if (stViewCTransitionType == STViewCTransitionOfChild) {
        //① superViewC
        if (!superViewC) {
            if (block) {
                block(NO,nil);
            }
        }
        //② remove from superViewC
        for (UIViewController *oneViewC in superViewC.childViewControllers) {
            if ([oneViewC isKindOfClass:[self class]]) {
                [oneViewC removeFromParentViewController];
                [oneViewC.view removeFromSuperview];
            }
        }
    }
    //③ newViewC
    STBaseViewC *newViewC = [[self alloc]initWithNibName:NSStringFromClass([self class])
                                                  bundle:nil];
    NSLog(@"=======11===== %@",NSStringFromClass([self class]));
    //④ add child for superViewC
    if (stViewCTransitionType == STViewCTransitionOfChild) {
        //ViewC
        [newViewC.view setFrame:superViewC.view.frame];
        newViewC.view.frame = frameRect;
        //child
        [superViewC addChildViewController:newViewC];
        [superViewC.view addSubview:newViewC.view];
    }
    //⑤ record
    newViewC.recordSuperViewC = superViewC;
    //⑥ block
    if (block) {
        block(YES,newViewC);
    }
    //⑦ return
    return newViewC;
}

#pragma mark***************************** showRefresh *********************************
//-(void)showRefreshTableView:(UITableView *)tableView{
//    if (!tableView) {
//        return;
//    }
//    //上下拉刷新
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self
//                                                               refreshingAction:@selector(showHeaderRefresh)];
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    // 隐藏状态
//    header.stateLabel.hidden = YES;
//    
//    [[RefreshManager shareInstance]refreshOfheader:tableView
//                                  refreshGifHeader:header];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(showFooterRefresh)];
//}
//#pragma mark -- Header Refresh
//-(void)showHeaderRefresh{
//    _recordCurrentPage = 1;
//    [self showAPIData];
//}
//#pragma mark -- show footer refresh
//-(void)showFooterRefresh{
//    if (_hasNextPage) {
//        _recordCurrentPage++;
//        [self showAPIData];
//    }else{
//       // [[HUDHelper sharedInstance] tipMessage:@"没有更多的数据"];
//    }
//}
#pragma mark -- HttpRequestAPI (留个子类去实现)
-(void)showAPIData{
    //子类具体实现
}
#pragma mark -----设置键盘IQKey
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 50.0f;
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}



@end

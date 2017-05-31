//
//  StoreViewC.m
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "StoreViewC.h"
#import "ThirdIteamLayout.h"
@interface StoreViewC ()

@end

@implementation StoreViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (StoreView *)storeView{
    if (!_storeView) {
        _storeView = (StoreView *) [StoreView showSTBaseViewOnSuperView:self.view
                                                           andFrameRect:self.view.frame
                                                            andComplete:^(BOOL finished,
                                                                          STBaseView *stBaseView) {
            
        }];
       // _storeView.layout = [[ThirdIteamLayout alloc]init];
    }
    return _storeView;
}
@end

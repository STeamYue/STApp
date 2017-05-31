//
//  FindViewC.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "FindViewC.h"

@interface FindViewC ()

@end

@implementation FindViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (FindView *)findView{
    if (!_findView) {
        _findView =(FindView *) [FindView showSTBaseViewOnSuperView:self.view
                                                       andFrameRect:self.view.frame
                                                        andComplete:^(BOOL finished,
                                                                      STBaseView *stBaseView) {
            
        }];
    }
    return _findView;
}
@end

//
//  AttentionViewC.m
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "AttentionViewC.h"

@interface AttentionViewC ()

@end

@implementation AttentionViewC

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
- (AttentionView *)attentionView{
    if (!_attentionView) {
        _attentionView = (AttentionView *)[AttentionView showSTBaseViewOnSuperView:self.view
                                                                andFrameRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                                 andComplete:^(BOOL finished,
                                                                               STBaseView *stBaseView) {
                                                                     
                                                                 }];
    }
    return _attentionView;
}
@end

//
//  STBeautyViewC.m
//  STApp
//
//  Created by 岳克奎 on 2017/6/1.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBeautyViewC.h"

@interface STBeautyViewC ()

@end

@implementation STBeautyViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
- (STBeautyView *)stBeautyView{
    if (!_stBeautyView) {
        _stBeautyView = [[STBeautyView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:_stBeautyView];
    }
    return _stBeautyView;
}

@end

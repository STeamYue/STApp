//
//  LoginView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "LoginView.h"
#import "PopMenuCenter.h"
@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)showThirdLogin:(UIButton *)sender {
    PopMenuCenter *popMenuCenter = [PopMenuCenter sharePopMenuCenter];
    [popMenuCenter setStPopMenuShowState:STPopMenuShow];
}

@end

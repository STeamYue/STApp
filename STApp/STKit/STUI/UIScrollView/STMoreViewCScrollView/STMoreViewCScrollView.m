//
//  STMoreViewCScrollView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STMoreViewCScrollView.h"

@implementation STMoreViewCScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    }
    return _titleView;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0,44, SCREEN_WIDTH, SCREEN_HEIGHT-50-50);
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, 0);
    }
    return _scrollView;
}
@end

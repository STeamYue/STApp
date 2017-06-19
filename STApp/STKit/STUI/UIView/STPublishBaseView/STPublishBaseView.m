//
//  STPublishBaseView.m
//  STApp
//
//  Created by 岳克奎 on 2017/6/2.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STPublishBaseView.h"

@implementation STPublishBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataSourceMArray{
    if (!_dataSourceMArray) {
        _dataSourceMArray  = @[].mutableCopy;
    }
    return  _dataSourceMArray;
}
@end

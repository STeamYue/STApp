//
//  STPublishBaseView.h
//  STApp
//
//  Created by 岳克奎 on 2017/6/2.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STPublishBaseView : UIView <UITabBarDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView    *tableView;
@property (nonatomic, strong)NSMutableArray *dataSourceMArray;
@end

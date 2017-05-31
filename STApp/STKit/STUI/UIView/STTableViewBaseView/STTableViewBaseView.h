//
//  STTableViewBaseView.h
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STBaseView.h"
#import "STNavBarView.h"
@class STTableViewBaseView;
@protocol STTableViewBaseViewDelegate <NSObject>
@optional
-(void)showTableViewDidSelectIndexpath:(NSIndexPath *)indexPath
                andSTTableViewBaseView:(STTableViewBaseView *)stTableViewBaseView;
@end
@interface STTableViewBaseView : STBaseView <UITableViewDelegate,UITableViewDataSource,STNavBarViewDelegate>
//@property(nonatomic,strong) STNavView                      *stNavView;   //custom stNavView
//@property(nonatomic,strong) STNavBarView                   *stNavBarView;
@property (nonatomic,strong)UITableView                    *tableView;
@property (nonatomic,strong)NSMutableArray                 *dataSoureArray;
@property (nonatomic,weak) id<STTableViewBaseViewDelegate> baseDelegate;
@end

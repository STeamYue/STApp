//
//  STTableViewBaseView.m
//  STImgPickerC
//
//  Created by 岳克奎 on 17/3/28.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STTableViewBaseView.h"

@implementation STTableViewBaseView
#pragma mark *********************** Left  cycle *********************
#pragma mark  -- initWithFrame
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        if(!_dataSoureArray){
//            _dataSoureArray = @[].mutableCopy;
//        }
//        if (!_tableView) {
//            [self tableView];
//        }
//        if (!_stNavView) {
//            [self stNavView];
//        }
//    }
//    return self;
//}
#pragma mark  --
//- (void)layoutSubviews {
//    [super layoutSubviews];
//   
//}
#pragma *************************** Getter ***************************
#pragma mark --- stNavView
//-(STNavBarView *)stNavBarView{
//    if (!_stNavBarView) {
//        _stNavBarView =(STNavBarView *)[STNavBarView showSTBaseViewOnSuperView:self
//                                                                  andFrameRect:CGRectMake(0,0,SCREEN_WIDTH,64)
//                                                                   andComplete:^(BOOL finished,
//                                                                                 STBaseView *stBaseView) {
//        }];
//        [_stNavBarView setDelegate:self];
//    }
//    return _stNavBarView;
//}
#pragma mark --- tableView
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT-74)
                                                 style:UITableViewStylePlain];
//        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    return  _tableView;
}
#pragma *************************** Delegate ***************************
#pragma *************************** Delegate of <STNavBarViewDelegate>
#pragma ----LeftBtnEventResponse
-(void)showEventResponseOfLeftBtnOnSTNavCView:(STNavBarView *)stNavBarView{
}
#pragma ----RightBtnEventResponse
-(void)showEventResponseOfRightBtnOnSTNavCView:(STNavBarView *)stNavBarView{
}
#pragma *************************** Delegate of <UITableViewDelegate>
#pragma ---- row
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"====3333======== %lu",(unsigned long)_dataSoureArray.count);
    return _dataSoureArray.count;
}
#pragma ---- cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma *************************** Delegate of <UITableViewDataSource>
#pragma ---- rowHeight
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
#pragma ----section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma ----sectionHeaderView-Hight
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
#pragma ---sectionHeaderView-Color
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor clearColor];
}
#pragma ---did Select
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_baseDelegate &&[_baseDelegate respondsToSelector:@selector(showTableViewDidSelectIndexpath:andSTTableViewBaseView:)]) {
        [_baseDelegate showTableViewDidSelectIndexpath:indexPath andSTTableViewBaseView:self];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//      CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"=======  %f    ---00------",offsetY);
//    
////    _tableView.transform = CGAffineTransformMakeTranslation(0, -scrollView.contentOffset.y);
//    if (offsetY>=0) {
//        _stNavBarView.alpha = offsetY<64?1-offsetY/64:0;
//    }
   
}
#pragma ************************ Getter *****************************
#pragma ************************ Setter *****************************
#pragma mark --- baseDelegate
-(void)setBaseDelegate:(id<STTableViewBaseViewDelegate>)baseDelegate{
    _baseDelegate = baseDelegate;
}
#pragma mark - dataSoureArray
-(void)setDataSoureArray:(NSMutableArray *)dataSoureArray{
    _dataSoureArray = dataSoureArray;
    if (!_tableView) {
        [self tableView];
    }
    [_tableView reloadData];
}

@end



















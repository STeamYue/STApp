//
//  DynamicView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "DynamicView.h"
#import "DynamicCell.h"
#import "DynamicHeaderView.h"
@implementation DynamicView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    DynamicHeaderView *dynamicHeaderView = [[DynamicHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    [self tableView].tableHeaderView = dynamicHeaderView;
    [self tableView].frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100);
    self.dataSoureArray = @[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"].mutableCopy;
    [self registCell];
}

- (void)registCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"DynamicCell"
                                               bundle:nil]
         forCellReuseIdentifier:@"DynamicCell"];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DynamicCell" forIndexPath:indexPath];
    return cell;
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 380;
}
@end

//
//  AttentionView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "AttentionView.h"
#import "AttentionCell.h"
@implementation AttentionView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self tableView].frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100);
    self.dataSoureArray = @[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"].mutableCopy;
    [self registCell];
}

- (void)registCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"AttentionCell"
                                               bundle:nil]
         forCellReuseIdentifier:@"AttentionCell"];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionCell" forIndexPath:indexPath];
    return cell;
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end

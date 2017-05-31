//
//  StoreView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "StoreView.h"
#import "StoreCell.h"
#import "ThirdIteamLayout.h"
@implementation StoreView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.dataSoureArray = @[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"].mutableCopy;
    [self setLayout:[ThirdIteamLayout new]];
    [self collectionView];
    [self registeCell];
}

- (void) registeCell{

    [self.collectionView registerNib:[UINib nibWithNibName:@"StoreCell"
                                                    bundle:nil]
          forCellWithReuseIdentifier:@"StoreCell"];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StoreCell"
                                                                forIndexPath:indexPath];
    return cell;
}
@end

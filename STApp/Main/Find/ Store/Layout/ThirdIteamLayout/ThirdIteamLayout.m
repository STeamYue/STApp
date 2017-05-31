//
//  ThirdIteamLayout.m
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "ThirdIteamLayout.h"

@implementation ThirdIteamLayout
//因为每次重新给出layout时都会调用prepareLayout，这样在以后如果有collectionView大小变化的需求时也可以自动适应变化
- (void)prepareLayout
{
    [super prepareLayout];
    [self setupLayout];
}
- (void)setupLayout
{
    //滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionVertical;

        // 设置大小
        self.itemSize =CGSizeMake((SCREEN_WIDTH-3*8)/3,(SCREEN_WIDTH-3*8)/3);
        self.sectionInset = UIEdgeInsetsMake(0,0,0,0);
        self.minimumInteritemSpacing=1;
}
@end

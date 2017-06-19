//
//  StoreView.h
//  STApp
//
//  Created by 岳克奎 on 17/5/30.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "STTableViewBaseView.h"
#import "STEvenLyCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"
@interface StoreView : STEvenLyCollectionView <CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong) NSArray *cellSizes;
@end

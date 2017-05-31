//
//  STEvenLyCollectionView.h
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STBaseView.h"
@interface STEvenLyCollectionView : STBaseView <UICollectionViewDelegate,UICollectionViewDataSource>
@property  (nonatomic,strong)UICollectionView      *collectionView;
@property (nonatomic,strong)NSMutableArray         *dataSoureArray;
@property (nonatomic,strong)UICollectionViewLayout *layout;
@end

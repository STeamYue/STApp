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
    self.dataSoureArray = @[@"美颜相机",@"运动健康",@"图文转换",@"实时天气",@"悦读FM",@"二维码扫描"].mutableCopy;
      CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    layout.headerHeight = 0;
    layout.footerHeight = 0;
    layout.minimumColumnSpacing = 8;
    layout.minimumInteritemSpacing = 8;
    [self setLayout:layout];
    [self collectionView].frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100);
    [self registeCell];
}

- (void) registeCell{

    [self.collectionView registerNib:[UINib nibWithNibName:@"StoreCell"
                                                    bundle:nil]
          forCellWithReuseIdentifier:@"StoreCell"];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StoreCell"
                                                                forIndexPath:indexPath];
    cell.themeLab.text = self.dataSoureArray[indexPath.row];
    cell.themeImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"test_%ld",(long)indexPath.row]];
    return cell;
}
#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}
- (NSArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(400, 550)],
                       [NSValue valueWithCGSize:CGSizeMake(1000, 665)],
                       [NSValue valueWithCGSize:CGSizeMake(1024, 689)],
                       [NSValue valueWithCGSize:CGSizeMake(640, 427)]
                       ];
    }
    return _cellSizes;
}
@end

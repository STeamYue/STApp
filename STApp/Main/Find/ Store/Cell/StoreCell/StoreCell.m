//
//  StoreCell.m
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "StoreCell.h"

@implementation StoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _themeImgView.layer.shadowColor = [[UIColor blackColor]CGColor];
    _themeImgView.layer.shadowOffset = CGSizeMake(8,8);
    _themeImgView.layer.shadowOpacity = 0.5;
    _themeImgView.layer.shadowRadius=2.0;
//    _themeImgView.layer.cornerRadius = 4;
//    _themeImgView.layer.masksToBounds = YES;
}

@end

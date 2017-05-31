//
//  DynamicModel.h
//  STApp
//
//  Created by 岳克奎 on 17/5/31.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicModel : NSObject
@property (nonatomic, strong)NSString *themeStr;        //主题
@property (nonatomic, strong)NSString *showUrlStr;      //主页展示的照片/视频 地址
@property (nonatomic, strong)NSString *userHeaderImgStr; //个人头像
@property (nonatomic, strong)NSString *userNameStr;     //名称
@property (nonatomic, strong)NSString *userIdStr;       //Id
@property (nonatomic, strong)NSString *departmentStr;   //院系
@end


//
//  FindView.m
//  STApp
//
//  Created by 岳克奎 on 17/5/29.
//  Copyright © 2017年 SlienceTeam. All rights reserved.
//

#import "FindView.h"
#import "StoreViewC.h"
#import "DynamicViewC.h"
#import "AttentionViewC.h"
@implementation FindView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        //因没实力化，子控件要在from nib 写
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self showInit];
}
#pragma mark - 初始化设置
- (void)showInit{
    [self addSubview: [self scrollView]];   //添加scrollView
    [self addSubview: [self titleView]];  //添加 titleView
    //self.scrollView.pagingEnabled = YES;  //设置分页
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    //默认0
    //    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    //间距
    self.titleMArray = @[@"关注",@"动态",@"好玩"].mutableCopy; //设置标题
    CGFloat spaceValue = (SCREEN_WIDTH-self.titleMArray.count*60)/(self.titleMArray.count+1);
    @autoreleasepool {
        for (int i = 0; i<self.titleMArray.count;i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((spaceValue+30)*(i+1),20,60, 30)];
            btn.backgroundColor = [UIColor greenColor];
            btn.tag = i+1;
            [btn setTitle:self.titleMArray[i]
                 forState:UIControlStateNormal];
            [btn addTarget:self
                    action:@selector(showSelectViewC:)
          forControlEvents:UIControlEventTouchUpInside];
            [[self titleView] addSubview:btn];
        }
    }
    //
    AttentionViewC *attentionViewC = (AttentionViewC *)[AttentionViewC showSTBaseViewCOnSuperViewC:self.recordSupreViewC
                                                                                      andFrameRect:CGRectMake(0, 0, 0, 0)
                                                                          andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                                       andComplete:^(BOOL finished,
                                                                                                     STBaseViewC *stBaseViewC) {
                                                                                           
                                                                                       }];
    attentionViewC.view.backgroundColor = [UIColor redColor];
    
    DynamicViewC *dynamicViewC = (DynamicViewC *)[DynamicViewC showSTBaseViewCOnSuperViewC:self.recordSupreViewC
                                                                              andFrameRect:CGRectMake(0, 0, 0, 0)
                                                                  andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                               andComplete:^(BOOL finished,
                                                                                             STBaseViewC *stBaseViewC) {
                                                                                   
                                                                               }];
    dynamicViewC.view.backgroundColor = [UIColor greenColor];
    StoreViewC *storeViewC = (StoreViewC *)[StoreViewC showSTBaseViewCOnSuperViewC:self.recordSupreViewC
                                                                      andFrameRect:CGRectMake(0, 0, 0, 0)
                                                          andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                       andComplete:^(BOOL finished,
                                                                                     STBaseViewC *stBaseViewC) {
                                                                           
                                                                       }];
    storeViewC.view.backgroundColor = [UIColor grayColor];
    
    self.viewCMArray = @[attentionViewC,dynamicViewC,storeViewC].mutableCopy;
    @autoreleasepool {
        for (int i = 0 ; i<self.viewCMArray.count;i++)
        {
            UIViewController *viewC = self.viewCMArray[i];
            viewC.view.frame = CGRectMake(SCREEN_WIDTH*i,44, SCREEN_WIDTH, SCREEN_HEIGHT-50);
            [self.scrollView addSubview:viewC.view];
        }
    }
}
- (void)showSelectViewC:(UIButton *)sender{
    if (_recordSelectBtn.tag == sender.tag) {
        return;
    }
    if (_recordSelectBtn) {
        [_recordSelectBtn setTitleColor:[UIColor whiteColor]
                               forState:UIControlStateNormal];
    }
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[self scrollView] setContentOffset:CGPointMake(SCREEN_WIDTH*(sender.tag-1),0)
                               animated:YES];
    _recordSelectBtn = sender;
    
}

@end

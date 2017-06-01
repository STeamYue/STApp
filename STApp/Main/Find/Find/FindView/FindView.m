
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
    self.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview: [self titleView]];  //添加 titleView
    self.scrollView.pagingEnabled = YES;  //设置分页
     self.scrollView.showsHorizontalScrollIndicator = NO;
   self.scrollView.showsVerticalScrollIndicator = NO;
    //默认0
    //    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    //间距
    self.titleMArray = @[@"关注",@"动态",@"好玩"].mutableCopy; //设置标题
    CGFloat spaceValue = (SCREEN_WIDTH-self.titleMArray.count*60)/(self.titleMArray.count+1);
    @autoreleasepool {
        for (int i = 0; i<self.titleMArray.count;i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((spaceValue+30)*(i+1),20,60, 30)];
            [btn setTitleColor:[UIColor lightGrayColor]
                      forState:UIControlStateNormal];
            btn.tag = i+1;
            [btn setTitle:self.titleMArray[i]
                 forState:UIControlStateNormal];
            [btn addTarget:self
                    action:@selector(showSelectViewC:)
          forControlEvents:UIControlEventTouchUpInside];
            [[self titleView] addSubview:btn];
                //默认第二个
            if (i == 1) {
                [self showSelectViewC:btn];
            }
            
        }
    }
    //
    AttentionViewC *attentionViewC = (AttentionViewC *)[AttentionViewC showSTBaseViewCOnSuperViewC:nil
                                                                                      andFrameRect: CGRectMake(0,0,0,0)
                                                                          andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                                       andComplete:^(BOOL finished,
                                                                                                     STBaseViewC *stBaseViewC) {
                                                                                           
                                                                                       }];
    [attentionViewC attentionView];
    DynamicViewC *dynamicViewC = (DynamicViewC *)[DynamicViewC showSTBaseViewCOnSuperViewC:nil
                                                                              andFrameRect: CGRectMake(0,0,0,0)
                                                                  andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                               andComplete:^(BOOL finished,
                                                                                             STBaseViewC *stBaseViewC) {
                                                                                   
                                                                               }];
    [dynamicViewC dynamicView];
    StoreViewC *storeViewC = (StoreViewC *)[StoreViewC showSTBaseViewCOnSuperViewC:nil
                                                                      andFrameRect:CGRectMake(0 ,0,0,0)
                                                          andSTViewCTransitionType:STViewCTransitionTypeOfPush
                                                                       andComplete:^(BOOL finished,
                                                                                     STBaseViewC *stBaseViewC) {
                                                                           
                                                                       }];
    [storeViewC storeView];
    self.viewCMArray = @[attentionViewC,dynamicViewC,storeViewC].mutableCopy;
    @autoreleasepool {
        for (int i = 0 ; i<self.viewCMArray.count;i++)
        {
            UIViewController *viewC = self.viewCMArray[i];
            viewC.view.frame = CGRectMake(self.scrollView.frame.size.width*i,0,self.scrollView.frame.size.width,self.scrollView.frame.size.height);
            [self.scrollView addSubview:viewC.view];
        }
    }
}
- (void)showSelectViewC:(UIButton *)sender{
    if (_recordSelectBtn.tag == sender.tag) {
        return;
    }
    if (_recordSelectBtn) {
        [_recordSelectBtn setTitleColor:[UIColor lightGrayColor]
                               forState:UIControlStateNormal];
    }
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[self scrollView] setContentOffset:CGPointMake(SCREEN_WIDTH*(sender.tag-1),0)
                               animated:YES];
    _recordSelectBtn = sender;
    
}

@end

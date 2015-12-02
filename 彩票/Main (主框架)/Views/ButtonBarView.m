//
//  ButtonBarView.m
//  彩票
//
//  Created by Jusive on 15/11/30.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "ButtonBarView.h"
#import "BottomBarButton.h"

@interface ButtonBarView ();
@property (nonatomic,weak) UIButton *selectedButton;
@end
@implementation ButtonBarView

-(void)addBottonBarButtonWithImageName:(NSString *)normal Selected:(NSString *)selected{
    BottomBarButton *button = [[BottomBarButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [self addSubview:button];
    
    //为button添加一个单击事件
    [button addTarget:self action:@selector(didClickButtomBarButton:) forControlEvents:UIControlEventTouchDown];
    
}
  //底部按钮的单击事件
-(void)didClickButtomBarButton:(UIButton *)sender{
   //点击按钮让当前的按钮selected为Yes
    //先让选中为no 传递过来的时候为yes,这样才会点击谁就是谁
    
  self.selectedButton.selected = NO;
   sender.selected = YES;
    //获取索引
    int idx = (int)sender.tag;
    self.selectedButton = sender;
    //根据当前点击的按钮索引,切换TabBar控制器, 显示当前子控制器
    if ([self.delegate respondsToSelector:@selector(ButtonBarView:didClickuttomWhitIndex:)]) {
        [self.delegate ButtonBarView:self didClickuttomWhitIndex:idx];
    }
}
 //布局按钮frame
-(void)layoutSubviews{
    [super layoutSubviews];
       CGFloat w = self.bounds.size.width / self.subviews.count;
        CGFloat h = self.bounds.size.height;
        CGFloat y = 0;
    for (int i = 0; i < self.subviews.count; i++) {
        CGFloat x = i * w;
        UIButton *button = self.subviews[i];
        //为每个按钮绑定一个tag
        button.tag =  i;
        button.frame = CGRectMake(x, y, w, h);
    }
}
@end

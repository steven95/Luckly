
//
//  mainController.m
//  彩票
//
//  Created by Jusive on 15/11/30.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "mainController.h"
#import "ButtonBarView.h"

@interface mainController ()<ButtonBarViewDeletage>

@end

@implementation mainController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载子控制器
    [self loadSubController];
    //加载自定义底部TabBar
    ButtonBarView *bttomBer = [[ButtonBarView alloc]init];
    bttomBer.delegate = self;
    //创建按钮
    for (int i = 0; i < self.viewControllers.count; i ++) {
        NSString *normal = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selected = [NSString stringWithFormat:@"TabBar%dSel", (i + 1)];
        [bttomBer addBottonBarButtonWithImageName:normal Selected:selected];
    }
    bttomBer.frame = self.tabBar.bounds;
    [self.tabBar addSubview:bttomBer];
    // Do any additional setup after loading the view.
}
-(void)ButtonBarView:(ButtonBarView *)buttomBarView didClickuttomWhitIndex:(int)idx{
    self.selectedIndex = idx;
}
//封装一个根据storyboard文件创建控制器的方法
-(UINavigationController *)navigationControllerWithStoryboardName:(NSString *)name{

    //加载storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyboard instantiateInitialViewController];
    
                                
}
//封装一个创建TabbarController的方法
-(void)loadSubController{
    UINavigationController *navHall = [self navigationControllerWithStoryboardName:@"Hall"];
    UINavigationController *navArena = [self navigationControllerWithStoryboardName:@"ArenaTow"];
    UINavigationController *navDiscover = [self navigationControllerWithStoryboardName:@"Discover"];
    UINavigationController *navGuide = [self navigationControllerWithStoryboardName:@"Guide"];
    
    UINavigationController *navHistory = [self navigationControllerWithStoryboardName:@"History"];
    UINavigationController *navMyLottery = [self navigationControllerWithStoryboardName:@"MyLottery"];
    
    self.viewControllers = @[navHall,navArena,navDiscover,navHistory,navMyLottery];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

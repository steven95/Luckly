//
//  AppDelegate.m
//  彩票
//
//  Created by Jusive on 15/11/30.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "AppDelegate.h"
#import "mainController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    mainController *main = [[mainController alloc]init];
    //设置根控制器
    self.window.rootViewController = main;
    
    [self setStatusBarStyle:application];
    
    [self setNavigationBarStyle];
    //设置主窗口
    [self.window makeKeyAndVisible];
    return YES;
}


//统一设置状态栏外观
-(void)setStatusBarStyle:(UIApplication *)application{
    application.statusBarHidden = YES;
    application.statusBarStyle = UIStatusBarStyleLightContent;
}
//统一设置导航栏外观
-(void)setNavigationBarStyle{
    //获取导航栏的外观代理对象
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置背景
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"]forBarMetrics:UIBarMetricsDefault];
    //设置标题栏文字
    NSDictionary *arrts = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [bar setTitleTextAttributes:arrts];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

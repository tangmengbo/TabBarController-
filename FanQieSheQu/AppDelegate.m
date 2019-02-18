//
//  AppDelegate.m
//  AppProduction
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"



NSString *NTESNotificationLogout = @"NTESNotificationLogout";

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    
    FirstViewController * noticeVC = [[FirstViewController alloc] init];
    noticeVC.title = @"notice";
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:noticeVC];
    
    UINavigationController * nav2;
    SecondViewController * homeVC = [[SecondViewController alloc] init];
    homeVC.title = @"home";
    nav2 = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    ThirdViewController * ownerVC = [[ThirdViewController alloc] init];
    ownerVC.title = @"owner";
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:ownerVC];
    
    NSArray * array = [[NSArray alloc] initWithObjects:nav1,nav2,nav3, nil];
    self.rootBar = [[SJTabBarController alloc] init];
    self.rootBar.viewControllers = array;
    self.window.rootViewController = self.rootBar;
    

    
    return YES;
}



#pragma mark - ApplicationDelegate
- (void)applicationWillResignActive:(UIApplication *)application {
    
}




-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}
-(void)applicationDidEnterBackground:(UIApplication *)application
{

}

@end

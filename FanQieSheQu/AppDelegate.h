//
//  AppDelegate.h
//  AppProduction
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SJTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface AppDelegate : UIResponder 
{
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong)SJTabBarController * rootBar;

@end


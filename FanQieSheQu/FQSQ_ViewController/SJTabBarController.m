//
//  SJTabBarController.m
//  SajiaoShopping
//
//  Created by 鸣 王 on 15/10/10.
//  Copyright © 2015年 唐蒙波. All rights reserved.
//

#import "SJTabBarController.h"

#define SafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 35 : 20)
#define SafeAreaBottomHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 85 : 70)

//当前设置的宽、高
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SJTabBarController ()

@end

@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    for(UIView *view in self.view.subviews){

        if([view isKindOfClass:[UITabBar class]]){

            view.hidden = YES;

            break;

        }
    }
    [self initTabBar];
    
    self.transform = [[TabBar_Transformer alloc] init];
    self.delegate = self.transform;

}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    self.transform.selectedIndex = item.tag;
    self.transform.preIndex = self.selectedIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)initTabBar
{
    
    self.tabBar.backgroundColor = [UIColor clearColor];
    //设置为半透明
    self.tabBarController.tabBar.alpha = 0;
    
    self.bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT-(SafeAreaBottomHeight),VIEW_WIDTH ,SafeAreaBottomHeight)];
    self.bottomView.userInteractionEnabled = YES;
    self.bottomView.image = [UIImage imageNamed:@"Tabbar_bg"];
    [self.view addSubview:self.bottomView];
    
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH/3, 70)];
    self.button1.tag = 0;
    [self.button1 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    self.button1.backgroundColor = [UIColor clearColor];
    [self.bottomView addSubview:self.button1];
    
    
    self.homeImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake((self.button1.frame.size.width-34)/2, 16, 34, 34)];
    self.homeImageView1.image = [UIImage imageNamed:@"table_notice_n"];
    [self.button1 addSubview:self.homeImageView1];
    
    
    self.homeImageView2 = [[UIImageView alloc] initWithFrame:self.homeImageView1.frame];
    self.homeImageView2.image = [UIImage imageNamed:@"table_notice_h"];
    [self.button1 addSubview:self.homeImageView2];
    
    
    
    self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(VIEW_WIDTH/3, 0, VIEW_WIDTH/3, 70)];
    self.button2.tag = 1;
    [self.button2 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    self.button2.backgroundColor = [UIColor clearColor];
    [self.bottomView addSubview:self.button2];
    
    self.noticeImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake((self.button2.frame.size.width-50)/2, 0, 50, 50)];
    self.noticeImageView1.image = [UIImage imageNamed:@"tabbar_home_n"];
    [self.button2 addSubview:self.noticeImageView1];
    
    
    self.noticeImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH/3-135)/2, 0, 135, 50)];
    self.noticeImageView2.image = [UIImage imageNamed:@"tabbar_home_h"];
    [self.button2 addSubview:self.noticeImageView2];
    
    self.noticeImageView2.image = [UIImage imageNamed:@"Tabbar_shipinqunfa"];

   
    
    self.sliderView = [[UIImageView alloc] initWithFrame:CGRectMake((self.button2.frame.size.width-17)/2+self.button2.frame.origin.x, self.noticeImageView2.frame.origin.y+self.noticeImageView2.frame.size.height+7, 17, 5)];
    self.sliderView.image = [UIImage imageNamed:@"Tabbar_pic_huadong"];
    [self.bottomView addSubview:self.sliderView];

    
    self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(VIEW_WIDTH/3*2, 0, VIEW_WIDTH/3, 70)];
    self.button3.tag = 2;
    [self.button3 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    self.button3.backgroundColor = [UIColor clearColor];
    [self.bottomView addSubview:self.button3];
    
    
    self.centerImageView1 = [[UIImageView alloc] initWithFrame:self.homeImageView1.frame];
    self.centerImageView1.image = [UIImage imageNamed:@"tabbar_wode_n"];
    [self.button3 addSubview:self.centerImageView1];
    
    self.centerImageView2 = [[UIImageView alloc] initWithFrame:self.homeImageView1.frame];
    self.centerImageView2.image = [UIImage imageNamed:@"tabbar_wode_h"];
    [self.button3 addSubview:self.centerImageView2];
    
    


    

    self.homeLable1.hidden = NO;
    self.homeImageView1.hidden = NO;
    self.homeLable2.hidden = YES;
    self.homeImageView2.hidden = YES;
    
    self.noticeLable1.hidden = YES;
    self.noticeImageView1.hidden = YES;
    self.noticeLable2.hidden = NO;
    self.noticeImageView2.hidden = NO;
    
    self.centerLable1.hidden = NO;
    self.centerImageView1.hidden = NO;
    self.centerLable2.hidden = YES;
    self.centerImageView2.hidden = YES;
    
    
}
-(void)selectButton:(id)sender
{
   
    

    UIButton * button = (UIButton *)sender;
    if (button.tag ==0)
    {
        self.selectedIndex = 0;
        
        self.homeLable1.hidden = YES;
        self.homeImageView1.hidden = YES;
        self.homeLable2.hidden = NO;
        self.homeImageView2.hidden = NO;
        
        self.noticeLable1.hidden = NO;
        self.noticeImageView1.hidden = NO;
        self.noticeLable2.hidden = YES;
        self.noticeImageView2.hidden = YES;
        
        self.centerLable1.hidden = NO;
        self.centerImageView1.hidden = NO;
        self.centerLable2.hidden = YES;
        self.centerImageView2.hidden = YES;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        self.sliderView.frame = CGRectMake((self.button1.frame.size.width-17)/2+self.button1.frame.origin.x, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
        [UIView commitAnimations];
       
    }
    else if (button.tag ==1)
    {
      
        if (self.selectedIndex==1) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"zhuBoOrYongHuCenterClick" object:nil];
        }
        self.selectedIndex = 1;
       
        self.homeLable1.hidden = NO;
        self.homeImageView1.hidden = NO;
        self.homeLable2.hidden = YES;
        self.homeImageView2.hidden = YES;
        
        self.noticeLable1.hidden = YES;
        self.noticeImageView1.hidden = YES;
        self.noticeLable2.hidden = NO;
        self.noticeImageView2.hidden = NO;
        
        self.centerLable1.hidden = NO;
        self.centerImageView1.hidden = NO;
        self.centerLable2.hidden = YES;
        self.centerImageView2.hidden = YES;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        self.sliderView.frame = CGRectMake((self.button2.frame.size.width-17)/2+self.button2.frame.origin.x, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
        [UIView commitAnimations];

       
       
        
    }
    else if (button.tag ==2)
    {
        
        self.selectedIndex = 2;
        
        
        self.homeLable1.hidden = NO;
        self.homeImageView1.hidden = NO;
        self.homeLable2.hidden = YES;
        self.homeImageView2.hidden = YES;
        
        self.noticeLable1.hidden = NO;
        self.noticeImageView1.hidden = NO;
        self.noticeLable2.hidden = YES;
        self.noticeImageView2.hidden = YES;
        
        self.centerLable1.hidden = YES;
        self.centerImageView1.hidden = YES;
        self.centerLable2.hidden = NO;
        self.centerImageView2.hidden = NO;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        self.sliderView.frame = CGRectMake((self.button3.frame.size.width-17)/2+self.button3.frame.origin.x, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
        [UIView commitAnimations];
    }
   
}

-(void)setItemSelected:(int)index
{
        if (index ==0)
        {
            self.selectedIndex = 0;
            
            self.homeLable1.hidden = YES;
            self.homeImageView1.hidden = YES;
            self.homeLable2.hidden = NO;
            self.homeImageView2.hidden = NO;
            
            self.noticeLable1.hidden = NO;
            self.noticeImageView1.hidden = NO;
            self.noticeLable2.hidden = YES;
            self.noticeImageView2.hidden = YES;
            
            self.centerLable1.hidden = NO;
            self.centerImageView1.hidden = NO;
            self.centerLable2.hidden = YES;
            self.centerImageView2.hidden = YES;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            self.sliderView.frame = CGRectMake((self.button1.frame.size.width-17)/2+self.button1.frame.origin.x, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
            [UIView commitAnimations];
            
        }
        else if (index ==1)
        {
            
            self.selectedIndex = 1;
            
            self.homeLable1.hidden = NO;
            self.homeImageView1.hidden = NO;
            self.homeLable2.hidden = YES;
            self.homeImageView2.hidden = YES;
            
            self.noticeLable1.hidden = YES;
            self.noticeImageView1.hidden = YES;
            self.noticeLable2.hidden = NO;
            self.noticeImageView2.hidden = NO;
            
            self.centerLable1.hidden = NO;
            self.centerImageView1.hidden = NO;
            self.centerLable2.hidden = YES;
            self.centerImageView2.hidden = YES;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            self.sliderView.frame = CGRectMake((self.button2.frame.size.width-17)/2+self.button2.frame.origin.x, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
            [UIView commitAnimations];
            
        }
        else if (index ==2)
        {
            
            self.selectedIndex = 2;
            
            self.homeLable1.hidden = NO;
            self.homeImageView1.hidden = NO;
            self.homeLable2.hidden = YES;
            self.homeImageView2.hidden = YES;
            
            self.noticeLable1.hidden = NO;
            self.noticeImageView1.hidden = NO;
            self.noticeLable2.hidden = YES;
            self.noticeImageView2.hidden = YES;
            
            self.centerLable1.hidden = YES;
            self.centerImageView1.hidden = YES;
            self.centerLable2.hidden = NO;
            self.centerImageView2.hidden = NO;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            self.sliderView.frame = CGRectMake((self.button3.frame.size.width-17)/2+self.button3.frame.origin.x, self.sliderView.frame.origin.y, self.sliderView.frame.size.width, self.sliderView.frame.size.height);
            [UIView commitAnimations];
        }
    

}
- (void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
